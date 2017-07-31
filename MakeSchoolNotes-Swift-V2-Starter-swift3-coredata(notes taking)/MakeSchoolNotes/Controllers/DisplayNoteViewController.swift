//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    var note: Note?
    
    @IBOutlet weak var noteContentTextView: UITextView!
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noteTitleTextField.text = note?.title ?? ""
        noteContentTextView.text = note?.content ?? "content:"
    
    }
//        // 1
//        if let note = note {
//            // 2
//            noteTitleTextField.text = note.title
//            noteContentTextView.text = note.content
//        } else {
//            // 3
//            noteTitleTextField.text = ""
//            noteContentTextView.text = ""
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            // if note exists, update title and content
            let note = self.note ?? CoreDataHelper.newNote()
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            note.modificationTime = Date() as NSDate
            CoreDataHelper.saveNote()
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let listNotesTableViewController = segue.destination as! ListNotesTableViewController
//        if segue.identifier == "save" {
//            if let note = note {
//                note.title = noteTitleTextField.text ?? ""
//                note.content = noteContentTextView.text ?? ""
//                // 2
//                listNotesTableViewController.tableView.reloadData()
//            } else {
//                // 3
//                let newNote = Note()
//                newNote.title = noteTitleTextField.text ?? ""
//                newNote.content = noteContentTextView.text ?? ""
//                newNote.modificationTime = Date() as NSDate
//                listNotesTableViewController.notes.append(newNote)
//            }
//        }
//    }
}
