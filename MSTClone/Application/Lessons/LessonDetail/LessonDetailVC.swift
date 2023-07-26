//
//  LessonDetailVC.swift
//  MSTClone
//
//

import UIKit
import SwiftUI
import AVKit
import Combine

struct LessonDetailView: UIViewControllerRepresentable {
    typealias UIViewControllerType = LessonDetailVC
    let lesson: Lessons
    
    func makeUIViewController(context: Context) -> LessonDetailVC {
        let vc = LessonDetailVC(lesson: lesson)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: LessonDetailVC, context: Context) {
    }
}

class LessonDetailVC: UIViewController {
    
    let currentView = LessonDetailUIView()
    var cancellables = [AnyCancellable]()
    let lesson = CurrentValueSubject<Lessons?, Never>(nil)
    
    init(lesson: Lessons) {
        self.lesson.send(lesson)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeEvents()
        observeViewEvents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.parent?.navigationItem.largeTitleDisplayMode = .never
            self.parent?.navigationController?.isNavigationBarHidden = true
        }
    }
    
    
    private func observeEvents() {
        lesson.sink { [weak self] lesson in
            self?.currentView.configureView(lesson: lesson)
        }.store(in: &cancellables)
    }
    
    private func observeViewEvents() {
        currentView.onPlay = { [weak self] in
            self?.openVideoPlayer()
        }
        currentView.onBack = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    private func openVideoPlayer() {
        
        if let videoUrl = URL(string: lesson.value?.video_url ?? "") {
            let player = AVPlayer(url: videoUrl)
            let playerViewController = AVPlayerViewController()
            playerViewController.view.frame = CGRect (x:0, y:-5, width: self.view.bounds.width, height:250)
            playerViewController.player = player
            playerViewController.videoGravity = .resizeAspectFill
            
            self.addChild(playerViewController)
            self.view.addSubview(playerViewController.view)
            playerViewController.didMove(toParent: self)
            player.play()
        }
    }
    
    
    override func loadView() {
        view = currentView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
