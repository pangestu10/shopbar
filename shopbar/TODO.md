# Fix Errors and Organize Routes with GetX

## Steps to Complete:

1. [ ] Fix imports in lib/app/routes/app_pages.dart
   - [ ] Import login_page.dart and register_page.dart
   - [ ] Import login_binding.dart and register_binding.dart
   - [ ] Remove AuthView and AuthBinding references

2. [ ] Update routes in app_pages.dart
   - [ ] Separate login and register routes instead of generic auth route
   - [ ] Ensure proper route ordering

3. [ ] Fix constant naming conventions
   - [ ] Update app_routes.dart constants to lowerCamelCase
   - [ ] Update app_pages.dart constants to lowerCamelCase

4. [ ] Verify route organization follows GetX best practices
   - [ ] Check splash route as initial route
   - [ ] Ensure proper navigation flow

5. [ ] Test the application
   - [ ] Run flutter analyze to check for remaining issues
   - [ ] Test app compilation and navigation

## Current Issues Identified:
- Missing imports for auth views and bindings
- Incorrect route definitions using non-existent classes
- Constant naming not following Dart style guide
- Route organization needs improvement

## Files to Modify:
- lib/app/routes/app_pages.dart
- lib/app/routes/app_routes.dart
- lib/app/modules/auth/views/login_page.dart (fix import)
- lib/app/modules/auth/bindings/login_binding.dart (fix import)
