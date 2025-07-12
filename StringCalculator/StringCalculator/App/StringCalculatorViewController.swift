//
//  StringCalculatorViewController.swift
//  StringCalculator
//
//  Created by Nilaykumar Sevak on 7/12/25.
//

import UIKit

class StringCalculatorViewController: UIViewController {
    
    // MARK: - variables
    private let calculator = StringCalculator()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let titleLabel = UILabel()
    private let instructionLabel = UILabel()
    private let inputTextView = UITextView()
    private let calculateButton = UIButton()
    private let resultLabel = UILabel()
    private let historyLabel = UILabel()
    private let historyTextView = UITextView()
    private let clearButton = UIButton()
    
    private var calculationHistory: [String] = []
    //MARK: outlets
    /*
     @IBOutlet weak var titleLabel : UILabel!
     @IBOutlet weak var instructionLabel : UILabel!
     @IBOutlet weak var resultLabel :
     */
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupActions()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = UIColor.systemBackground
        //
        calculator.delegate = self
        // Setup scroll view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // Title
        titleLabel.text = "➕ ＆ 🟰  String Calculator"
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.systemBlue
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        // Instructions
        instructionLabel.text = """
        Enter numbers separated by commas (,) or newlines (\\n)
        Custom delimiters: //[delimiter]\\n[numbers]
        Example: //;\\n1;2;3
        """
        instructionLabel.font = UIFont.systemFont(ofSize: 14)
        instructionLabel.numberOfLines = 0
        instructionLabel.textAlignment = .center
        instructionLabel.textColor = UIColor.secondaryLabel
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(instructionLabel)
        
        // Input text view
        inputTextView.font = UIFont.monospacedSystemFont(ofSize: 16, weight: .regular)
        inputTextView.layer.borderColor = UIColor.systemGray4.cgColor
        inputTextView.layer.borderWidth = 1
        inputTextView.layer.cornerRadius = 12
        inputTextView.backgroundColor = UIColor.systemBackground
        //in replace of PLACEHOLDER it's a textView//textField was not enough when scroll
        inputTextView.text = "Enter text with seprated wit ,(Comma) e.g. 1,200,3"
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(inputTextView)
        
        // Calculate button
        calculateButton.setTitle("Calculate Sum", for: .normal)
        calculateButton.backgroundColor = UIColor.systemBlue
        calculateButton.setTitleColor(.white, for: .normal)
        calculateButton.layer.cornerRadius = 12
        calculateButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(calculateButton)
        
        // Result label
        resultLabel.text = "Result: 0"
        resultLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        resultLabel.textAlignment = .center
        resultLabel.textColor = UIColor.systemGreen
        resultLabel.backgroundColor = UIColor.systemGray6
        resultLabel.layer.cornerRadius = 12
        resultLabel.layer.masksToBounds = true
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(resultLabel)
        
        // History label
        historyLabel.text = "📊 Calculation History"
        historyLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        historyLabel.textColor = UIColor.label
        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(historyLabel)
        
        // History text view
        historyTextView.font = UIFont.monospacedSystemFont(ofSize: 12, weight: .regular)
        historyTextView.layer.borderColor = UIColor.systemGray4.cgColor
        historyTextView.layer.borderWidth = 1
        historyTextView.layer.cornerRadius = 12
        historyTextView.backgroundColor = UIColor.systemGray6
        historyTextView.isEditable = false
        historyTextView.text = "No calculations yet..."
        historyTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(historyTextView)
        
        // Clear button
        clearButton.setTitle("Clear History", for: .normal)
        clearButton.backgroundColor = UIColor.systemOrange
        clearButton.setTitleColor(.white, for: .normal)
        clearButton.layer.cornerRadius = 12
        clearButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(clearButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Scroll view
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Content view
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Title
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Instructions
            instructionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            instructionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            instructionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Input text view
            inputTextView.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20),
            inputTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            inputTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            inputTextView.heightAnchor.constraint(equalToConstant: 100),
            
            // Calculate button
            calculateButton.topAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: 20),
            calculateButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Result label
            resultLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            resultLabel.heightAnchor.constraint(equalToConstant: 60),
            
            // History label
            historyLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 30),
            historyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            historyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // History text view
            historyTextView.topAnchor.constraint(equalTo: historyLabel.bottomAnchor, constant: 10),
            historyTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            historyTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            historyTextView.heightAnchor.constraint(equalToConstant: 120),
            
            // Clear button
            clearButton.topAnchor.constraint(equalTo: historyTextView.bottomAnchor, constant: 15),
            clearButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            clearButton.widthAnchor.constraint(equalToConstant: 150),
            clearButton.heightAnchor.constraint(equalToConstant: 40),
            clearButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupActions() {
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func calculateButtonTapped() {
        let input = inputTextView.text ?? ""
        
        // Add visual feedback
        calculateButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        UIView.animate(withDuration: 0.1) {
            self.calculateButton.transform = .identity
        }
        do {
            let result =  try calculator.add(input)
            resultLabel.text = "Result: \(result)"
            resultLabel.textColor = UIColor.systemGreen
            
            // Add to history
            let historyEntry = "\(input) = \(result)"
            calculationHistory.append(historyEntry)
            updateHistoryDisplay()
            // Animate result
            resultLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            UIView.animate(withDuration: 0.3) {
                self.resultLabel.transform = .identity
            }
        } catch {
            // Show simple alert popup
            showAlert(message: error.localizedDescription)
            
            // Update result label to show error state
            resultLabel.text = "Error occurred"
            resultLabel.textColor = UIColor.systemRed
        }
    }
    
    @objc private func clearButtonTapped() {
        calculationHistory.removeAll()
        updateHistoryDisplay()
        
        // Clear input and result
        inputTextView.text = ""
        resultLabel.text = "Result: 0"
        resultLabel.textColor = UIColor.systemGreen
    }
    
    private func updateHistoryDisplay() {
        if calculationHistory.isEmpty {
            historyTextView.text = "No calculations yet..."
        } else {
            //all text will come to array instead .first/.last || [0] (learn by chance never used before reversed())
            historyTextView.text = calculationHistory.reversed().joined(separator: "\n")
        }
    }
}
//Alert function seprated
extension StringCalculatorViewController: StringCalculatorDelegate {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

//pass error string to viewController
//it's Anyobject in case of StringCalculator doesn't have class type check below
/*
 error faced: 'weak' must not be applied to non-class-bound 'any StringCalculatorDelegate'; consider adding a protocol conformance that has a class bound
 */
protocol StringCalculatorDelegate :AnyObject{
    func showAlert(message: String)
}
