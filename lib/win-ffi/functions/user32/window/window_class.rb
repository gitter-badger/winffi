require_relative '../../../enums/user32/window/class_long'
require_relative '../../../enums/user32/window/window_long'

require_relative '../../../structs/user32/window/wndclass'
require_relative '../../../structs/user32/window/wndclassex'

module WinFFI
  module User32
    #BOOL WINAPI GetClassInfo(
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      LPCTSTR lpClassName,
    #  _Out_     LPWNDCLASS lpWndClass )
    attach_function 'GetClassInfoA', [:hinstance, :pointer, WNDCLASS.ptr], :bool
    attach_function 'GetClassInfoW', [:hinstance, :pointer, WNDCLASS.ptr], :bool

    #BOOL WINAPI GetClassInfoEx(
    #  _In_opt_  HINSTANCE hinst,
    #  _In_      LPCTSTR lpszClass,
    #  _Out_     LPWNDCLASSEX lpwcx )
    attach_function 'GetClassInfoExA', [:hinstance, :pointer, WNDCLASSEX.ptr], :bool
    attach_function 'GetClassInfoExW', [:hinstance, :pointer, WNDCLASSEX.ptr], :bool

    #DWORD WINAPI GetClassLong(
    #  __in  HWND hWnd,
    #  __in  int nIndex)
    attach_function 'GetClassLongA', [:hwnd, ClassLong], :dword
    attach_function 'GetClassLongW', [:hwnd, ClassLong], :dword

    #ULONG_PTR WINAPI GetClassLongPtr(
    #  __in  HWND hWnd,
    #  __in  int nIndex)
    #attach_function 'GetClassLongPtrA', [:hwnd, ClassLong], :ulong
    #attach_function 'GetClassLongPtrW', [:hwnd, ClassLong], :ulong

    #int WINAPI GetClassName(
    #  _In_   HWND hWnd,
    #  _Out_  LPTSTR lpClassName,
    #  _In_   int nMaxCount )
    attach_function 'GetClassNameA', [:hwnd, :string, :int], :int
    attach_function 'GetClassNameW', [:hwnd, :string, :int], :int

    #WORD WINAPI GetClassWord(
    #  _In_  HWND hWnd,
    #  _In_  int nIndex )
    attach_function 'GetClassWord', [:hwnd, :int], :word

    #LONG WINAPI GetWindowLong(
    #  __in  HWND hWnd,
    #  __in  int nIndex)
    attach_function 'GetWindowLongA', [:hwnd, ClassLong], :long
    attach_function 'GetWindowLongW', [:hwnd, ClassLong], :long

    #ATOM WINAPI RegisterClass( _In_  const WNDCLASS *lpWndClass )
    attach_function 'RegisterClassA', [WNDCLASS.ptr], :atom
    attach_function 'RegisterClassW', [WNDCLASS.ptr], :atom

    #ATOM RegisterClassEx( __in  const WNDCLASSEX *lpwcx )
    attach_function 'RegisterClassExA', [:pointer], :atom
    attach_function 'RegisterClassExW', [:pointer], :atom

    #DWORD WINAPI SetClassLong(
    #  __in  HWND hWnd,
    #  __in  int nIndex,
    #  __in  LONG dwNewLong)
    attach_function 'SetClassLongA', [:hwnd, ClassLong, :long], :dword
    attach_function 'SetClassLongW', [:hwnd, ClassLong, :long], :dword

    #WORD WINAPI SetClassWord(
    #  _In_  HWND hWnd,
    #  _In_  int nIndex,
    #  _In_  WORD wNewWord )
    attach_function 'SetClassWord', [:hwnd, :int, :word], :word

    #LONG WINAPI SetWindowLong(
    #  __in  HWND hWnd,
    #  __in  int nIndex,
    #  __in  LONG dwNewLong)
    attach_function 'SetWindowLongA', [:hwnd, WindowLong, :long], :long
    attach_function 'SetWindowLongW', [:hwnd, WindowLong, :long], :long

    #BOOL UnregisterClass(
    #  __in      LPCTSTR   lpClassName,
    #  __in_opt  HINSTANCE hInstance)
    attach_function 'UnregisterClassA', [:pointer, :hinstance], :bool
    attach_function 'UnregisterClassW', [:pointer, :hinstance], :bool

    begin
      #LONG_PTR WINAPI GetWindowLongPtr(
      #  __in  HWND hWnd,
      #  __in  int nIndex)
      attach_function 'GetWindowLongPtr',  [:hwnd, :int], :pointer
      attach_function 'GetWindowLongPtrA', [:hwnd, :int], :pointer
      attach_function 'GetWindowLongPtrW', [:hwnd, :int], :pointer

      #LONG_PTR WINAPI SetWindowLongPtr(
      #  __in  HWND hWnd,
      #  __in  int nIndex,
      #  __in  LONG_PTR dwNewLong)
      attach_function 'SetWindowLongPtr',  [:hwnd, WindowLong, :pointer], :pointer
      attach_function 'SetWindowLongPtrA', [:hwnd, WindowLong, :pointer], :pointer
      attach_function 'SetWindowLongPtrW', [:hwnd, WindowLong, :pointer], :pointer
    rescue FFI::NotFoundError
      # In 32-bit Windows, these methods are aliases for GetWindowLong and SetWindowLong
    end
  end
end