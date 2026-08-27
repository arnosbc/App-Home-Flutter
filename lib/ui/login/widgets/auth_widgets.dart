import 'package:flutter/material.dart';
import 'package:flutter_application_home/ui/theme.dart';

class AuthShell extends StatelessWidget {
  const AuthShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.paper,
      body: Stack(
        children: [
          const _AmbientBackground(),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  Space.lg,
                  Space.xl,
                  Space.lg,
                  Space.xl,
                ),
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
            child: _OrganicShape(size: 288, color: AppColors.mint),
          ),
          Positioned(
            bottom: -150,
            left: -120,
            child: _OrganicShape(size: 328, color: AppColors.peach),
          ),
          Positioned(
            top: 120,
            left: -30,
            child: _DotPattern(color: AppColors.fern.withValues(alpha: .12)),
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
    width: 112,
    height: 112,
    child: CustomPaint(painter: _DotsPainter(color)),
  );
}

class _DotsPainter extends CustomPainter {
  const _DotsPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    for (var x = Space.sm; x < size.width; x += Space.lg) {
      for (var y = Space.sm; y < size.height; y += Space.lg) {
        canvas.drawCircle(Offset(x, y), Space.xs / 2, paint);
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
                color: AppColors.forest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.eco_rounded,
                color: AppColors.mint,
                size: Space.lg,
              ),
            ),
            const SizedBox(width: Space.md),
            Text(
              'VERDE',
              style: theme.textTheme.labelLarge?.copyWith(
                color: AppColors.fern,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: Space.xxl),
        Text(
          eyebrow.toUpperCase(),
          style: theme.textTheme.labelMedium?.copyWith(
            color: AppColors.coral,
            letterSpacing: 1,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: Space.sm),
        Text(
          title,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: AppColors.forest,
            fontWeight: FontWeight.w800,
            height: 1.05,
          ),
        ),
        const SizedBox(height: Space.md),
        Text(
          subtitle,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: AppColors.textMuted,
            height: 1.5,
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
      margin: const EdgeInsets.only(top: Space.lg),
      padding: const EdgeInsets.all(Space.lg),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .84),
        borderRadius: BorderRadius.circular(Space.lg),
        border: Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: Space.lg,
            offset: Offset(0, Space.sm),
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
        backgroundColor: AppColors.forest,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Space.md),
        ),
      ),
    ),
  );
}

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const Expanded(child: Divider(color: AppColors.divider)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Space.md),
        child: Text(
          'o continúa con',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.fern),
        ),
      ),
      const Expanded(child: Divider(color: AppColors.divider)),
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
    icon: Icon(icon, color: AppColors.forest, size: 20),
    label: Text(label),
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.forest,
      side: const BorderSide(color: AppColors.outline),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Space.md),
      ),
      padding: const EdgeInsets.symmetric(vertical: Space.sm),
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
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
        ),
        const SizedBox(width: Space.md),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.fern,
            padding: const EdgeInsets.symmetric(
              horizontal: Space.sm,
              vertical: Space.sm,
            ),
          ),
          child: Text(action),
        ),
      ],
    ),
  );
}
