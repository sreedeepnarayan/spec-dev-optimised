# PayWize Git Security Policies

## Overview

This document outlines the git security policies for the Connected Banking Platform repository to ensure proper attribution and maintain security standards.

## 🚨 Critical Security Rules

### 1. Human-Only Attribution
- **All commits must only credit actual human contributors**
- **AI tool attributions are strictly prohibited**
- **No external tool co-authorship is permitted**

### 2. Forbidden Patterns in Commits
The following patterns are automatically rejected by our git hooks:

```
❌ FORBIDDEN:
Co-Authored-By: Claude <noreply@anthropic.com>
🤖 Generated with [Claude Code](https://claude.ai/code)
Generated with Claude
claude.ai
anthropic.com
Author: Claude
```

```
✅ ALLOWED:
feat: Add new authentication endpoint
fix: Resolve database connection issue
docs: Update API documentation
```

## 🔧 Automatic Protection

### Git Hooks Installation
**All developers must install PayWize security hooks:**

```bash
# For new setups (automatic)
make setup

# For existing repositories
make setup-git-hooks

# Verify installation
make git-security-check
```

### What the Hooks Do
1. **Pre-commit validation** - Scans commit messages for forbidden patterns
2. **Immediate rejection** - Blocks commits with unauthorized attributions
3. **Clear error messages** - Explains policy violations and how to fix them

## 📋 Developer Workflow

### Initial Setup
```bash
# Clone repository
git clone https://github.com/PayWizeIN/connected-banking.git
cd connected-banking

# Run setup (includes git hooks)
make setup

# Verify security is active
make git-security-check
```

### Daily Development
```bash
# Normal development workflow
git add .
git commit -m "Your commit message"  # ✅ Will be validated automatically
git push origin your-branch
```

### If Your Commit is Rejected
```bash
# Example rejection:
❌ COMMIT REJECTED
Forbidden authorship pattern detected: 'Co-Authored-By: Claude'

PayWize Security Policy:
• All commits must only credit actual human contributors
• AI tool attributions are not permitted
• Remove any AI-generated signatures or co-author lines

# Fix by editing your commit message:
git commit --amend -m "Clean commit message without AI attribution"
```

## 🛡️ Security Enforcement

### Repository Level
- **Mandatory hooks** - Installed automatically during setup
- **Server-side validation** - Additional checks on the GitHub side
- **Policy documentation** - Clear guidelines for all contributors

### Team Level
- **Onboarding requirements** - All new team members must install hooks
- **Regular audits** - Periodic checks of commit history
- **Training materials** - Documentation and examples provided

## 🔍 Monitoring & Compliance

### Automated Checks
```bash
# Check your git security status
make git-security-check

# Test the validation system
make validate-commit

# View git configuration
git config --list | grep user
```

### Manual Verification
```bash
# Check recent commits for compliance
git log --oneline -10

# Search for any unauthorized patterns
git log --grep="claude" --grep="anthropic" --all

# Verify hook installation
ls -la .git/hooks/commit-msg
```

## 🚀 For Repository Administrators

### Setting Up Security
```bash
# Install hooks for the repository
make setup-git-hooks

# Test validation works
echo "Co-Authored-By: Claude <test@example.com>" | .githooks/commit-msg /dev/stdin
# Should fail with security error

# Verify clean commits pass
echo "feat: Add new feature" | .githooks/commit-msg /dev/stdin
# Should pass
```

### Sharing with Team
1. **Include in onboarding** - Make `make setup` part of new developer setup
2. **Document in README** - Reference these security policies
3. **Regular reminders** - Include in team meetings and code reviews

## 📚 Technical Details

### Hook Implementation
- **Location**: `.githooks/commit-msg` (shareable) → `.git/hooks/commit-msg` (active)
- **Language**: Bash script for maximum compatibility
- **Validation**: Pattern matching against forbidden strings
- **Integration**: Automatic installation via Makefile

### Patterns Detected
- **Direct attribution**: `Co-Authored-By: Claude`
- **Generated signatures**: `🤖 Generated with Claude`
- **URL references**: `claude.ai`, `anthropic.com`
- **Flexible matching**: Case-insensitive regex patterns

### Error Handling
- **Clear messaging**: Explains why commit was rejected
- **Guidance provided**: Shows how to fix the issue
- **Non-destructive**: Doesn't modify files, just prevents commit

## 🔄 Maintenance

### Regular Updates
```bash
# Update hooks when policies change
make setup-git-hooks

# Check for new patterns to block
make validate-commit
```

### Troubleshooting
```bash
# If hooks stop working
chmod +x .git/hooks/commit-msg

# If validation fails unexpectedly
.githooks/commit-msg /path/to/test/message

# Reset hooks completely
rm .git/hooks/commit-msg
make setup-git-hooks
```

## 📞 Support

### Getting Help
- **Check documentation**: Review this file and `AI_DEVELOPMENT.md`
- **Run diagnostics**: Use `make git-security-check`
- **Contact team**: Reach out to repository administrators

### Reporting Issues
If you encounter problems with the git hooks:
1. Run `make git-security-check` and share output
2. Include your git version: `git --version`
3. Describe the specific error message received

---

**Remember**: These security policies protect PayWize intellectual property and ensure proper attribution. All developers must comply with these requirements.