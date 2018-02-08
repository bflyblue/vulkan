#include "vulkan/vulkan.h"

{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE MagicHash       #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE Strict          #-}
{-# LANGUAGE TypeFamilies    #-}
{-# LANGUAGE UnboxedTuples   #-}
{-# LANGUAGE ViewPatterns    #-}
module Graphics.Vulkan.Ext.VK_KHR_16bit_storage
       (-- * Vulkan extension: @VK_KHR_16bit_storage@
        -- |
        --
        -- supported: @vulkan@
        --
        -- contact: @Jan-Harald Fredriksen @janharald@
        --
        -- author: @KHR@
        --
        -- type: @device@
        --
        -- Extension number: @84@
        --
        -- Required extensions: 'VK_KHR_get_physical_device_properties2', 'VK_KHR_storage_buffer_storage_class'.
        --

        -- ** Required extensions: 'VK_KHR_get_physical_device_properties2', 'VK_KHR_storage_buffer_storage_class'.
        VkPhysicalDevice16BitStorageFeaturesKHR(..),
        VK_KHR_16BIT_STORAGE_SPEC_VERSION,
        pattern VK_KHR_16BIT_STORAGE_SPEC_VERSION,
        VK_KHR_16BIT_STORAGE_EXTENSION_NAME,
        pattern VK_KHR_16BIT_STORAGE_EXTENSION_NAME,
        pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES_KHR)
       where
import           Foreign.C.String                 (CString)
import           Foreign.Storable                 (Storable (..))
import           GHC.ForeignPtr                   (ForeignPtr (..),
                                                   ForeignPtrContents (..),
                                                   newForeignPtr_)
import           GHC.Prim
import           GHC.Ptr                          (Ptr (..))
import           GHC.Types                        (IO (..), Int (..))
import           Graphics.Vulkan.Common           (VkBool32,
                                                   VkStructureType (..))
import           Graphics.Vulkan.Marshal
import           Graphics.Vulkan.Marshal.Internal
import           Graphics.Vulkan.StructMembers
import           System.IO.Unsafe                 (unsafeDupablePerformIO)

-- | > typedef struct VkPhysicalDevice16BitStorageFeaturesKHR {
--   >     VkStructureType sType;
--   >     void*      pNext;
--   >     VkBool32                         storageBuffer16BitAccess;
--   >     VkBool32                         uniformAndStorageBuffer16BitAccess;
--   >     VkBool32                         storagePushConstant16;
--   >     VkBool32                         storageInputOutput16;
--   > } VkPhysicalDevice16BitStorageFeaturesKHR;
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/VkPhysicalDevice16BitStorageFeaturesKHR.html VkPhysicalDevice16BitStorageFeaturesKHR registry at www.khronos.org>
data VkPhysicalDevice16BitStorageFeaturesKHR = VkPhysicalDevice16BitStorageFeaturesKHR## ByteArray##

instance Eq VkPhysicalDevice16BitStorageFeaturesKHR where
        (VkPhysicalDevice16BitStorageFeaturesKHR## a) ==
          (VkPhysicalDevice16BitStorageFeaturesKHR## b)
          = EQ == cmpImmutableContent a b

        {-# INLINE (==) #-}

instance Ord VkPhysicalDevice16BitStorageFeaturesKHR where
        (VkPhysicalDevice16BitStorageFeaturesKHR## a) `compare`
          (VkPhysicalDevice16BitStorageFeaturesKHR## b)
          = cmpImmutableContent a b

        {-# INLINE compare #-}

instance Storable VkPhysicalDevice16BitStorageFeaturesKHR where
        sizeOf ~_
          = #{size VkPhysicalDevice16BitStorageFeaturesKHR}

        {-# INLINE sizeOf #-}
        alignment ~_
          = #{alignment VkPhysicalDevice16BitStorageFeaturesKHR}

        {-# INLINE alignment #-}
        peek (Ptr addr)
          | I## n <- sizeOf
                      (undefined :: VkPhysicalDevice16BitStorageFeaturesKHR),
            I## a <- alignment
                      (undefined :: VkPhysicalDevice16BitStorageFeaturesKHR)
            =
            IO
              (\ s ->
                 case newAlignedPinnedByteArray## n a s of
                     (## s1, mba ##) -> case copyAddrToByteArray## addr mba 0## n s1 of
                                          s2 -> case unsafeFreezeByteArray## mba s2 of
                                                    (## s3, ba ##) -> (## s3,
                                                                       VkPhysicalDevice16BitStorageFeaturesKHR##
                                                                         ba ##))

        {-# INLINE peek #-}
        poke (Ptr addr) (VkPhysicalDevice16BitStorageFeaturesKHR## ba)
          | I## n <- sizeOf
                      (undefined :: VkPhysicalDevice16BitStorageFeaturesKHR)
            = IO (\ s -> (## copyByteArrayToAddr## ba 0## addr n s, () ##))

        {-# INLINE poke #-}

instance VulkanMarshal VkPhysicalDevice16BitStorageFeaturesKHR
         where
        {-# INLINE newVkData #-}
        newVkData f
          | I## n <- sizeOf
                      (undefined :: VkPhysicalDevice16BitStorageFeaturesKHR),
            I## a <- alignment
                      (undefined :: VkPhysicalDevice16BitStorageFeaturesKHR)
            =
            IO
              (\ s0 ->
                 case newAlignedPinnedByteArray## n a s0 of
                     (## s1, mba ##) -> case unsafeFreezeByteArray## mba s1 of
                                          (## s2, ba ##) -> case f (Ptr (byteArrayContents## ba)) of
                                                              IO k -> case k s2 of
                                                                          (## s3, () ##) -> (## s3,
                                                                                             VkPhysicalDevice16BitStorageFeaturesKHR##
                                                                                               ba ##))

        {-# INLINE unsafePtr #-}
        unsafePtr (VkPhysicalDevice16BitStorageFeaturesKHR## ba)
          = Ptr (byteArrayContents## ba)

        {-# INLINE fromForeignPtr #-}
        fromForeignPtr
          = fromForeignPtr## VkPhysicalDevice16BitStorageFeaturesKHR##

        {-# INLINE toForeignPtr #-}
        toForeignPtr (VkPhysicalDevice16BitStorageFeaturesKHR## ba)
          = do ForeignPtr addr (PlainForeignPtr r) <- newForeignPtr_
                                                        (Ptr (byteArrayContents## ba))
               IO
                 (\ s -> (## s, ForeignPtr addr (MallocPtr (unsafeCoerce## ba) r) ##))

        {-# INLINE toPlainForeignPtr #-}
        toPlainForeignPtr (VkPhysicalDevice16BitStorageFeaturesKHR## ba)
          = IO
              (\ s ->
                 (## s,
                    ForeignPtr (byteArrayContents## ba)
                      (PlainPtr (unsafeCoerce## ba)) ##))

        {-# INLINE touchVkData #-}
        touchVkData x@(VkPhysicalDevice16BitStorageFeaturesKHR## ba)
          = IO (\ s -> (## touch## x (touch## ba s), () ##))

instance {-# OVERLAPPING #-}
         HasVkSType VkPhysicalDevice16BitStorageFeaturesKHR where
        type VkSTypeMType VkPhysicalDevice16BitStorageFeaturesKHR =
             VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPhysicalDevice16BitStorageFeaturesKHR, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkPhysicalDevice16BitStorageFeaturesKHR, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkPhysicalDevice16BitStorageFeaturesKHR, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkPhysicalDevice16BitStorageFeaturesKHR, sType}

instance {-# OVERLAPPING #-}
         HasVkPNext VkPhysicalDevice16BitStorageFeaturesKHR where
        type VkPNextMType VkPhysicalDevice16BitStorageFeaturesKHR =
             Ptr Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPhysicalDevice16BitStorageFeaturesKHR, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkPhysicalDevice16BitStorageFeaturesKHR, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkPhysicalDevice16BitStorageFeaturesKHR, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkPhysicalDevice16BitStorageFeaturesKHR, pNext}

instance {-# OVERLAPPING #-}
         HasVkStorageBuffer16BitAccess
           VkPhysicalDevice16BitStorageFeaturesKHR
         where
        type VkStorageBuffer16BitAccessMType
               VkPhysicalDevice16BitStorageFeaturesKHR
             = VkBool32

        {-# NOINLINE vkStorageBuffer16BitAccess #-}
        vkStorageBuffer16BitAccess x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPhysicalDevice16BitStorageFeaturesKHR, storageBuffer16BitAccess})

        {-# INLINE vkStorageBuffer16BitAccessByteOffset #-}
        vkStorageBuffer16BitAccessByteOffset ~_
          = #{offset VkPhysicalDevice16BitStorageFeaturesKHR, storageBuffer16BitAccess}

        {-# INLINE readVkStorageBuffer16BitAccess #-}
        readVkStorageBuffer16BitAccess p
          = peekByteOff p #{offset VkPhysicalDevice16BitStorageFeaturesKHR, storageBuffer16BitAccess}

        {-# INLINE writeVkStorageBuffer16BitAccess #-}
        writeVkStorageBuffer16BitAccess p
          = pokeByteOff p #{offset VkPhysicalDevice16BitStorageFeaturesKHR, storageBuffer16BitAccess}

instance {-# OVERLAPPING #-}
         HasVkUniformAndStorageBuffer16BitAccess
           VkPhysicalDevice16BitStorageFeaturesKHR
         where
        type VkUniformAndStorageBuffer16BitAccessMType
               VkPhysicalDevice16BitStorageFeaturesKHR
             = VkBool32

        {-# NOINLINE vkUniformAndStorageBuffer16BitAccess #-}
        vkUniformAndStorageBuffer16BitAccess x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPhysicalDevice16BitStorageFeaturesKHR, uniformAndStorageBuffer16BitAccess})

        {-# INLINE vkUniformAndStorageBuffer16BitAccessByteOffset #-}
        vkUniformAndStorageBuffer16BitAccessByteOffset ~_
          = #{offset VkPhysicalDevice16BitStorageFeaturesKHR, uniformAndStorageBuffer16BitAccess}

        {-# INLINE readVkUniformAndStorageBuffer16BitAccess #-}
        readVkUniformAndStorageBuffer16BitAccess p
          = peekByteOff p #{offset VkPhysicalDevice16BitStorageFeaturesKHR, uniformAndStorageBuffer16BitAccess}

        {-# INLINE writeVkUniformAndStorageBuffer16BitAccess #-}
        writeVkUniformAndStorageBuffer16BitAccess p
          = pokeByteOff p #{offset VkPhysicalDevice16BitStorageFeaturesKHR, uniformAndStorageBuffer16BitAccess}

instance {-# OVERLAPPING #-}
         HasVkStoragePushConstant16 VkPhysicalDevice16BitStorageFeaturesKHR
         where
        type VkStoragePushConstant16MType
               VkPhysicalDevice16BitStorageFeaturesKHR
             = VkBool32

        {-# NOINLINE vkStoragePushConstant16 #-}
        vkStoragePushConstant16 x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPhysicalDevice16BitStorageFeaturesKHR, storagePushConstant16})

        {-# INLINE vkStoragePushConstant16ByteOffset #-}
        vkStoragePushConstant16ByteOffset ~_
          = #{offset VkPhysicalDevice16BitStorageFeaturesKHR, storagePushConstant16}

        {-# INLINE readVkStoragePushConstant16 #-}
        readVkStoragePushConstant16 p
          = peekByteOff p #{offset VkPhysicalDevice16BitStorageFeaturesKHR, storagePushConstant16}

        {-# INLINE writeVkStoragePushConstant16 #-}
        writeVkStoragePushConstant16 p
          = pokeByteOff p #{offset VkPhysicalDevice16BitStorageFeaturesKHR, storagePushConstant16}

instance {-# OVERLAPPING #-}
         HasVkStorageInputOutput16 VkPhysicalDevice16BitStorageFeaturesKHR
         where
        type VkStorageInputOutput16MType
               VkPhysicalDevice16BitStorageFeaturesKHR
             = VkBool32

        {-# NOINLINE vkStorageInputOutput16 #-}
        vkStorageInputOutput16 x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPhysicalDevice16BitStorageFeaturesKHR, storageInputOutput16})

        {-# INLINE vkStorageInputOutput16ByteOffset #-}
        vkStorageInputOutput16ByteOffset ~_
          = #{offset VkPhysicalDevice16BitStorageFeaturesKHR, storageInputOutput16}

        {-# INLINE readVkStorageInputOutput16 #-}
        readVkStorageInputOutput16 p
          = peekByteOff p #{offset VkPhysicalDevice16BitStorageFeaturesKHR, storageInputOutput16}

        {-# INLINE writeVkStorageInputOutput16 #-}
        writeVkStorageInputOutput16 p
          = pokeByteOff p #{offset VkPhysicalDevice16BitStorageFeaturesKHR, storageInputOutput16}

instance Show VkPhysicalDevice16BitStorageFeaturesKHR where
        showsPrec d x
          = showString "VkPhysicalDevice16BitStorageFeaturesKHR {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkStorageBuffer16BitAccess = " .
                            showsPrec d (vkStorageBuffer16BitAccess x) .
                              showString ", " .
                                showString "vkUniformAndStorageBuffer16BitAccess = " .
                                  showsPrec d (vkUniformAndStorageBuffer16BitAccess x) .
                                    showString ", " .
                                      showString "vkStoragePushConstant16 = " .
                                        showsPrec d (vkStoragePushConstant16 x) .
                                          showString ", " .
                                            showString "vkStorageInputOutput16 = " .
                                              showsPrec d (vkStorageInputOutput16 x) . showChar '}'

pattern VK_KHR_16BIT_STORAGE_SPEC_VERSION :: (Num a, Eq a) => a

pattern VK_KHR_16BIT_STORAGE_SPEC_VERSION = 1

type VK_KHR_16BIT_STORAGE_SPEC_VERSION = 1

pattern VK_KHR_16BIT_STORAGE_EXTENSION_NAME :: CString

pattern VK_KHR_16BIT_STORAGE_EXTENSION_NAME <-
        (is_VK_KHR_16BIT_STORAGE_EXTENSION_NAME -> True)
  where VK_KHR_16BIT_STORAGE_EXTENSION_NAME
          = _VK_KHR_16BIT_STORAGE_EXTENSION_NAME

_VK_KHR_16BIT_STORAGE_EXTENSION_NAME :: CString

{-# INLINE _VK_KHR_16BIT_STORAGE_EXTENSION_NAME #-}
_VK_KHR_16BIT_STORAGE_EXTENSION_NAME
  = Ptr "VK_KHR_16bit_storage\NUL"##

is_VK_KHR_16BIT_STORAGE_EXTENSION_NAME :: CString -> Bool

{-# INLINE is_VK_KHR_16BIT_STORAGE_EXTENSION_NAME #-}
is_VK_KHR_16BIT_STORAGE_EXTENSION_NAME
  = (_VK_KHR_16BIT_STORAGE_EXTENSION_NAME ==)

type VK_KHR_16BIT_STORAGE_EXTENSION_NAME = "VK_KHR_16bit_storage"

pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES_KHR
        :: VkStructureType

pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES_KHR
        = VkStructureType 1000083000