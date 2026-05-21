/*

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Corrected relative import
import 'homepage.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  bool _agreedToTerms = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Decorative background circles
          Positioned(
            top: -50,
            left: -50,
            child: _buildDecorativeCircle(150, Colors.lightBlue.shade50),
          ),
          Positioned(
            top: 100,
            right: -80,
            child: _buildDecorativeCircle(200, Colors.lightGreen.shade50),
          ),

          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // Header
                  Text(
                    'CivicConnect',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Power your community forward',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // DigiLocker Quick Sign Up
                  _buildDigiLockerSection(),
                  const SizedBox(height: 30),

                  // Divider
                  _buildDivider(),
                  const SizedBox(height: 30),

                  // Form Title
                  Text(
                    'Create Your Account',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Join our community today!',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Form Fields
                  _buildNameFields(),
                  const SizedBox(height: 16),
                  _buildTextField(hint: 'Your email address', icon: Icons.alternate_email),
                  const SizedBox(height: 16),
                  _buildPasswordField(
                    hint: 'Create a password',
                    isObscured: _isPasswordObscured,
                    onToggle: () {
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'At least 8 characters',
                        style: GoogleFonts.poppins(color: Colors.grey[500], fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildPasswordField(
                    hint: 'Confirm your password',
                    isObscured: _isConfirmPasswordObscured,
                    icon: Icons.check_circle_outline,
                    onToggle: () {
                      setState(() {
                        _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Terms and Conditions
                  _buildTermsCheckbox(),
                  const SizedBox(height: 30),

                  // Create Account Button
                  _buildCreateAccountButton(),
                  const SizedBox(height: 20),

                  // Sign In Link
                  _buildSignInLink(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Loading overlay
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  // Helper Widgets for building the UI

  Widget _buildDecorativeCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildDigiLockerSection() {
    return Column(
      children: [
        Text(
          'Quick & Secure Registration',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 16),

        // DigiLocker Button
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange.shade300, width: 2),
            gradient: LinearGradient(
              colors: [Colors.orange.shade50, Colors.orange.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: _handleDigiLockerLogin,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // DigiLocker Icon
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade600,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign up with DigiLocker',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange.shade800,
                            ),
                          ),
                          Text(
                            'Instant verification with government ID',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.orange.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.orange.shade600,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Benefits row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBenefitChip('Verified Identity', Icons.verified_user),
            const SizedBox(width: 8),
            _buildBenefitChip('Instant Setup', Icons.flash_on),
            const SizedBox(width: 8),
            _buildBenefitChip('Secure', Icons.security),
          ],
        ),
      ],
    );
  }

  Widget _buildBenefitChip(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.green.shade600),
          const SizedBox(width: 4),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: Colors.green.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[300])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'OR',
            style: GoogleFonts.poppins(
              color: Colors.grey[500],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey[300])),
      ],
    );
  }

  Widget _buildNameFields() {
    return Row(
      children: [
        Expanded(child: _buildTextField(hint: 'First name')),
        const SizedBox(width: 16),
        Expanded(child: _buildTextField(hint: 'Last name')),
      ],
    );
  }

  Widget _buildTextField({required String hint, IconData? icon}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.grey[500]),
        prefixIcon: icon != null ? Icon(icon, color: Colors.grey[400]) : null,
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
    );
  }

  Widget _buildPasswordField({
    required String hint,
    required bool isObscured,
    required VoidCallback onToggle,
    IconData icon = Icons.lock_outline,
  }) {
    return TextField(
      obscureText: isObscured,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.grey[500]),
        prefixIcon: Icon(icon, color: Colors.grey[400]),
        suffixIcon: IconButton(
          icon: Icon(
            isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: Colors.grey[400],
          ),
          onPressed: onToggle,
        ),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
    );
  }

  Widget _buildTermsCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _agreedToTerms,
          onChanged: (bool? value) {
            setState(() {
              _agreedToTerms = value ?? false;
            });
          },
          activeColor: const Color(0xFF42A5F5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
              children: [
                const TextSpan(text: 'I agree to the '),
                TextSpan(
                  text: 'Terms',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    // TODO: Handle Terms tap
                  },
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    // TODO: Handle Privacy Policy tap
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateAccountButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFF64B5F6), Color(0xFF2196F3)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          // Updated navigation using named route
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          'Create My Account',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInLink() {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
        children: [
          const TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: 'Sign in!',
            style: const TextStyle(
              color: Color(0xFF2196F3),
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to Sign In page
                Navigator.pushNamed(context, '/signin');
              },
          ),
        ],
      ),
    );
  }

  // DigiLocker Integration Methods
  void _handleDigiLockerLogin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Simulate DigiLocker authentication process
      await _simulateDigiLockerAuth();

      // Show success dialog
      _showDigiLockerSuccessDialog();
    } catch (e) {
      // Show error dialog
      _showDigiLockerErrorDialog();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _simulateDigiLockerAuth() async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    // In real implementation, this would:
    // 1. Redirect to DigiLocker OAuth
    // 2. Get user consent for data sharing
    // 3. Retrieve verified user information
    // 4. Create account with verified data

    // For now, we'll just simulate success
    // In production, you might get an error, so handle that case too
    if (DateTime.now().millisecondsSinceEpoch % 4 == 0) {
      throw Exception('DigiLocker authentication failed');
    }
  }

  void _showDigiLockerSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green.shade600, size: 28),
              const SizedBox(width: 8),
              Text(
                'Verification Successful!',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your identity has been verified through DigiLocker. Welcome to CivicConnect!',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person_outline, color: Colors.green.shade600, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Verified Citizen Profile Created',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                      (route) => false,
                ); // Navigate to home
              },
              child: Text(
                'Continue to App',
                style: GoogleFonts.poppins(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDigiLockerErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red.shade600, size: 28),
              const SizedBox(width: 8),
              Text(
                'Authentication Failed',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
            ],
          ),
          content: Text(
            'Unable to complete DigiLocker authentication. Please try again or use the manual registration form.',
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Try Again',
                style: GoogleFonts.poppins(
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Use Manual Form',
                style: GoogleFonts.poppins(
                  color: Colors.blue.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}*/
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Corrected relative import
import 'homepage.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  bool _agreedToTerms = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Decorative background circles
          Positioned(
            top: -50,
            left: -50,
            child: _buildDecorativeCircle(150, Colors.lightBlue.shade50),
          ),
          Positioned(
            top: 100,
            right: -80,
            child: _buildDecorativeCircle(200, Colors.lightGreen.shade50),
          ),

          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // Header
                  Text(
                    'CivicConnect',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Power your community forward',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Quick Sign Up Options
                  _buildQuickSignUpSection(),
                  const SizedBox(height: 30),

                  // Divider
                  _buildDivider(),
                  const SizedBox(height: 30),

                  // Form Title
                  Text(
                    'Create Your Account',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Join our community today!',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Form Fields
                  _buildNameFields(),
                  const SizedBox(height: 16),
                  _buildTextField(hint: 'Your email address', icon: Icons.alternate_email),
                  const SizedBox(height: 16),
                  _buildPasswordField(
                    hint: 'Create a password',
                    isObscured: _isPasswordObscured,
                    onToggle: () {
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'At least 8 characters',
                        style: GoogleFonts.poppins(color: Colors.grey[500], fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildPasswordField(
                    hint: 'Confirm your password',
                    isObscured: _isConfirmPasswordObscured,
                    icon: Icons.check_circle_outline,
                    onToggle: () {
                      setState(() {
                        _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Terms and Conditions
                  _buildTermsCheckbox(),
                  const SizedBox(height: 30),

                  // Create Account Button
                  _buildCreateAccountButton(),
                  const SizedBox(height: 20),

                  // Sign In Link
                  _buildSignInLink(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Loading overlay
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  // Helper Widgets for building the UI

  Widget _buildDecorativeCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildQuickSignUpSection() {
    return Column(
      children: [
        Text(
          'Quick & Secure Registration',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 16),

        // Google Sign Up Button
        _buildGoogleSignUpButton(),
        const SizedBox(height: 12),

        // DigiLocker Button
        _buildDigiLockerButton(),
        const SizedBox(height: 16),

        // Benefits row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBenefitChip('Fast Setup', Icons.flash_on),
            const SizedBox(width: 8),
            _buildBenefitChip('Verified', Icons.verified_user),
            const SizedBox(width: 8),
            _buildBenefitChip('Secure', Icons.security),
          ],
        ),
      ],
    );
  }

  Widget _buildGoogleSignUpButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: _handleGoogleSignUp,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google Icon
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      'https://developers.google.com/identity/images/g-logo.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback to a custom Google-style icon if network image fails
                        return Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: CustomPaint(
                            painter: GoogleIconPainter(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Continue with Google',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 32), // Balance the layout
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDigiLockerButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade300, width: 2),
        gradient: LinearGradient(
          colors: [Colors.orange.shade50, Colors.orange.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: _handleDigiLockerLogin,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // DigiLocker Icon
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade600,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign up with DigiLocker',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange.shade800,
                        ),
                      ),
                      Text(
                        'Instant verification with government ID',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.orange.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.orange.shade600,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitChip(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.green.shade600),
          const SizedBox(width: 4),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: Colors.green.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[300])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'OR',
            style: GoogleFonts.poppins(
              color: Colors.grey[500],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey[300])),
      ],
    );
  }

  Widget _buildNameFields() {
    return Row(
      children: [
        Expanded(child: _buildTextField(hint: 'First name')),
        const SizedBox(width: 16),
        Expanded(child: _buildTextField(hint: 'Last name')),
      ],
    );
  }

  Widget _buildTextField({required String hint, IconData? icon}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.grey[500]),
        prefixIcon: icon != null ? Icon(icon, color: Colors.grey[400]) : null,
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
    );
  }

  Widget _buildPasswordField({
    required String hint,
    required bool isObscured,
    required VoidCallback onToggle,
    IconData icon = Icons.lock_outline,
  }) {
    return TextField(
      obscureText: isObscured,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.grey[500]),
        prefixIcon: Icon(icon, color: Colors.grey[400]),
        suffixIcon: IconButton(
          icon: Icon(
            isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: Colors.grey[400],
          ),
          onPressed: onToggle,
        ),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
    );
  }

  Widget _buildTermsCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _agreedToTerms,
          onChanged: (bool? value) {
            setState(() {
              _agreedToTerms = value ?? false;
            });
          },
          activeColor: const Color(0xFF42A5F5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
              children: [
                const TextSpan(text: 'I agree to the '),
                TextSpan(
                  text: 'Terms',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    // TODO: Handle Terms tap
                  },
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    // TODO: Handle Privacy Policy tap
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateAccountButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFF64B5F6), Color(0xFF2196F3)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          // Updated navigation using named route
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          'Create My Account',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInLink() {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
        children: [
          const TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: 'Sign in!',
            style: const TextStyle(
              color: Color(0xFF2196F3),
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to Sign In page
                Navigator.pushNamed(context, '/signin');
              },
          ),
        ],
      ),
    );
  }

  // Google Sign Up Integration
  void _handleGoogleSignUp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Simulate Google authentication process
      await _simulateGoogleAuth();

      // Show success dialog
      _showGoogleSuccessDialog();
    } catch (e) {
      // Show error dialog
      _showGoogleErrorDialog();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _simulateGoogleAuth() async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    // In real implementation, this would:
    // 1. Initialize Google Sign-In
    // 2. Show Google authentication dialog
    // 3. Get user consent and account selection
    // 4. Retrieve user profile information
    // 5. Create account with Google data

    // For now, we'll just simulate success/failure
    if (DateTime.now().millisecondsSinceEpoch % 5 == 0) {
      throw Exception('Google authentication failed');
    }
  }

  void _showGoogleSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green.shade600, size: 28),
              const SizedBox(width: 8),
              Text(
                'Welcome to CivicConnect!',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your account has been successfully created using Google authentication.',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_circle, color: Colors.blue.shade600, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Google Account Linked Successfully',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                      (route) => false,
                ); // Navigate to home
              },
              child: Text(
                'Get Started',
                style: GoogleFonts.poppins(
                  color: Colors.blue.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showGoogleErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red.shade600, size: 28),
              const SizedBox(width: 8),
              Text(
                'Sign Up Failed',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
            ],
          ),
          content: Text(
            'Unable to complete Google sign up. Please check your internet connection and try again, or use the manual registration form.',
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Try Again',
                style: GoogleFonts.poppins(
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Use Manual Form',
                style: GoogleFonts.poppins(
                  color: Colors.blue.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // DigiLocker Integration Methods (existing code)
  void _handleDigiLockerLogin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Simulate DigiLocker authentication process
      await _simulateDigiLockerAuth();

      // Show success dialog
      _showDigiLockerSuccessDialog();
    } catch (e) {
      // Show error dialog
      _showDigiLockerErrorDialog();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _simulateDigiLockerAuth() async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    // In real implementation, this would:
    // 1. Redirect to DigiLocker OAuth
    // 2. Get user consent for data sharing
    // 3. Retrieve verified user information
    // 4. Create account with verified data

    // For now, we'll just simulate success
    // In production, you might get an error, so handle that case too
    if (DateTime.now().millisecondsSinceEpoch % 4 == 0) {
      throw Exception('DigiLocker authentication failed');
    }
  }

  void _showDigiLockerSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green.shade600, size: 28),
              const SizedBox(width: 8),
              Text(
                'Verification Successful!',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your identity has been verified through DigiLocker. Welcome to CivicConnect!',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person_outline, color: Colors.green.shade600, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Verified Citizen Profile Created',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                      (route) => false,
                ); // Navigate to home
              },
              child: Text(
                'Continue to App',
                style: GoogleFonts.poppins(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDigiLockerErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red.shade600, size: 28),
              const SizedBox(width: 8),
              Text(
                'Authentication Failed',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
            ],
          ),
          content: Text(
            'Unable to complete DigiLocker authentication. Please try again or use the manual registration form.',
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Try Again',
                style: GoogleFonts.poppins(
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Use Manual Form',
                style: GoogleFonts.poppins(
                  color: Colors.blue.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// Custom Google Icon Painter for fallback - NOW OUTSIDE THE MAIN CLASS
class GoogleIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Google's "G" letter with correct colors
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Blue section (top-right)
    paint.color = const Color(0xFF4285F4);
    canvas.drawArc(rect, -1.57, 1.57, true, paint);

    // Red section (top-left)
    paint.color = const Color(0xFFEA4335);
    canvas.drawArc(rect, -3.14, 1.57, true, paint);

    // Yellow section (bottom-left)
    paint.color = const Color(0xFFFBBC04);
    canvas.drawArc(rect, -4.71, 1.57, true, paint);

    // Green section (bottom-right)
    paint.color = const Color(0xFF34A853);
    canvas.drawArc(rect, 0, 1.57, true, paint);

    // White center circle
    paint.color = Colors.white;
    canvas.drawCircle(Offset(size.width/2, size.height/2), size.width/4, paint);

    // Blue "G" shape
    paint.color = const Color(0xFF4285F4);
    final path = Path();
    path.moveTo(size.width * 0.7, size.height * 0.5);
    path.lineTo(size.width * 0.85, size.height * 0.5);
    path.lineTo(size.width * 0.85, size.height * 0.65);
    path.lineTo(size.width * 0.5, size.height * 0.65);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width * 0.7, size.height * 0.35);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
