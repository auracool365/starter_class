import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: OrbixSignup()));

class OrbixSignup extends StatefulWidget {
  const OrbixSignup({super.key});

  @override
  State<OrbixSignup> createState() => _OrbixSignupState();
}

class _OrbixSignupState extends State<OrbixSignup> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Account created successfully',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            textAlign: .center,
          ),
          backgroundColor: Color(0xFF007300),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Something Went wrong',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            textAlign: .center,
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: .infinity,
        height: .infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -1),
            radius: 1.2,
            colors: [
              const Color(0xFF007300),
              //Colors.red.withOpacity(0.8),
              //Colors.red.withValues(alpha: 0.8),
              const Color(0xFF329932),
              Colors.grey.shade100,
              Colors.white,
            ],
            stops: const [0.0, 0.3, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24,
              ),
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  const SizedBox(height: 40),
                  // App Icon
                  const Center(
                    child: _AppIcon(iconPath: "assets/images/meta.png"),
                  ),

                  const SizedBox(height: 50),

                  // Auth header
                  const _AuthHeader(),
                  const SizedBox(height: 30),

                  // Form fields
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _AppTextFormField(
                          controller: _nameController,
                          label: 'Name',
                          prefixIcon: Icons.person_outline,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Name is required';
                            }
                            if (value.trim().length < 2) {
                              return 'Name must be at least 2 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                        _AppTextFormField(
                          controller: _emailController,
                          label: 'Email',
                          prefixIcon: Icons.mail_outline,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            if (!value.contains('@')) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                        _AppTextFormField(
                          controller: _passwordController,
                          label: 'Password',
                          prefixIcon: Icons.lock_outline,
                          obscureText: _obscurePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                            onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                        _AppTextFormField(
                          controller: _confirmPasswordController,
                          label: 'Confirm Password',
                          prefixIcon: Icons.lock_outline,
                          obscureText: _obscureConfirmPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                            onPressed: () => setState(
                              () => _obscureConfirmPassword =
                                  !_obscureConfirmPassword,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Create account button
                  _PrimaryButton(label: 'Create Account', onPressed: _submit),
                  const SizedBox(height: 20),

                  // Or and divider
                  const _OrDivider(),
                  const SizedBox(height: 20),

                  // Social Login
                  _SocialLoginButton(
                    label: 'Continue with Google',
                    imagePath: "assets/images/google.png",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Account Created with Google sign in',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: .center,
                          ),
                          backgroundColor: Color(0xFF007300),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _SocialLoginButton(
                    label: 'Continue with Apple',
                    imagePath: "assets/images/apple.png",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Account Created with Apple sign in',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: .center,
                          ),
                          backgroundColor: Color(0xFF007300),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Skip for Now',
                        style: TextStyle(
                          color: Colors.black54,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppIcon extends StatelessWidget {
  final String iconPath;
  const _AppIcon({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    double containerSize = 130.0;
    double iconSize = 80.0;
    return Container(
      height: containerSize,
      width: containerSize,
      alignment: .center,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.13),
        border: Border.all(
          width: 1.5,
          color: Colors.white.withValues(alpha: 0.25),
        ),
        borderRadius: BorderRadius.circular(25),
      ),

      child: Image.asset(
        iconPath,
        height: iconSize,
        width: iconSize,
        fit: .fill,
        color: Colors.white,
      ),
    );
  }
}

class _AuthHeader extends StatelessWidget {
  const _AuthHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Orbix AI : AIT08',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 18),
        Text(
          'Create Your Account\nFor Daily Updates',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w600,
            height: 1.15,
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Sign up to get your personal AI assistant for writing, '
          'brainstorming, coding, learning and everyday tasks.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54, fontSize: 14, height: 1.4),
        ),
      ],
    );
  }
}

// TextFormField
class _AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?) validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final Widget? suffixIcon;

  const _AppTextFormField({
    required this.controller,
    required this.label,
    required this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
  });

  OutlineInputBorder _border(Color color, double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color grey = Colors.grey.shade100;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      // Scoped per field, not on the Form so typing in one field
      // doesn't trigger errors on the others.
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(color: Colors.black87, fontSize: 15),
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.9),
        labelStyle: const TextStyle(color: Color(0xFF6B6B6B)),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: const Color(0xFF9A9A9A))
            : null,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: _border(grey, 1.2),
        enabledBorder: _border(grey, 1.2),
        focusedBorder: _border(const Color(0xFF007300), 2),
        errorBorder: _border(const Color(0xFFae0000), 1.2),
        focusedErrorBorder: _border(const Color(0xFFae0000), 2),
      ),
    );
  }
}

// Button.
class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const _PrimaryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF007300),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

// Social-login buttons.
class _SocialLoginButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback? onPressed;

  const _SocialLoginButton({
    required this.label,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Image.asset(imagePath, height: 35, width: 35, fit: .fill),
            const SizedBox(width: 20),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// "OR" divider
class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade200, thickness: 1)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'OR',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade200, thickness: 1)),
      ],
    );
  }
}
