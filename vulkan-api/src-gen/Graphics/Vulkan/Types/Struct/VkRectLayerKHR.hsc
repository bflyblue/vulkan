#include "vulkan/vulkan.h"

{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MagicHash             #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE Strict                #-}
{-# LANGUAGE TypeFamilies          #-}
module Graphics.Vulkan.Types.Struct.VkRectLayerKHR
       (VkRectLayerKHR(..)) where
import           Foreign.Storable                        (Storable (..))
import           GHC.Prim
import           Graphics.Vulkan.Marshal
import           Graphics.Vulkan.Marshal.Internal
import           Graphics.Vulkan.Types.Struct.VkExtent2D (VkExtent2D)
import           Graphics.Vulkan.Types.Struct.VkOffset2D (VkOffset2D)
import           Graphics.Vulkan.Types.StructMembers
import           System.IO.Unsafe                        (unsafeDupablePerformIO)

-- | > typedef struct VkRectLayerKHR {
--   >     VkOffset2D                       offset;
--   >     VkExtent2D                       extent;
--   >     uint32_t                         layer;
--   > } VkRectLayerKHR;
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/man/html/VkRectLayerKHR.html VkRectLayerKHR registry at www.khronos.org>
data VkRectLayerKHR = VkRectLayerKHR## Addr## ByteArray##

instance Eq VkRectLayerKHR where
        (VkRectLayerKHR## a _) == x@(VkRectLayerKHR## b _)
          = EQ == cmpBytes## (sizeOf x) a b

        {-# INLINE (==) #-}

instance Ord VkRectLayerKHR where
        (VkRectLayerKHR## a _) `compare` x@(VkRectLayerKHR## b _)
          = cmpBytes## (sizeOf x) a b

        {-# INLINE compare #-}

instance Storable VkRectLayerKHR where
        sizeOf ~_ = #{size VkRectLayerKHR}

        {-# INLINE sizeOf #-}
        alignment ~_ = #{alignment VkRectLayerKHR}

        {-# INLINE alignment #-}
        peek = peekVkData##

        {-# INLINE peek #-}
        poke = pokeVkData##

        {-# INLINE poke #-}

instance VulkanMarshalPrim VkRectLayerKHR where
        unsafeAddr (VkRectLayerKHR## a _) = a

        {-# INLINE unsafeAddr #-}
        unsafeByteArray (VkRectLayerKHR## _ b) = b

        {-# INLINE unsafeByteArray #-}
        unsafeFromByteArrayOffset off b
          = VkRectLayerKHR## (plusAddr## (byteArrayContents## b) off) b

        {-# INLINE unsafeFromByteArrayOffset #-}

instance VulkanMarshal VkRectLayerKHR where
        type StructFields VkRectLayerKHR = '["offset", "extent", "layer"] -- ' closing tick for hsc2hs
        type CUnionType VkRectLayerKHR = 'False -- ' closing tick for hsc2hs
        type ReturnedOnly VkRectLayerKHR = 'False -- ' closing tick for hsc2hs
        type StructExtends VkRectLayerKHR = '[] -- ' closing tick for hsc2hs

instance {-# OVERLAPPING #-} HasVkOffset VkRectLayerKHR where
        type VkOffsetMType VkRectLayerKHR = VkOffset2D

        {-# NOINLINE vkOffset #-}
        vkOffset x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkRectLayerKHR, offset})

        {-# INLINE vkOffsetByteOffset #-}
        vkOffsetByteOffset ~_
          = #{offset VkRectLayerKHR, offset}

        {-# INLINE readVkOffset #-}
        readVkOffset p
          = peekByteOff p #{offset VkRectLayerKHR, offset}

        {-# INLINE writeVkOffset #-}
        writeVkOffset p
          = pokeByteOff p #{offset VkRectLayerKHR, offset}

instance {-# OVERLAPPING #-} HasField "offset" VkRectLayerKHR where
        type FieldType "offset" VkRectLayerKHR = VkOffset2D
        type FieldOptional "offset" VkRectLayerKHR = 'False -- ' closing tick for hsc2hs
        type FieldOffset "offset" VkRectLayerKHR =
             #{offset VkRectLayerKHR, offset}
        type FieldIsArray "offset" VkRectLayerKHR = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset = #{offset VkRectLayerKHR, offset}

instance CanReadField "offset" VkRectLayerKHR where
        {-# INLINE getField #-}
        getField = vkOffset

        {-# INLINE readField #-}
        readField = readVkOffset

instance CanWriteField "offset" VkRectLayerKHR where
        {-# INLINE writeField #-}
        writeField = writeVkOffset

instance {-# OVERLAPPING #-} HasVkExtent VkRectLayerKHR where
        type VkExtentMType VkRectLayerKHR = VkExtent2D

        {-# NOINLINE vkExtent #-}
        vkExtent x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkRectLayerKHR, extent})

        {-# INLINE vkExtentByteOffset #-}
        vkExtentByteOffset ~_
          = #{offset VkRectLayerKHR, extent}

        {-# INLINE readVkExtent #-}
        readVkExtent p
          = peekByteOff p #{offset VkRectLayerKHR, extent}

        {-# INLINE writeVkExtent #-}
        writeVkExtent p
          = pokeByteOff p #{offset VkRectLayerKHR, extent}

instance {-# OVERLAPPING #-} HasField "extent" VkRectLayerKHR where
        type FieldType "extent" VkRectLayerKHR = VkExtent2D
        type FieldOptional "extent" VkRectLayerKHR = 'False -- ' closing tick for hsc2hs
        type FieldOffset "extent" VkRectLayerKHR =
             #{offset VkRectLayerKHR, extent}
        type FieldIsArray "extent" VkRectLayerKHR = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset = #{offset VkRectLayerKHR, extent}

instance CanReadField "extent" VkRectLayerKHR where
        {-# INLINE getField #-}
        getField = vkExtent

        {-# INLINE readField #-}
        readField = readVkExtent

instance CanWriteField "extent" VkRectLayerKHR where
        {-# INLINE writeField #-}
        writeField = writeVkExtent

instance {-# OVERLAPPING #-} HasVkLayer VkRectLayerKHR where
        type VkLayerMType VkRectLayerKHR = Word32

        {-# NOINLINE vkLayer #-}
        vkLayer x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkRectLayerKHR, layer})

        {-# INLINE vkLayerByteOffset #-}
        vkLayerByteOffset ~_ = #{offset VkRectLayerKHR, layer}

        {-# INLINE readVkLayer #-}
        readVkLayer p
          = peekByteOff p #{offset VkRectLayerKHR, layer}

        {-# INLINE writeVkLayer #-}
        writeVkLayer p
          = pokeByteOff p #{offset VkRectLayerKHR, layer}

instance {-# OVERLAPPING #-} HasField "layer" VkRectLayerKHR where
        type FieldType "layer" VkRectLayerKHR = Word32
        type FieldOptional "layer" VkRectLayerKHR = 'False -- ' closing tick for hsc2hs
        type FieldOffset "layer" VkRectLayerKHR =
             #{offset VkRectLayerKHR, layer}
        type FieldIsArray "layer" VkRectLayerKHR = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset = #{offset VkRectLayerKHR, layer}

instance CanReadField "layer" VkRectLayerKHR where
        {-# INLINE getField #-}
        getField = vkLayer

        {-# INLINE readField #-}
        readField = readVkLayer

instance CanWriteField "layer" VkRectLayerKHR where
        {-# INLINE writeField #-}
        writeField = writeVkLayer

instance Show VkRectLayerKHR where
        showsPrec d x
          = showString "VkRectLayerKHR {" .
              showString "vkOffset = " .
                showsPrec d (vkOffset x) .
                  showString ", " .
                    showString "vkExtent = " .
                      showsPrec d (vkExtent x) .
                        showString ", " .
                          showString "vkLayer = " . showsPrec d (vkLayer x) . showChar '}'