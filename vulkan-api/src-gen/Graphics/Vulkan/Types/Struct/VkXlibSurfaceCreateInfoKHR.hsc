#include "vulkan/vulkan.h"

{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MagicHash             #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE Strict                #-}
{-# LANGUAGE TypeFamilies          #-}
module Graphics.Vulkan.Types.Struct.VkXlibSurfaceCreateInfoKHR
       (VkXlibSurfaceCreateInfoKHR(..)) where
import           Foreign.Storable                           (Storable (..))
import           GHC.Prim
import           Graphics.Vulkan.Marshal
import           Graphics.Vulkan.Marshal.Internal
import           Graphics.Vulkan.Types.Bitmasks             (VkXlibSurfaceCreateFlagsKHR)
import           Graphics.Vulkan.Types.Enum.VkStructureType (VkStructureType)
import           Graphics.Vulkan.Types.Include              (Display, Window)
import           Graphics.Vulkan.Types.StructMembers
import           System.IO.Unsafe                           (unsafeDupablePerformIO)

-- | > typedef struct VkXlibSurfaceCreateInfoKHR {
--   >     VkStructureType sType;
--   >     const void*                      pNext;
--   >     VkXlibSurfaceCreateFlagsKHR   flags;
--   >     Display*                         dpy;
--   >     Window                           window;
--   > } VkXlibSurfaceCreateInfoKHR;
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/man/html/VkXlibSurfaceCreateInfoKHR.html VkXlibSurfaceCreateInfoKHR registry at www.khronos.org>
data VkXlibSurfaceCreateInfoKHR = VkXlibSurfaceCreateInfoKHR## Addr##
                                                              ByteArray##

instance Eq VkXlibSurfaceCreateInfoKHR where
        (VkXlibSurfaceCreateInfoKHR## a _) ==
          x@(VkXlibSurfaceCreateInfoKHR## b _)
          = EQ == cmpBytes## (sizeOf x) a b

        {-# INLINE (==) #-}

instance Ord VkXlibSurfaceCreateInfoKHR where
        (VkXlibSurfaceCreateInfoKHR## a _) `compare`
          x@(VkXlibSurfaceCreateInfoKHR## b _) = cmpBytes## (sizeOf x) a b

        {-# INLINE compare #-}

instance Storable VkXlibSurfaceCreateInfoKHR where
        sizeOf ~_ = #{size VkXlibSurfaceCreateInfoKHR}

        {-# INLINE sizeOf #-}
        alignment ~_ = #{alignment VkXlibSurfaceCreateInfoKHR}

        {-# INLINE alignment #-}
        peek = peekVkData##

        {-# INLINE peek #-}
        poke = pokeVkData##

        {-# INLINE poke #-}

instance VulkanMarshalPrim VkXlibSurfaceCreateInfoKHR where
        unsafeAddr (VkXlibSurfaceCreateInfoKHR## a _) = a

        {-# INLINE unsafeAddr #-}
        unsafeByteArray (VkXlibSurfaceCreateInfoKHR## _ b) = b

        {-# INLINE unsafeByteArray #-}
        unsafeFromByteArrayOffset off b
          = VkXlibSurfaceCreateInfoKHR##
              (plusAddr## (byteArrayContents## b) off)
              b

        {-# INLINE unsafeFromByteArrayOffset #-}

instance VulkanMarshal VkXlibSurfaceCreateInfoKHR where
        type StructFields VkXlibSurfaceCreateInfoKHR =
             '["sType", "pNext", "flags", "dpy", "window"] -- ' closing tick for hsc2hs
        type CUnionType VkXlibSurfaceCreateInfoKHR = 'False -- ' closing tick for hsc2hs
        type ReturnedOnly VkXlibSurfaceCreateInfoKHR = 'False -- ' closing tick for hsc2hs
        type StructExtends VkXlibSurfaceCreateInfoKHR = '[] -- ' closing tick for hsc2hs

instance {-# OVERLAPPING #-} HasVkSType VkXlibSurfaceCreateInfoKHR
         where
        type VkSTypeMType VkXlibSurfaceCreateInfoKHR = VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkXlibSurfaceCreateInfoKHR, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkXlibSurfaceCreateInfoKHR, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkXlibSurfaceCreateInfoKHR, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkXlibSurfaceCreateInfoKHR, sType}

instance {-# OVERLAPPING #-}
         HasField "sType" VkXlibSurfaceCreateInfoKHR where
        type FieldType "sType" VkXlibSurfaceCreateInfoKHR = VkStructureType
        type FieldOptional "sType" VkXlibSurfaceCreateInfoKHR = 'False -- ' closing tick for hsc2hs
        type FieldOffset "sType" VkXlibSurfaceCreateInfoKHR =
             #{offset VkXlibSurfaceCreateInfoKHR, sType}
        type FieldIsArray "sType" VkXlibSurfaceCreateInfoKHR = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkXlibSurfaceCreateInfoKHR, sType}

instance CanReadField "sType" VkXlibSurfaceCreateInfoKHR where
        {-# INLINE getField #-}
        getField = vkSType

        {-# INLINE readField #-}
        readField = readVkSType

instance CanWriteField "sType" VkXlibSurfaceCreateInfoKHR where
        {-# INLINE writeField #-}
        writeField = writeVkSType

instance {-# OVERLAPPING #-} HasVkPNext VkXlibSurfaceCreateInfoKHR
         where
        type VkPNextMType VkXlibSurfaceCreateInfoKHR = Ptr Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkXlibSurfaceCreateInfoKHR, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkXlibSurfaceCreateInfoKHR, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkXlibSurfaceCreateInfoKHR, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkXlibSurfaceCreateInfoKHR, pNext}

instance {-# OVERLAPPING #-}
         HasField "pNext" VkXlibSurfaceCreateInfoKHR where
        type FieldType "pNext" VkXlibSurfaceCreateInfoKHR = Ptr Void
        type FieldOptional "pNext" VkXlibSurfaceCreateInfoKHR = 'False -- ' closing tick for hsc2hs
        type FieldOffset "pNext" VkXlibSurfaceCreateInfoKHR =
             #{offset VkXlibSurfaceCreateInfoKHR, pNext}
        type FieldIsArray "pNext" VkXlibSurfaceCreateInfoKHR = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkXlibSurfaceCreateInfoKHR, pNext}

instance CanReadField "pNext" VkXlibSurfaceCreateInfoKHR where
        {-# INLINE getField #-}
        getField = vkPNext

        {-# INLINE readField #-}
        readField = readVkPNext

instance CanWriteField "pNext" VkXlibSurfaceCreateInfoKHR where
        {-# INLINE writeField #-}
        writeField = writeVkPNext

instance {-# OVERLAPPING #-} HasVkFlags VkXlibSurfaceCreateInfoKHR
         where
        type VkFlagsMType VkXlibSurfaceCreateInfoKHR =
             VkXlibSurfaceCreateFlagsKHR

        {-# NOINLINE vkFlags #-}
        vkFlags x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkXlibSurfaceCreateInfoKHR, flags})

        {-# INLINE vkFlagsByteOffset #-}
        vkFlagsByteOffset ~_
          = #{offset VkXlibSurfaceCreateInfoKHR, flags}

        {-# INLINE readVkFlags #-}
        readVkFlags p
          = peekByteOff p #{offset VkXlibSurfaceCreateInfoKHR, flags}

        {-# INLINE writeVkFlags #-}
        writeVkFlags p
          = pokeByteOff p #{offset VkXlibSurfaceCreateInfoKHR, flags}

instance {-# OVERLAPPING #-}
         HasField "flags" VkXlibSurfaceCreateInfoKHR where
        type FieldType "flags" VkXlibSurfaceCreateInfoKHR =
             VkXlibSurfaceCreateFlagsKHR
        type FieldOptional "flags" VkXlibSurfaceCreateInfoKHR = 'True -- ' closing tick for hsc2hs
        type FieldOffset "flags" VkXlibSurfaceCreateInfoKHR =
             #{offset VkXlibSurfaceCreateInfoKHR, flags}
        type FieldIsArray "flags" VkXlibSurfaceCreateInfoKHR = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = True

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkXlibSurfaceCreateInfoKHR, flags}

instance CanReadField "flags" VkXlibSurfaceCreateInfoKHR where
        {-# INLINE getField #-}
        getField = vkFlags

        {-# INLINE readField #-}
        readField = readVkFlags

instance CanWriteField "flags" VkXlibSurfaceCreateInfoKHR where
        {-# INLINE writeField #-}
        writeField = writeVkFlags

instance {-# OVERLAPPING #-} HasVkDpy VkXlibSurfaceCreateInfoKHR
         where
        type VkDpyMType VkXlibSurfaceCreateInfoKHR = Ptr Display

        {-# NOINLINE vkDpy #-}
        vkDpy x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkXlibSurfaceCreateInfoKHR, dpy})

        {-# INLINE vkDpyByteOffset #-}
        vkDpyByteOffset ~_
          = #{offset VkXlibSurfaceCreateInfoKHR, dpy}

        {-# INLINE readVkDpy #-}
        readVkDpy p
          = peekByteOff p #{offset VkXlibSurfaceCreateInfoKHR, dpy}

        {-# INLINE writeVkDpy #-}
        writeVkDpy p
          = pokeByteOff p #{offset VkXlibSurfaceCreateInfoKHR, dpy}

instance {-# OVERLAPPING #-}
         HasField "dpy" VkXlibSurfaceCreateInfoKHR where
        type FieldType "dpy" VkXlibSurfaceCreateInfoKHR = Ptr Display
        type FieldOptional "dpy" VkXlibSurfaceCreateInfoKHR = 'False -- ' closing tick for hsc2hs
        type FieldOffset "dpy" VkXlibSurfaceCreateInfoKHR =
             #{offset VkXlibSurfaceCreateInfoKHR, dpy}
        type FieldIsArray "dpy" VkXlibSurfaceCreateInfoKHR = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset = #{offset VkXlibSurfaceCreateInfoKHR, dpy}

instance CanReadField "dpy" VkXlibSurfaceCreateInfoKHR where
        {-# INLINE getField #-}
        getField = vkDpy

        {-# INLINE readField #-}
        readField = readVkDpy

instance CanWriteField "dpy" VkXlibSurfaceCreateInfoKHR where
        {-# INLINE writeField #-}
        writeField = writeVkDpy

instance {-# OVERLAPPING #-} HasVkWindow VkXlibSurfaceCreateInfoKHR
         where
        type VkWindowMType VkXlibSurfaceCreateInfoKHR = Window

        {-# NOINLINE vkWindow #-}
        vkWindow x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkXlibSurfaceCreateInfoKHR, window})

        {-# INLINE vkWindowByteOffset #-}
        vkWindowByteOffset ~_
          = #{offset VkXlibSurfaceCreateInfoKHR, window}

        {-# INLINE readVkWindow #-}
        readVkWindow p
          = peekByteOff p #{offset VkXlibSurfaceCreateInfoKHR, window}

        {-# INLINE writeVkWindow #-}
        writeVkWindow p
          = pokeByteOff p #{offset VkXlibSurfaceCreateInfoKHR, window}

instance {-# OVERLAPPING #-}
         HasField "window" VkXlibSurfaceCreateInfoKHR where
        type FieldType "window" VkXlibSurfaceCreateInfoKHR = Window
        type FieldOptional "window" VkXlibSurfaceCreateInfoKHR = 'False -- ' closing tick for hsc2hs
        type FieldOffset "window" VkXlibSurfaceCreateInfoKHR =
             #{offset VkXlibSurfaceCreateInfoKHR, window}
        type FieldIsArray "window" VkXlibSurfaceCreateInfoKHR = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkXlibSurfaceCreateInfoKHR, window}

instance CanReadField "window" VkXlibSurfaceCreateInfoKHR where
        {-# INLINE getField #-}
        getField = vkWindow

        {-# INLINE readField #-}
        readField = readVkWindow

instance CanWriteField "window" VkXlibSurfaceCreateInfoKHR where
        {-# INLINE writeField #-}
        writeField = writeVkWindow

instance Show VkXlibSurfaceCreateInfoKHR where
        showsPrec d x
          = showString "VkXlibSurfaceCreateInfoKHR {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkFlags = " .
                            showsPrec d (vkFlags x) .
                              showString ", " .
                                showString "vkDpy = " .
                                  showsPrec d (vkDpy x) .
                                    showString ", " .
                                      showString "vkWindow = " .
                                        showsPrec d (vkWindow x) . showChar '}'