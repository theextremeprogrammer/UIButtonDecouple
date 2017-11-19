bootstrap:
	@carthage bootstrap --platform iOS

update:
	@carthage update --platform iOS

units tests:
	@xcodebuild -project UIButtonDecouple.xcodeproj -scheme "UIButtonDecouple" -destination "platform=iOS Simulator,OS=11.1,name=iPhone 8" build test
