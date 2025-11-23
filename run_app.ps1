# Financial Planner Pro - Quick Start Script

Write-Host "🚀 Financial Planner Pro - Quick Start" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# Check if Flutter is installed
Write-Host "Checking Flutter installation..." -ForegroundColor Yellow
$flutterExists = Get-Command flutter -ErrorAction SilentlyContinue

if (-not $flutterExists) {
    Write-Host "❌ Flutter is not installed or not in PATH" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Flutter:" -ForegroundColor Yellow
    Write-Host "1. Visit: https://docs.flutter.dev/get-started/install/windows" -ForegroundColor White
    Write-Host "2. Download Flutter SDK" -ForegroundColor White
    Write-Host "3. Add Flutter to your PATH" -ForegroundColor White
    Write-Host "4. Run 'flutter doctor' to verify installation" -ForegroundColor White
    Write-Host ""
    exit 1
}

Write-Host "✅ Flutter found!" -ForegroundColor Green
Write-Host ""

# Show Flutter version
Write-Host "Flutter version:" -ForegroundColor Yellow
flutter --version
Write-Host ""

# Check Flutter doctor
Write-Host "Running Flutter doctor..." -ForegroundColor Yellow
flutter doctor
Write-Host ""

# Install dependencies
Write-Host "Installing dependencies..." -ForegroundColor Yellow
flutter pub get

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Dependencies installed successfully!" -ForegroundColor Green
} else {
    Write-Host "❌ Failed to install dependencies" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Generate code (optional - commented out since we have stub files)
# Write-Host "Generating code with build_runner..." -ForegroundColor Yellow
# flutter pub run build_runner build --delete-conflicting-outputs
# Write-Host ""

# List available devices
Write-Host "Available devices:" -ForegroundColor Yellow
flutter devices
Write-Host ""

# Prompt to run
Write-Host "Ready to run the app!" -ForegroundColor Green
Write-Host ""
$response = Read-Host "Do you want to run the app now? (y/n)"

if ($response -eq 'y' -or $response -eq 'Y') {
    Write-Host ""
    Write-Host "🚀 Launching Financial Planner Pro..." -ForegroundColor Cyan
    Write-Host ""
    flutter run
} else {
    Write-Host ""
    Write-Host "To run the app later, use: flutter run" -ForegroundColor Yellow
    Write-Host ""
}
