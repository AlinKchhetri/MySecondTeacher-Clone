
import UIKit
import Kingfisher

class LessonDetailUIView: UIView {
    
    var onPlay: (() -> Void)?
    var onBack: (() -> Void)?
        
    let thumbnail: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    
    let backButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(systemName: "arrow.left")?.withTintColor(.white), for: .normal)
        view.contentMode = .scaleAspectFit
        view.tintColor = .white
        return view
    }()
    
    let playButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(systemName: "play.fill")?.withTintColor(.white), for: .normal)
        view.contentMode = .scaleAspectFit
        view.tintColor = .white
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        observeEvents()
    }
    
    func setupView() {
        addSubview(thumbnail)
        thumbnail.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        thumbnail.constraintHeight(constant: 200)
        
        addSubview(backButton)
        backButton.constraintHeight(constant: 44)
        backButton.constraintWidth(constant: 44)
        backButton.anchor(top: thumbnail.topAnchor, leading: thumbnail.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: -10, left: 10, bottom: 0, right: 0))
        
        addSubview(playButton)
        playButton.constraintHeight(constant: 44)
        playButton.constraintWidth(constant: 44)
        playButton.centerXAnchor.constraint(equalTo: thumbnail.centerXAnchor).isActive = true
        playButton.centerYAnchor.constraint(equalTo: thumbnail.centerYAnchor).isActive = true
        
    }
    
    
    func configureView(lesson: Lessons?) {
        guard let lesson = lesson else { return }
        thumbnail.kf.setImage(with: URL(string: lesson.thumbnail))
    }
    
    private func observeEvents() {
        playButton.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
    }
    
    @objc func handlePlay() {
        onPlay?()
    }
    
    @objc func handleBack() {
        onBack?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
