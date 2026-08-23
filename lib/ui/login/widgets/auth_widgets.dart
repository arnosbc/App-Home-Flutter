import 'package:flutter/material.dart';

const forest = Color(0xFF12372A);
const fern = Color(0xFF4F8A68);
const mint = Color(0xFFE9F5DB);
const paper = Color(0xFFFFFCF4);
const coral = Color(0xFFE78161);

class AuthShell extends StatelessWidget {
  const AuthShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paper,
      body: Stack(
        children: [
          const _AmbientBackground(),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 460),
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmbientBackground extends StatelessWidget {
  const _AmbientBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -130,
            right: -90,
            child: _OrganicShape(size: 290, color: mint),
          ),
          Positioned(
            bottom: -150,
            left: -120,
            child: _OrganicShape(size: 330, color: const Color(0xFFF8E5C8)),
          ),
          Positioned(
            top: 120,
            left: -30,
            child: _DotPattern(color: fern.withValues(alpha: .12)),
          ),
        ],
      ),
    );
  }
}

class _OrganicShape extends StatelessWidget {
  const _OrganicShape({required this.size, required this.color});
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -.18,
      child: Container(
        width: size,
        height: size * .7,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(size),
        ),
      ),
    );
  }
}

class _DotPattern extends StatelessWidget {
  const _DotPattern({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 110,
    height: 110,
    child: CustomPaint(painter: _DotsPainter(color)),
  );
}

class _DotsPainter extends CustomPainter {
  const _DotsPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    for (var x = 8.0; x < size.width; x += 18) {
      for (var y = 8.0; y < size.height; y += 18) {
        canvas.drawCircle(Offset(x, y), 2.2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotsPainter oldDelegate) =>
      oldDelegate.color != color;
}

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
  });
  final String eyebrow;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: forest,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.eco_rounded, color: mint, size: 24),
            ),
            const SizedBox(width: 12),
            Text(
              'VERDE',
              style: theme.textTheme.labelLarge?.copyWith(
                color: fern,
                letterSpacing: 2.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 38),
        Text(
          eyebrow.toUpperCase(),
          style: theme.textTheme.labelMedium?.copyWith(
            color: coral,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: forest,
            fontWeight: FontWeight.w800,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: const Color(0xFF668071),
            height: 1.45,
          ),
        ),
      ],
    );
  }
}

class AuthFormCard extends StatelessWidget {
  const AuthFormCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 28),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .84),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(
            color: Color(0x15203C2C),
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: child,
    );
  }
}

class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon = Icons.arrow_forward_rounded,
  });
  final String label;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 56,
    child: FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: FilledButton.styleFrom(
        backgroundColor: forest,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
  );
}

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const Expanded(child: Divider(color: Color(0xFFDCE8DA))),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          'o continúa con',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: fern),
        ),
      ),
      const Expanded(child: Divider(color: Color(0xFFDCE8DA))),
    ],
  );
}

class AuthSocialButton extends StatelessWidget {
  const AuthSocialButton({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
    onPressed: () {},
    icon: Icon(icon, color: forest, size: 19),
    label: Text(label),
    style: OutlinedButton.styleFrom(
      foregroundColor: forest,
      side: const BorderSide(color: Color(0xFFD5E4D2)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      padding: const EdgeInsets.symmetric(vertical: 14),
    ),
  );
}

class AuthSwitch extends StatelessWidget {
  const AuthSwitch({
    super.key,
    required this.prompt,
    required this.action,
    required this.onPressed,
  });
  final String prompt;
  final String action;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Center(
    child: Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          prompt,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: const Color(0xFF668071)),
        ),
        const SizedBox(width: 12),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: fern,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          ),
          child: Text(action),
        ),
      ],
    ),
  );
}
