{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_repro (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/workspaces/stack-multiproj-repo/.stack-work/install/x86_64-linux/01c8ef2fa79c4022364631d4556d8eb15ccd25a1899c2d88c963420f1853a412/8.8.3/bin"
libdir     = "/workspaces/stack-multiproj-repo/.stack-work/install/x86_64-linux/01c8ef2fa79c4022364631d4556d8eb15ccd25a1899c2d88c963420f1853a412/8.8.3/lib/x86_64-linux-ghc-8.8.3/repro-0.1.0.0-DPQSZpnRDYYDiQlYDuKCXS-repro-exe"
dynlibdir  = "/workspaces/stack-multiproj-repo/.stack-work/install/x86_64-linux/01c8ef2fa79c4022364631d4556d8eb15ccd25a1899c2d88c963420f1853a412/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/workspaces/stack-multiproj-repo/.stack-work/install/x86_64-linux/01c8ef2fa79c4022364631d4556d8eb15ccd25a1899c2d88c963420f1853a412/8.8.3/share/x86_64-linux-ghc-8.8.3/repro-0.1.0.0"
libexecdir = "/workspaces/stack-multiproj-repo/.stack-work/install/x86_64-linux/01c8ef2fa79c4022364631d4556d8eb15ccd25a1899c2d88c963420f1853a412/8.8.3/libexec/x86_64-linux-ghc-8.8.3/repro-0.1.0.0"
sysconfdir = "/workspaces/stack-multiproj-repo/.stack-work/install/x86_64-linux/01c8ef2fa79c4022364631d4556d8eb15ccd25a1899c2d88c963420f1853a412/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "repro_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "repro_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "repro_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "repro_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "repro_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "repro_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
