/// `StatesEnum` is an enumeration representing different states a process can be in.
/// It includes regular, loading, and error states.
enum StatesEnum {
  
  /// Represents the regular state.
  regular,

  /// Represents the loading state.
  loading,

  /// Represents the error state.
  error;

  /// Checks if the current state is regular.
  ///
  /// Returns `true` if the current state is regular, `false` otherwise.
  bool get isRegular => this == StatesEnum.regular;

  /// Checks if the current state is loading.
  ///
  /// Returns `true` if the current state is loading, `false` otherwise.
  bool get isLoading => this == StatesEnum.loading;

  /// Checks if the current state is error.
  ///
  /// Returns `true` if the current state is error, `false` otherwise.
  bool get isError => this == StatesEnum.error;

  /// Executes a function based on the current state.
  ///
  /// This method accepts three functions, one for each state, and executes the one
  /// corresponding to the current state.
  ///
  /// [regular] The function to be executed if the state is regular.
  /// [loading] The function to be executed if the state is loading.
  /// [error] The function to be executed if the state is error.
  ///
  /// @return The return value of the executed function.
  T when<T>({
    required T Function() regular,
    required T Function() loading,
    required T Function() error,
  }) {
    switch (this) {
      case StatesEnum.regular:
        return regular.call();
      case StatesEnum.loading:
        return loading.call();
      case StatesEnum.error:
        return error.call();
    }
  }
}