//
//  RemminderViewController.swift
//  Today
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-26.
//

import UIKit


class ReminderViewController: UICollectionViewController {
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Row>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Row>
    
    var reminder: Reminder {
        didSet {
            onChange(reminder)
        }
    }
    
    var workingReminder: Reminder
    var isAddingNewReminder = false
    var onChange: (Reminder) -> Void
    private var dataSource: DataSource?


    init(reminder: Reminder, onChange: @escaping (Reminder) -> Void) {
        self.reminder = reminder
        self.workingReminder = reminder
        self.onChange = onChange
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        listConfiguration.headerMode = .firstItemInSection
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Always initialize ReminderViewController using init(reminder:)")
    }
    
    override func viewDidLoad() {
        print("View Calling")
        super.viewDidLoad()
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Row) in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        navigationItem.style = .navigator
        navigationItem.title = NSLocalizedString("Reminder", comment: "Reminder view controller title")
        navigationItem.rightBarButtonItem = editButtonItem
        updateSnapshotForViewing()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            prepareForEditing()
        } else {
            if isAddingNewReminder {
                onChange(workingReminder)
            } else {
                prepareForViewing()
            }
        }
    }


    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, row: Row) {
        let section = section(for: indexPath)
        print("cell reg call", indexPath, section, row)
        switch (section, row) {
            case (_, .header(let title)):
                cell.contentConfiguration = headerConfiguration(for: cell, with: title)
            case (.view, _):
                cell.contentConfiguration = defaultConfiguration(for: cell, at: row)
            case (.title, .editableText(let title)):
                cell.contentConfiguration = titleConfiguration(for: cell, with: title)
            case (.date, .editableDate(let date)):
                cell.contentConfiguration = dateConfiguration(for: cell, with: date)
            case (.notes, .editableText(let notes)):
                cell.contentConfiguration = notesConfiguration(for: cell, with: notes)
            default:
                fatalError("Unexpected combination of section and row.")
        }
        cell.tintColor = .todayPrimaryTint
    }
    
    @objc func didCancelEdit() {
        workingReminder = reminder
        setEditing(false, animated: true)
    }
    
    
    private func prepareForEditing() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel, target: self, action: #selector(didCancelEdit))
        updateSnapshotForEditing()
    }
    
    
    private func updateSnapshotForEditing() {
        print("update Editing Start")
        var snapshot = Snapshot()
        snapshot.appendSections([.title, .date, .notes])
        snapshot.appendItems([.header(Section.title.name), .editableText(reminder.title)], toSection: .title)
        print("Append First Iten")
        snapshot.appendItems([.header(Section.date.name), .editableDate(reminder.dueDate)], toSection: .date)
        print("Append another Item")
        snapshot.appendItems([.header(Section.notes.name), .editableText(reminder.notes ?? "")], toSection: .notes)
        print("Append Last Item")
        dataSource?.apply(snapshot)
        print("Update Editing Finished")
    }
    
    private func prepareForViewing() {
        navigationItem.leftBarButtonItem = nil
        if workingReminder != reminder {
                reminder = workingReminder
        }
        updateSnapshotForViewing()
    }
    
    private func updateSnapshotForViewing() {
        print("Update View Finished")
        var snapshot = Snapshot()
        snapshot.appendSections([.view])
        snapshot.appendItems(
                    [Row.header(""), Row.title, Row.date, Row.time, Row.notes], toSection: .view)
        dataSource?.apply(snapshot)
        print("Update View Finished")
    }
    
    private func section(for indexPath: IndexPath) -> Section {
        let sectionNumber = isEditing ? indexPath.section + 1 : indexPath.section
        guard let section = Section(rawValue: sectionNumber) else {
            fatalError("Unable to find matching section")
        }
        return section
    }

}
