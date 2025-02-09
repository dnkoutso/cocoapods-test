Pod::Spec.new do |s|
  s.name         = 'SquareCore'
  s.version      = '1.8.0'
  s.summary      = 'Focused, foundational code shared by all Square applications and libraries.'
  s.homepage     = 'https://stash.corp.squareup.com/projects/IOS/repos/squarecore/browse'
  s.license      = { :type => 'Proprietary', :text => "© #{ Date.today.year } Square, Inc." }
  s.author       = { 'Register POS' => 'register-experience@squareup.com' }
  s.source       = { :git => 'https://stash.corp.squareup.com/scm/ios/squarecore.git', :tag => "podify/#{ s.version.to_s }" }
  
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  
  s.source_files = 'SquareCore'
  s.private_header_files = 'SquareCore/*_Internal.h'

  s.resource_bundle = { 'SquareCoreResources' => ['Resources/SquareCoreResources/**/*']}

  s.module_map = "SquareCore.modulemap"

  s.test_spec do
 	end
  
  s.pod_target_xcconfig = {
	  #
	  # Build settings for Register-consumed CocoaPods.
	  # This file lives in Register, under 'xcconfigs/default_build_settings.rb'.
	  #
	  # Usage:
	  # Copy the contents of this file into your Podspec:
	  #
	  #   Pod::Spec.new do |s|
	  #      ...
	  #      s.pod_target_xcconfig = { ... Contents of this file ... }
	  #   end
	  #

	  #
	  # Treat warnings as errors.
	  #

	  # Enabling this option causes all warnings to be treated as errors.
	  'GCC_TREAT_WARNINGS_AS_ERRORS' => 'YES',

	  #
	  # Always enable NSAssertions.
	  #

	  # Controls whether assertion logic provided by NSAssert is included in the preprocessed source code or is elided during preprocessing. Disabling assertions can improve code performance.
	  'ENABLE_NS_ASSERTIONS' => 'YES',

	  #
	  # Warnings & Errors
	  #

	  # In C, allocate even uninitialized global variables in the data section of the object file, rather than generating them as common blocks.
	  # This has the effect that if the same variable is declared (without extern ) in two different compilations, you will get an error when you link them.
	  'GCC_NO_COMMON_BLOCKS' => 'YES',

	  # Controls whether objc_msgSend calls must be cast to the appropriate function pointer type before being called.
	  'ENABLE_STRICT_OBJC_MSGSEND' => 'YES',

	  # Causes warnings about missing function prototypes to be treated as errors.  Only applies to C and Objective-C. 
	  'GCC_TREAT_IMPLICIT_FUNCTION_DECLARATIONS_AS_ERRORS' => 'YES',

	  # Enabling this option causes warnings about incompatible pointer types to be treated as errors.
	  'GCC_TREAT_INCOMPATIBLE_POINTER_TYPE_WARNINGS_AS_ERRORS' => 'YES',

	  # Warn if a value is implicitly converted from a 64 bit type to a 32 bit type.  This is a subset of the warnings provided by -Wconversion.
	  'GCC_WARN_64_TO_32_BIT_CONVERSION' => 'YES',

	  # Unchecking this setting will suppress warnings from applying the offsetof macro to a non-POD type.
	  # According to the 1998 ISO C++ standard, applying offsetof to a non-POD type is undefined.
	  'GCC_WARN_ABOUT_INVALID_OFFSETOF_MACRO' => 'YES',

	  # Warn when pointers passed via arguments or assigned to a variable differ in sign.
	  'GCC_WARN_ABOUT_POINTER_SIGNEDNESS' => 'YES',

	  # Warn if methods required by a protocol are not implemented in the class adopting it.  Only applies to Objective-C.
	  'GCC_WARN_ALLOW_INCOMPLETE_PROTOCOL' => 'YES',

	  # Warn when a source file does not end with a newline.
	  'GCC_WARN_ABOUT_MISSING_NEWLINE' => 'YES',

	  # Causes warnings to be emitted about missing prototypes.
	  'GCC_WARN_ABOUT_MISSING_PROTOTYPES' => 'YES',

	  # Causes warnings to be emitted when a function with a defined return type (not void) contains a return statement without a return-value. 
	  # Also emits a warning when a function is defined without specifying a return type.
	  'GCC_WARN_ABOUT_RETURN_TYPE' => 'YES',

	  # Warn whenever a switch statement has an index of enumeral type and lacks a case for one or more of the named codes of that enumeration.
	  # The presence of a default label prevents this warning. Case labels outside the enumeration range also provoke warnings when this option is used.
	  'GCC_WARN_CHECK_SWITCH_STATEMENTS' => 'YES',

	  # Warn about four-char literals (e.g., MacOS-style OSTypes: 'APPL').
	  'GCC_WARN_FOUR_CHARACTER_CONSTANTS' => 'YES',

	  # Warn if an aggregate or union initializer is not fully bracketed.
	  'GCC_WARN_INITIALIZER_NOT_FULLY_BRACKETED' => 'YES',

	  # Warn if parentheses are omitted in certain contexts, such as when there is an assignment in a context where a truth value is expected, or when operators are nested whose precedence people often get confused about.
	  'GCC_WARN_MISSING_PARENTHESES' => 'YES',

	  # Warn when a comparison between signed and unsigned values could produce an incorrect result when the signed value is converted to unsigned.
	  'GCC_WARN_SIGN_COMPARE' => 'YES',

	  # Check calls to printf and scanf, etc., to make sure that the arguments supplied have types appropriate to the format string specified, and that the conversions specified in the format string make sense.
	  'GCC_WARN_TYPECHECK_CALLS_TO_PRINTF' => 'YES',

	  # Warn whenever a statement computes a result that is explicitly not used.
	  'GCC_WARN_UNUSED_VALUE' => 'YES',

	  # Warn about the use of deprecated functions, variables, and types (as indicated by the 'deprecated' attribute).
	  'GCC_WARN_ABOUT_DEPRECATED_FUNCTIONS' => 'YES',

	  # Warn if a "@selector(...)" expression referring to an undeclared selector is found.
	  # A selector is considered undeclared if no method with that name has been declared before the "@selector(...)" expression, either explicitly in an @interface or @protocol declaration, or implicitly in an @implementation section.
	  # This option always performs its checks as soon as a "@selector(...)" expression is found, while -Wselector only performs its checks in the final stage of compilation.
	  # This also enforces the coding style convention that methods and selectors must be declared before being used.
	  'GCC_WARN_UNDECLARED_SELECTOR' => 'YES',

	  # Warn if a variable might be clobbered by a setjmp call or if an automatic variable is used without prior initialization.
	  'GCC_WARN_UNINITIALIZED_AUTOS' => 'YES',

	  # Warn whenever a static function is declared but not defined or a non-inline static function is unused.
	  'GCC_WARN_UNUSED_FUNCTION' => 'YES',

	  # Warn whenever a local variable or non-constant static variable is unused aside from its declaration.
	  'GCC_WARN_UNUSED_VARIABLE' => 'YES',

	  # Warn about assigning integer constants to enum values that are out of the range of the enumerated type.
	  # ----------------------------------------------------------------------------------------------------------------
	  # NOTE: In order to set a bitmask to 0, you must cast 0 to the type: 'SCNetworkReachabilityFlags flags = (SCNetworkReachabilityFlags)0;'.
	  'CLANG_WARN_ASSIGN_ENUM' => 'YES',

	  # Warn about using __bridge casts when not using ARC (where they have no effect).
	  'CLANG_WARN__ARC_BRIDGE_CAST_NONARC' => 'YES',

	  # Warn about implicit conversions to boolean values that are suspicious.  For example, writing 'if (foo)' with 'foo' being the name a function will trigger a warning.
	  'CLANG_WARN_BOOL_CONVERSION' => 'YES',

	  # Warn about implicit conversions of constant values that cause the constant value to change, either through a loss of precision, or entirely in its meaning.
	  'CLANG_WARN_CONSTANT_CONVERSION' => 'YES',

	  # Warn if an Objective-C class either subclasses a deprecated class or overrides a method that has been marked deprecated.
	  'CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS' => 'YES',

	  # Warn about direct accesses to the Objective-C 'isa' pointer instead of using a runtime API.
	  'CLANG_WARN_DIRECT_OBJC_ISA_USAGE' => 'YES',

	  # Warns about issues in documentation comments (doxygen-style) such as missing or incorrect documentation tags.
	  'CLANG_WARN_DOCUMENTATION_COMMENTS' => 'YES',

	  # Warn about loop bodies that are suspiciously empty.
	  'CLANG_WARN_EMPTY_BODY' => 'YES',

	  # Warn about implicit conversions between different kinds of enum values.  For example, this can catch issues when using the wrong enum flag as an argument to a function or method.
	  'CLANG_WARN_ENUM_CONVERSION' => 'YES',

	  # Warn about implicit integer conversions that change the signedness of an integer value.
	  'CLANG_WARN_IMPLICIT_SIGN_CONVERSION' => 'YES',

	  # Warn about implicit conversions between pointers and integers.  For example, this can catch issues when one incorrectly intermixes using NSNumber*'s and raw integers.
	  'CLANG_WARN_INT_CONVERSION' => 'YES',

	  # Warns when a nullable expression is used somewhere it’s not allowed (for example, passed as a _Nonnull parameter).
	  'CLANG_WARN_NULLABLE_TO_NONNULL_CONVERSION' => 'YES',

	  # Warn about implicit retains of 'self' within blocks, which can create a retain-cycle.
	  'CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF' => 'YES',

	  # Warn about classes that unintentionally do not subclass a root class (such as NSObject).
	  'CLANG_WARN_OBJC_ROOT_CLASS' => 'YES',

	  # Warn about various implicit conversions that can lose information or are otherwise suspicious.
	  'CLANG_WARN_SUSPICIOUS_IMPLICIT_CONVERSION' => 'YES',

	  # Warns about potentially unreachable code.
	  'CLANG_WARN_UNREACHABLE_CODE' => 'YES',

	  # Warn about declaring the same method more than once within the same @interface.
	  'CLANG_WARN__DUPLICATE_METHOD_MATCH' => 'YES',
	}
	

end
