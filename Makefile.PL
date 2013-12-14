
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Include jQuery in your distribution",
  "AUTHOR" => "Graham Ollis <perl\@wdlabs.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dist-Zilla-Plugin-jQuery",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dist::Zilla::Plugin::jQuery",
  "PREREQ_PM" => {
    "Dist::Zilla::Role::FileGatherer" => 0,
    "File::HomeDir" => 0,
    "File::Temp" => 0,
    "Moose" => 0,
    "Moose::Util::TypeConstraints" => 0,
    "Path::Class" => "0.26",
    "Resource::Pack::jQuery" => 0,
    "namespace::autoclean" => 0
  },
  "TEST_REQUIRES" => {
    "Test::More" => 0
  },
  "VERSION" => "0.03",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Dist::Zilla::Role::FileGatherer" => 0,
  "File::HomeDir" => 0,
  "File::Temp" => 0,
  "Moose" => 0,
  "Moose::Util::TypeConstraints" => 0,
  "Path::Class" => "0.26",
  "Resource::Pack::jQuery" => 0,
  "Test::More" => 0,
  "namespace::autoclean" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



