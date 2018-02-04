#include "vulkan/vulkan.h"
{-# OPTIONS_GHC -fno-warn-missing-methods#-}
{-# OPTIONS_GHC -fno-warn-unticked-promoted-constructors#-}
{-# LANGUAGE DataKinds                #-}
{-# LANGUAGE FlexibleContexts         #-}
{-# LANGUAGE FlexibleInstances        #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE MagicHash                #-}
{-# LANGUAGE Strict                   #-}
{-# LANGUAGE TypeFamilies             #-}
{-# LANGUAGE TypeOperators            #-}
{-# LANGUAGE UnboxedTuples            #-}
{-# LANGUAGE UndecidableInstances     #-}
{-# LANGUAGE UnliftedFFITypes         #-}
module Graphics.Vulkan.Core
       (-- ** Vulkan core API interface definitions
        -- |
        --
        -- @api = vulkan@
        --
        -- @name = VK_VERSION_1_0@
        --
        -- @number = 1.0@
        --

        -- *** Not referenced, but required definitions
        --

        -- *** Header boilerplate
        --
        -- |
        -- > ##include "vk_platform.h"
        --

        -- *** API version
        --

        -- *** API constants
        --

        -- *** Device initialization
        vkCreateInstance, vkDestroyInstance, vkEnumeratePhysicalDevices,
        vkGetPhysicalDeviceFeatures, vkGetPhysicalDeviceFormatProperties,
        vkGetPhysicalDeviceImageFormatProperties,
        vkGetPhysicalDeviceProperties,
        vkGetPhysicalDeviceQueueFamilyProperties,
        vkGetPhysicalDeviceMemoryProperties, vkGetInstanceProcAddr,
        vkGetDeviceProcAddr, -- *** Device commands
                             vkCreateDevice, vkDestroyDevice,
        -- *** Extension discovery commands
        vkEnumerateInstanceExtensionProperties,
        vkEnumerateDeviceExtensionProperties,
        -- *** Layer discovery commands
        vkEnumerateInstanceLayerProperties,
        vkEnumerateDeviceLayerProperties, -- *** queue commands
                                          vkGetDeviceQueue, vkQueueSubmit,
        vkQueueWaitIdle, vkDeviceWaitIdle, -- *** Memory commands
                                           vkAllocateMemory, vkFreeMemory,
        vkMapMemory, vkUnmapMemory, vkFlushMappedMemoryRanges,
        vkInvalidateMappedMemoryRanges, vkGetDeviceMemoryCommitment,
        -- *** Memory management API commands
        vkBindBufferMemory, vkBindImageMemory,
        vkGetBufferMemoryRequirements, vkGetImageMemoryRequirements,
        -- *** Sparse resource memory management API commands
        vkGetImageSparseMemoryRequirements,
        vkGetPhysicalDeviceSparseImageFormatProperties, vkQueueBindSparse,
        -- *** Fence commands
        vkCreateFence, vkDestroyFence, vkResetFences, vkGetFenceStatus,
        vkWaitForFences, -- *** Queue semaphore commands
                         vkCreateSemaphore, vkDestroySemaphore,
        -- *** Event commands
        vkCreateEvent, vkDestroyEvent, vkGetEventStatus, vkSetEvent,
        vkResetEvent, -- *** Query commands
                      vkCreateQueryPool, vkDestroyQueryPool,
        vkGetQueryPoolResults, -- *** Buffer commands
                               vkCreateBuffer, vkDestroyBuffer,
        -- *** Buffer view commands
        vkCreateBufferView, vkDestroyBufferView, -- *** Image commands
                                                 vkCreateImage,
        vkDestroyImage, vkGetImageSubresourceLayout, -- *** Image view commands
                                                     vkCreateImageView,
        vkDestroyImageView, -- *** Shader commands
                            vkCreateShaderModule, vkDestroyShaderModule,
        -- *** Pipeline Cache commands
        vkCreatePipelineCache, vkDestroyPipelineCache,
        vkGetPipelineCacheData, vkMergePipelineCaches,
        -- *** Pipeline commands
        vkCreateGraphicsPipelines, vkCreateComputePipelines,
        vkDestroyPipeline, -- *** Pipeline layout commands
                           vkCreatePipelineLayout, vkDestroyPipelineLayout,
        -- *** Sampler commands
        vkCreateSampler, vkDestroySampler, -- *** Descriptor set commands
                                           vkCreateDescriptorSetLayout,
        vkDestroyDescriptorSetLayout, vkCreateDescriptorPool,
        vkDestroyDescriptorPool, vkResetDescriptorPool,
        vkAllocateDescriptorSets, vkFreeDescriptorSets,
        vkUpdateDescriptorSets, -- *** Pass commands
                                vkCreateFramebuffer, vkDestroyFramebuffer,
        vkCreateRenderPass, vkDestroyRenderPass,
        vkGetRenderAreaGranularity, -- *** Command pool commands
                                    vkCreateCommandPool,
        vkDestroyCommandPool, vkResetCommandPool, -- *** Command buffer commands
                                                  vkAllocateCommandBuffers,
        vkFreeCommandBuffers, vkBeginCommandBuffer, vkEndCommandBuffer,
        vkResetCommandBuffer, -- *** Command buffer building commands
                              vkCmdBindPipeline, vkCmdSetViewport,
        vkCmdSetScissor, vkCmdSetLineWidth, vkCmdSetDepthBias,
        vkCmdSetBlendConstants, vkCmdSetDepthBounds,
        vkCmdSetStencilCompareMask, vkCmdSetStencilWriteMask,
        vkCmdSetStencilReference, vkCmdBindDescriptorSets,
        vkCmdBindIndexBuffer, vkCmdBindVertexBuffers, vkCmdDraw,
        vkCmdDrawIndexed, vkCmdDrawIndirect, vkCmdDrawIndexedIndirect,
        vkCmdDispatch, vkCmdDispatchIndirect, vkCmdCopyBuffer,
        vkCmdCopyImage, vkCmdBlitImage, vkCmdCopyBufferToImage,
        vkCmdCopyImageToBuffer, vkCmdUpdateBuffer, vkCmdFillBuffer,
        vkCmdClearColorImage, vkCmdClearDepthStencilImage,
        vkCmdClearAttachments, vkCmdResolveImage, vkCmdSetEvent,
        vkCmdResetEvent, vkCmdWaitEvents, vkCmdPipelineBarrier,
        vkCmdBeginQuery, vkCmdEndQuery, vkCmdResetQueryPool,
        vkCmdWriteTimestamp, vkCmdCopyQueryPoolResults, vkCmdPushConstants,
        vkCmdBeginRenderPass, vkCmdNextSubpass, vkCmdEndRenderPass,
        vkCmdExecuteCommands, -- *** Types not directly used by the API. Include e.g. structs that are not parameter types of commands, but still defined by the API.
                              HasVkSrcQueueFamilyIndex(..),
        HasVkDstQueueFamilyIndex(..), VkBufferMemoryBarrier(..),
        VkDispatchIndirectCommand(..), HasVkIndexCount(..),
        HasVkInstanceCount(..), HasVkFirstIndex(..), HasVkVertexOffset(..),
        HasVkFirstInstance(..), VkDrawIndexedIndirectCommand(..),
        HasVkVertexCount(..), HasVkFirstVertex(..),
        VkDrawIndirectCommand(..), HasVkOldLayout(..), HasVkNewLayout(..),
        VkImageMemoryBarrier(..), VkMemoryBarrier(..))
       where
import           Data.Int                         (Int32)
import           Data.Void                        (Void)
import           Data.Word                        (Word32, Word64, Word8)
import           Foreign.C.Types                  (CChar (..), CFloat (..),
                                                   CInt (..), CSize, CSize (..),
                                                   CULong (..))
import           Foreign.Ptr                      (Ptr)
import           Foreign.Storable                 (Storable (..))
import           GHC.ForeignPtr                   (ForeignPtr (..),
                                                   ForeignPtrContents (..),
                                                   newForeignPtr_)
import           GHC.Prim
import           GHC.Ptr                          (Ptr (..))
import           GHC.TypeLits                     (ErrorMessage (..), TypeError)
import           GHC.Types                        (IO (..), Int (..))
import           Graphics.Vulkan.Base
import           Graphics.Vulkan.Common
import           Graphics.Vulkan.Marshal
import           Graphics.Vulkan.Marshal.Internal
import           System.IO.Unsafe                 (unsafeDupablePerformIO)

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_INITIALIZATION_FAILED', 'VK_ERROR_LAYER_NOT_PRESENT', 'VK_ERROR_EXTENSION_NOT_PRESENT', 'VK_ERROR_INCOMPATIBLE_DRIVER'.
--
--   > VkResult vkCreateInstance
--   >     ( const VkInstanceCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkInstance* pInstance
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateInstance.html vkCreateInstance registry at www.khronos.org>
foreign import ccall unsafe "vkCreateInstance" vkCreateInstance ::
               Foreign.Ptr.Ptr VkInstanceCreateInfo -- ^ pCreateInfo
                                                    ->
                 Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                       ->
                   Foreign.Ptr.Ptr VkInstance -- ^ pInstance
                                              -> IO VkResult

-- | > void vkDestroyInstance
--   >     ( VkInstance instance
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyInstance.html vkDestroyInstance registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyInstance" vkDestroyInstance
               :: VkInstance -- ^ instance
                             -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                      -> IO ()

-- | Success codes: 'VK_SUCCESS', 'VK_INCOMPLETE'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_INITIALIZATION_FAILED'.
--
--   > VkResult vkEnumeratePhysicalDevices
--   >     ( VkInstance instance
--   >     , uint32_t* pPhysicalDeviceCount
--   >     , VkPhysicalDevice* pPhysicalDevices
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkEnumeratePhysicalDevices.html vkEnumeratePhysicalDevices registry at www.khronos.org>
foreign import ccall unsafe "vkEnumeratePhysicalDevices"
               vkEnumeratePhysicalDevices ::
               VkInstance -- ^ instance
                          ->
                 Foreign.Ptr.Ptr Data.Word.Word32 -- ^ pPhysicalDeviceCount
                                                  ->
                   Foreign.Ptr.Ptr VkPhysicalDevice -- ^ pPhysicalDevices
                                                    -> IO VkResult

-- | > void vkGetPhysicalDeviceFeatures
--   >     ( VkPhysicalDevice physicalDevice
--   >     , VkPhysicalDeviceFeatures* pFeatures
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetPhysicalDeviceFeatures.html vkGetPhysicalDeviceFeatures registry at www.khronos.org>
foreign import ccall unsafe "vkGetPhysicalDeviceFeatures"
               vkGetPhysicalDeviceFeatures ::
               VkPhysicalDevice -- ^ physicalDevice
                                ->
                 Foreign.Ptr.Ptr VkPhysicalDeviceFeatures -- ^ pFeatures
                                                          -> IO ()

-- | > void vkGetPhysicalDeviceFormatProperties
--   >     ( VkPhysicalDevice physicalDevice
--   >     , VkFormat format
--   >     , VkFormatProperties* pFormatProperties
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetPhysicalDeviceFormatProperties.html vkGetPhysicalDeviceFormatProperties registry at www.khronos.org>
foreign import ccall unsafe "vkGetPhysicalDeviceFormatProperties"
               vkGetPhysicalDeviceFormatProperties ::
               VkPhysicalDevice -- ^ physicalDevice
                                ->
                 VkFormat -- ^ format
                          -> Foreign.Ptr.Ptr VkFormatProperties -- ^ pFormatProperties
                                                                -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_FORMAT_NOT_SUPPORTED'.
--
--   > VkResult vkGetPhysicalDeviceImageFormatProperties
--   >     ( VkPhysicalDevice physicalDevice
--   >     , VkFormat format
--   >     , VkImageType type
--   >     , VkImageTiling tiling
--   >     , VkImageUsageFlags usage
--   >     , VkImageCreateFlags flags
--   >     , VkImageFormatProperties* pImageFormatProperties
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetPhysicalDeviceImageFormatProperties.html vkGetPhysicalDeviceImageFormatProperties registry at www.khronos.org>
foreign import ccall unsafe
               "vkGetPhysicalDeviceImageFormatProperties"
               vkGetPhysicalDeviceImageFormatProperties ::
               VkPhysicalDevice -- ^ physicalDevice
                                ->
                 VkFormat -- ^ format
                          ->
                   VkImageType -- ^ type
                               ->
                     VkImageTiling -- ^ tiling
                                   ->
                       VkImageUsageFlags -- ^ usage
                                         ->
                         VkImageCreateFlags -- ^ flags
                                            ->
                           Foreign.Ptr.Ptr VkImageFormatProperties -- ^ pImageFormatProperties
                                                                   -> IO VkResult

-- | > void vkGetPhysicalDeviceProperties
--   >     ( VkPhysicalDevice physicalDevice
--   >     , VkPhysicalDeviceProperties* pProperties
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetPhysicalDeviceProperties.html vkGetPhysicalDeviceProperties registry at www.khronos.org>
foreign import ccall unsafe "vkGetPhysicalDeviceProperties"
               vkGetPhysicalDeviceProperties ::
               VkPhysicalDevice -- ^ physicalDevice
                                ->
                 Foreign.Ptr.Ptr VkPhysicalDeviceProperties -- ^ pProperties
                                                            -> IO ()

-- | > void vkGetPhysicalDeviceQueueFamilyProperties
--   >     ( VkPhysicalDevice physicalDevice
--   >     , uint32_t* pQueueFamilyPropertyCount
--   >     , VkQueueFamilyProperties* pQueueFamilyProperties
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html vkGetPhysicalDeviceQueueFamilyProperties registry at www.khronos.org>
foreign import ccall unsafe
               "vkGetPhysicalDeviceQueueFamilyProperties"
               vkGetPhysicalDeviceQueueFamilyProperties ::
               VkPhysicalDevice -- ^ physicalDevice
                                ->
                 Foreign.Ptr.Ptr Data.Word.Word32 -- ^ pQueueFamilyPropertyCount
                                                  ->
                   Foreign.Ptr.Ptr VkQueueFamilyProperties -- ^ pQueueFamilyProperties
                                                           -> IO ()

-- | > void vkGetPhysicalDeviceMemoryProperties
--   >     ( VkPhysicalDevice physicalDevice
--   >     , VkPhysicalDeviceMemoryProperties* pMemoryProperties
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetPhysicalDeviceMemoryProperties.html vkGetPhysicalDeviceMemoryProperties registry at www.khronos.org>
foreign import ccall unsafe "vkGetPhysicalDeviceMemoryProperties"
               vkGetPhysicalDeviceMemoryProperties ::
               VkPhysicalDevice -- ^ physicalDevice
                                ->
                 Foreign.Ptr.Ptr VkPhysicalDeviceMemoryProperties -- ^ pMemoryProperties
                                                                  -> IO ()

-- | > PFN_vkVoidFunction vkGetInstanceProcAddr
--   >     ( VkInstance instance
--   >     , const char* pName
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetInstanceProcAddr.html vkGetInstanceProcAddr registry at www.khronos.org>
foreign import ccall unsafe "vkGetInstanceProcAddr"
               vkGetInstanceProcAddr ::
               VkInstance -- ^ instance
                          ->
                 Foreign.Ptr.Ptr Foreign.C.Types.CChar -- ^ pName
                                                       -> IO PFN_vkVoidFunction

-- | > PFN_vkVoidFunction vkGetDeviceProcAddr
--   >     ( VkDevice device
--   >     , const char* pName
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetDeviceProcAddr.html vkGetDeviceProcAddr registry at www.khronos.org>
foreign import ccall unsafe "vkGetDeviceProcAddr"
               vkGetDeviceProcAddr ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr Foreign.C.Types.CChar -- ^ pName
                                                       -> IO PFN_vkVoidFunction

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_INITIALIZATION_FAILED', 'VK_ERROR_EXTENSION_NOT_PRESENT', 'VK_ERROR_FEATURE_NOT_PRESENT', 'VK_ERROR_TOO_MANY_OBJECTS', 'VK_ERROR_DEVICE_LOST'.
--
--   > VkResult vkCreateDevice
--   >     ( VkPhysicalDevice physicalDevice
--   >     , const VkDeviceCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkDevice* pDevice
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateDevice.html vkCreateDevice registry at www.khronos.org>
foreign import ccall unsafe "vkCreateDevice" vkCreateDevice ::
               VkPhysicalDevice -- ^ physicalDevice
                                ->
                 Foreign.Ptr.Ptr VkDeviceCreateInfo -- ^ pCreateInfo
                                                    ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkDevice -- ^ pDevice
                                              -> IO VkResult

-- | > void vkDestroyDevice
--   >     ( VkDevice device
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyDevice.html vkDestroyDevice registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyDevice" vkDestroyDevice ::
               VkDevice -- ^ device
                        -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                 -> IO ()

-- | Success codes: 'VK_SUCCESS', 'VK_INCOMPLETE'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_LAYER_NOT_PRESENT'.
--
--   > VkResult vkEnumerateInstanceExtensionProperties
--   >     ( const char* pLayerName
--   >     , uint32_t* pPropertyCount
--   >     , VkExtensionProperties* pProperties
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkEnumerateInstanceExtensionProperties.html vkEnumerateInstanceExtensionProperties registry at www.khronos.org>
foreign import ccall unsafe
               "vkEnumerateInstanceExtensionProperties"
               vkEnumerateInstanceExtensionProperties ::
               Foreign.Ptr.Ptr Foreign.C.Types.CChar -- ^ pLayerName
                                                     ->
                 Foreign.Ptr.Ptr Data.Word.Word32 -- ^ pPropertyCount
                                                  ->
                   Foreign.Ptr.Ptr VkExtensionProperties -- ^ pProperties
                                                         -> IO VkResult

-- | Success codes: 'VK_SUCCESS', 'VK_INCOMPLETE'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_LAYER_NOT_PRESENT'.
--
--   > VkResult vkEnumerateDeviceExtensionProperties
--   >     ( VkPhysicalDevice physicalDevice
--   >     , const char* pLayerName
--   >     , uint32_t* pPropertyCount
--   >     , VkExtensionProperties* pProperties
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkEnumerateDeviceExtensionProperties.html vkEnumerateDeviceExtensionProperties registry at www.khronos.org>
foreign import ccall unsafe "vkEnumerateDeviceExtensionProperties"
               vkEnumerateDeviceExtensionProperties ::
               VkPhysicalDevice -- ^ physicalDevice
                                ->
                 Foreign.Ptr.Ptr Foreign.C.Types.CChar -- ^ pLayerName
                                                       ->
                   Foreign.Ptr.Ptr Data.Word.Word32 -- ^ pPropertyCount
                                                    ->
                     Foreign.Ptr.Ptr VkExtensionProperties -- ^ pProperties
                                                           -> IO VkResult

-- | Success codes: 'VK_SUCCESS', 'VK_INCOMPLETE'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkEnumerateInstanceLayerProperties
--   >     ( uint32_t* pPropertyCount
--   >     , VkLayerProperties* pProperties
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkEnumerateInstanceLayerProperties.html vkEnumerateInstanceLayerProperties registry at www.khronos.org>
foreign import ccall unsafe "vkEnumerateInstanceLayerProperties"
               vkEnumerateInstanceLayerProperties ::
               Foreign.Ptr.Ptr Data.Word.Word32 -- ^ pPropertyCount
                                                ->
                 Foreign.Ptr.Ptr VkLayerProperties -- ^ pProperties
                                                   -> IO VkResult

-- | Success codes: 'VK_SUCCESS', 'VK_INCOMPLETE'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkEnumerateDeviceLayerProperties
--   >     ( VkPhysicalDevice physicalDevice
--   >     , uint32_t* pPropertyCount
--   >     , VkLayerProperties* pProperties
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkEnumerateDeviceLayerProperties.html vkEnumerateDeviceLayerProperties registry at www.khronos.org>
foreign import ccall unsafe "vkEnumerateDeviceLayerProperties"
               vkEnumerateDeviceLayerProperties ::
               VkPhysicalDevice -- ^ physicalDevice
                                ->
                 Foreign.Ptr.Ptr Data.Word.Word32 -- ^ pPropertyCount
                                                  ->
                   Foreign.Ptr.Ptr VkLayerProperties -- ^ pProperties
                                                     -> IO VkResult

-- | > void vkGetDeviceQueue
--   >     ( VkDevice device
--   >     , uint32_t queueFamilyIndex
--   >     , uint32_t queueIndex
--   >     , VkQueue* pQueue
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetDeviceQueue.html vkGetDeviceQueue registry at www.khronos.org>
foreign import ccall unsafe "vkGetDeviceQueue" vkGetDeviceQueue ::
               VkDevice -- ^ device
                        ->
                 Data.Word.Word32 -- ^ queueFamilyIndex
                                  ->
                   Data.Word.Word32 -- ^ queueIndex
                                    -> Foreign.Ptr.Ptr VkQueue -- ^ pQueue
                                                               -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_DEVICE_LOST'.
--
--   > VkResult vkQueueSubmit
--   >     ( VkQueue queue
--   >     , uint32_t submitCount
--   >     , const VkSubmitInfo* pSubmits
--   >     , VkFence fence
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkQueueSubmit.html vkQueueSubmit registry at www.khronos.org>
foreign import ccall unsafe "vkQueueSubmit" vkQueueSubmit ::
               VkQueue -- ^ queue
                       ->
                 Data.Word.Word32 -- ^ submitCount
                                  ->
                   Foreign.Ptr.Ptr VkSubmitInfo -- ^ pSubmits
                                                -> VkFence -- ^ fence
                                                           -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_DEVICE_LOST'.
--
--   > VkResult vkQueueWaitIdle
--   >     ( VkQueue queue
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkQueueWaitIdle.html vkQueueWaitIdle registry at www.khronos.org>
foreign import ccall unsafe "vkQueueWaitIdle" vkQueueWaitIdle ::
               VkQueue -- ^ queue
                       -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_DEVICE_LOST'.
--
--   > VkResult vkDeviceWaitIdle
--   >     ( VkDevice device
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDeviceWaitIdle.html vkDeviceWaitIdle registry at www.khronos.org>
foreign import ccall unsafe "vkDeviceWaitIdle" vkDeviceWaitIdle ::
               VkDevice -- ^ device
                        -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_TOO_MANY_OBJECTS', 'VK_ERROR_INVALID_EXTERNAL_HANDLE_KHR'.
--
--   > VkResult vkAllocateMemory
--   >     ( VkDevice device
--   >     , const VkMemoryAllocateInfo* pAllocateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkDeviceMemory* pMemory
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkAllocateMemory.html vkAllocateMemory registry at www.khronos.org>
foreign import ccall unsafe "vkAllocateMemory" vkAllocateMemory ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkMemoryAllocateInfo -- ^ pAllocateInfo
                                                      ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkDeviceMemory -- ^ pMemory
                                                    -> IO VkResult

-- | > void vkFreeMemory
--   >     ( VkDevice device
--   >     , VkDeviceMemory memory
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkFreeMemory.html vkFreeMemory registry at www.khronos.org>
foreign import ccall unsafe "vkFreeMemory" vkFreeMemory ::
               VkDevice -- ^ device
                        ->
                 VkDeviceMemory -- ^ memory
                                -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                         -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_MEMORY_MAP_FAILED'.
--
--   > VkResult vkMapMemory
--   >     ( VkDevice device
--   >     , VkDeviceMemory memory
--   >     , VkDeviceSize offset
--   >     , VkDeviceSize size
--   >     , VkMemoryMapFlags flags
--   >     , void** ppData
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkMapMemory.html vkMapMemory registry at www.khronos.org>
foreign import ccall unsafe "vkMapMemory" vkMapMemory ::
               VkDevice -- ^ device
                        ->
                 VkDeviceMemory -- ^ memory
                                ->
                   VkDeviceSize -- ^ offset
                                ->
                     VkDeviceSize -- ^ size
                                  ->
                       VkMemoryMapFlags -- ^ flags
                                        ->
                         Foreign.Ptr.Ptr (Foreign.Ptr.Ptr Data.Void.Void) -- ^ ppData
                                                                          -> IO VkResult

-- | > void vkUnmapMemory
--   >     ( VkDevice device
--   >     , VkDeviceMemory memory
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkUnmapMemory.html vkUnmapMemory registry at www.khronos.org>
foreign import ccall unsafe "vkUnmapMemory" vkUnmapMemory ::
               VkDevice -- ^ device
                        -> VkDeviceMemory -- ^ memory
                                          -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkFlushMappedMemoryRanges
--   >     ( VkDevice device
--   >     , uint32_t memoryRangeCount
--   >     , const VkMappedMemoryRange* pMemoryRanges
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkFlushMappedMemoryRanges.html vkFlushMappedMemoryRanges registry at www.khronos.org>
foreign import ccall unsafe "vkFlushMappedMemoryRanges"
               vkFlushMappedMemoryRanges ::
               VkDevice -- ^ device
                        ->
                 Data.Word.Word32 -- ^ memoryRangeCount
                                  ->
                   Foreign.Ptr.Ptr VkMappedMemoryRange -- ^ pMemoryRanges
                                                       -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkInvalidateMappedMemoryRanges
--   >     ( VkDevice device
--   >     , uint32_t memoryRangeCount
--   >     , const VkMappedMemoryRange* pMemoryRanges
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkInvalidateMappedMemoryRanges.html vkInvalidateMappedMemoryRanges registry at www.khronos.org>
foreign import ccall unsafe "vkInvalidateMappedMemoryRanges"
               vkInvalidateMappedMemoryRanges ::
               VkDevice -- ^ device
                        ->
                 Data.Word.Word32 -- ^ memoryRangeCount
                                  ->
                   Foreign.Ptr.Ptr VkMappedMemoryRange -- ^ pMemoryRanges
                                                       -> IO VkResult

-- | > void vkGetDeviceMemoryCommitment
--   >     ( VkDevice device
--   >     , VkDeviceMemory memory
--   >     , VkDeviceSize* pCommittedMemoryInBytes
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetDeviceMemoryCommitment.html vkGetDeviceMemoryCommitment registry at www.khronos.org>
foreign import ccall unsafe "vkGetDeviceMemoryCommitment"
               vkGetDeviceMemoryCommitment ::
               VkDevice -- ^ device
                        -> VkDeviceMemory -- ^ memory
                                          -> Foreign.Ptr.Ptr VkDeviceSize -- ^ pCommittedMemoryInBytes
                                                                          -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkBindBufferMemory
--   >     ( VkDevice device
--   >     , VkBuffer buffer
--   >     , VkDeviceMemory memory
--   >     , VkDeviceSize memoryOffset
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkBindBufferMemory.html vkBindBufferMemory registry at www.khronos.org>
foreign import ccall unsafe "vkBindBufferMemory" vkBindBufferMemory
               ::
               VkDevice -- ^ device
                        ->
                 VkBuffer -- ^ buffer
                          -> VkDeviceMemory -- ^ memory
                                            -> VkDeviceSize -- ^ memoryOffset
                                                            -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkBindImageMemory
--   >     ( VkDevice device
--   >     , VkImage image
--   >     , VkDeviceMemory memory
--   >     , VkDeviceSize memoryOffset
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkBindImageMemory.html vkBindImageMemory registry at www.khronos.org>
foreign import ccall unsafe "vkBindImageMemory" vkBindImageMemory
               ::
               VkDevice -- ^ device
                        ->
                 VkImage -- ^ image
                         -> VkDeviceMemory -- ^ memory
                                           -> VkDeviceSize -- ^ memoryOffset
                                                           -> IO VkResult

-- | > void vkGetBufferMemoryRequirements
--   >     ( VkDevice device
--   >     , VkBuffer buffer
--   >     , VkMemoryRequirements* pMemoryRequirements
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetBufferMemoryRequirements.html vkGetBufferMemoryRequirements registry at www.khronos.org>
foreign import ccall unsafe "vkGetBufferMemoryRequirements"
               vkGetBufferMemoryRequirements ::
               VkDevice -- ^ device
                        ->
                 VkBuffer -- ^ buffer
                          -> Foreign.Ptr.Ptr VkMemoryRequirements -- ^ pMemoryRequirements
                                                                  -> IO ()

-- | > void vkGetImageMemoryRequirements
--   >     ( VkDevice device
--   >     , VkImage image
--   >     , VkMemoryRequirements* pMemoryRequirements
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetImageMemoryRequirements.html vkGetImageMemoryRequirements registry at www.khronos.org>
foreign import ccall unsafe "vkGetImageMemoryRequirements"
               vkGetImageMemoryRequirements ::
               VkDevice -- ^ device
                        ->
                 VkImage -- ^ image
                         -> Foreign.Ptr.Ptr VkMemoryRequirements -- ^ pMemoryRequirements
                                                                 -> IO ()

-- | > void vkGetImageSparseMemoryRequirements
--   >     ( VkDevice device
--   >     , VkImage image
--   >     , uint32_t* pSparseMemoryRequirementCount
--   >     , VkSparseImageMemoryRequirements* pSparseMemoryRequirements
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetImageSparseMemoryRequirements.html vkGetImageSparseMemoryRequirements registry at www.khronos.org>
foreign import ccall unsafe "vkGetImageSparseMemoryRequirements"
               vkGetImageSparseMemoryRequirements ::
               VkDevice -- ^ device
                        ->
                 VkImage -- ^ image
                         ->
                   Foreign.Ptr.Ptr Data.Word.Word32 -- ^ pSparseMemoryRequirementCount
                                                    ->
                     Foreign.Ptr.Ptr VkSparseImageMemoryRequirements -- ^ pSparseMemoryRequirements
                                                                     -> IO ()

-- | > void vkGetPhysicalDeviceSparseImageFormatProperties
--   >     ( VkPhysicalDevice physicalDevice
--   >     , VkFormat format
--   >     , VkImageType type
--   >     , VkSampleCountFlagBits samples
--   >     , VkImageUsageFlags usage
--   >     , VkImageTiling tiling
--   >     , uint32_t* pPropertyCount
--   >     , VkSparseImageFormatProperties* pProperties
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetPhysicalDeviceSparseImageFormatProperties.html vkGetPhysicalDeviceSparseImageFormatProperties registry at www.khronos.org>
foreign import ccall unsafe
               "vkGetPhysicalDeviceSparseImageFormatProperties"
               vkGetPhysicalDeviceSparseImageFormatProperties ::
               VkPhysicalDevice -- ^ physicalDevice
                                ->
                 VkFormat -- ^ format
                          ->
                   VkImageType -- ^ type
                               ->
                     VkSampleCountFlagBits -- ^ samples
                                           ->
                       VkImageUsageFlags -- ^ usage
                                         ->
                         VkImageTiling -- ^ tiling
                                       ->
                           Foreign.Ptr.Ptr Data.Word.Word32 -- ^ pPropertyCount
                                                            ->
                             Foreign.Ptr.Ptr VkSparseImageFormatProperties -- ^ pProperties
                                                                           -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_DEVICE_LOST'.
--
--   queues: @sparse_binding@
--
--   > VkResult vkQueueBindSparse
--   >     ( VkQueue queue
--   >     , uint32_t bindInfoCount
--   >     , const VkBindSparseInfo* pBindInfo
--   >     , VkFence fence
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkQueueBindSparse.html vkQueueBindSparse registry at www.khronos.org>
foreign import ccall unsafe "vkQueueBindSparse" vkQueueBindSparse
               ::
               VkQueue -- ^ queue
                       ->
                 Data.Word.Word32 -- ^ bindInfoCount
                                  ->
                   Foreign.Ptr.Ptr VkBindSparseInfo -- ^ pBindInfo
                                                    -> VkFence -- ^ fence
                                                               -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateFence
--   >     ( VkDevice device
--   >     , const VkFenceCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkFence* pFence
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateFence.html vkCreateFence registry at www.khronos.org>
foreign import ccall unsafe "vkCreateFence" vkCreateFence ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkFenceCreateInfo -- ^ pCreateInfo
                                                   ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkFence -- ^ pFence
                                             -> IO VkResult

-- | > void vkDestroyFence
--   >     ( VkDevice device
--   >     , VkFence fence
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyFence.html vkDestroyFence registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyFence" vkDestroyFence ::
               VkDevice -- ^ device
                        ->
                 VkFence -- ^ fence
                         -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                  -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkResetFences
--   >     ( VkDevice device
--   >     , uint32_t fenceCount
--   >     , const VkFence* pFences
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkResetFences.html vkResetFences registry at www.khronos.org>
foreign import ccall unsafe "vkResetFences" vkResetFences ::
               VkDevice -- ^ device
                        ->
                 Data.Word.Word32 -- ^ fenceCount
                                  -> Foreign.Ptr.Ptr VkFence -- ^ pFences
                                                             -> IO VkResult

-- | Success codes: 'VK_SUCCESS', 'VK_NOT_READY'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_DEVICE_LOST'.
--
--   > VkResult vkGetFenceStatus
--   >     ( VkDevice device
--   >     , VkFence fence
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetFenceStatus.html vkGetFenceStatus registry at www.khronos.org>
foreign import ccall unsafe "vkGetFenceStatus" vkGetFenceStatus ::
               VkDevice -- ^ device
                        -> VkFence -- ^ fence
                                   -> IO VkResult

-- | Success codes: 'VK_SUCCESS', 'VK_TIMEOUT'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_DEVICE_LOST'.
--
--   > VkResult vkWaitForFences
--   >     ( VkDevice device
--   >     , uint32_t fenceCount
--   >     , const VkFence* pFences
--   >     , VkBool32 waitAll
--   >     , uint64_t timeout
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkWaitForFences.html vkWaitForFences registry at www.khronos.org>
foreign import ccall unsafe "vkWaitForFences" vkWaitForFences ::
               VkDevice -- ^ device
                        ->
                 Data.Word.Word32 -- ^ fenceCount
                                  ->
                   Foreign.Ptr.Ptr VkFence -- ^ pFences
                                           ->
                     VkBool32 -- ^ waitAll
                              -> Data.Word.Word64 -- ^ timeout
                                                  -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateSemaphore
--   >     ( VkDevice device
--   >     , const VkSemaphoreCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkSemaphore* pSemaphore
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateSemaphore.html vkCreateSemaphore registry at www.khronos.org>
foreign import ccall unsafe "vkCreateSemaphore" vkCreateSemaphore
               ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkSemaphoreCreateInfo -- ^ pCreateInfo
                                                       ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkSemaphore -- ^ pSemaphore
                                                 -> IO VkResult

-- | > void vkDestroySemaphore
--   >     ( VkDevice device
--   >     , VkSemaphore semaphore
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroySemaphore.html vkDestroySemaphore registry at www.khronos.org>
foreign import ccall unsafe "vkDestroySemaphore" vkDestroySemaphore
               ::
               VkDevice -- ^ device
                        ->
                 VkSemaphore -- ^ semaphore
                             -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                      -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateEvent
--   >     ( VkDevice device
--   >     , const VkEventCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkEvent* pEvent
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateEvent.html vkCreateEvent registry at www.khronos.org>
foreign import ccall unsafe "vkCreateEvent" vkCreateEvent ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkEventCreateInfo -- ^ pCreateInfo
                                                   ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkEvent -- ^ pEvent
                                             -> IO VkResult

-- | > void vkDestroyEvent
--   >     ( VkDevice device
--   >     , VkEvent event
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyEvent.html vkDestroyEvent registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyEvent" vkDestroyEvent ::
               VkDevice -- ^ device
                        ->
                 VkEvent -- ^ event
                         -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                  -> IO ()

-- | Success codes: 'VK_EVENT_SET', 'VK_EVENT_RESET'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_DEVICE_LOST'.
--
--   > VkResult vkGetEventStatus
--   >     ( VkDevice device
--   >     , VkEvent event
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetEventStatus.html vkGetEventStatus registry at www.khronos.org>
foreign import ccall unsafe "vkGetEventStatus" vkGetEventStatus ::
               VkDevice -- ^ device
                        -> VkEvent -- ^ event
                                   -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkSetEvent
--   >     ( VkDevice device
--   >     , VkEvent event
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkSetEvent.html vkSetEvent registry at www.khronos.org>
foreign import ccall unsafe "vkSetEvent" vkSetEvent ::
               VkDevice -- ^ device
                        -> VkEvent -- ^ event
                                   -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkResetEvent
--   >     ( VkDevice device
--   >     , VkEvent event
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkResetEvent.html vkResetEvent registry at www.khronos.org>
foreign import ccall unsafe "vkResetEvent" vkResetEvent ::
               VkDevice -- ^ device
                        -> VkEvent -- ^ event
                                   -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateQueryPool
--   >     ( VkDevice device
--   >     , const VkQueryPoolCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkQueryPool* pQueryPool
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateQueryPool.html vkCreateQueryPool registry at www.khronos.org>
foreign import ccall unsafe "vkCreateQueryPool" vkCreateQueryPool
               ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkQueryPoolCreateInfo -- ^ pCreateInfo
                                                       ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkQueryPool -- ^ pQueryPool
                                                 -> IO VkResult

-- | > void vkDestroyQueryPool
--   >     ( VkDevice device
--   >     , VkQueryPool queryPool
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyQueryPool.html vkDestroyQueryPool registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyQueryPool" vkDestroyQueryPool
               ::
               VkDevice -- ^ device
                        ->
                 VkQueryPool -- ^ queryPool
                             -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                      -> IO ()

-- | Success codes: 'VK_SUCCESS', 'VK_NOT_READY'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_DEVICE_LOST'.
--
--   > VkResult vkGetQueryPoolResults
--   >     ( VkDevice device
--   >     , VkQueryPool queryPool
--   >     , uint32_t firstQuery
--   >     , uint32_t queryCount
--   >     , size_t dataSize
--   >     , void* pData
--   >     , VkDeviceSize stride
--   >     , VkQueryResultFlags flags
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetQueryPoolResults.html vkGetQueryPoolResults registry at www.khronos.org>
foreign import ccall unsafe "vkGetQueryPoolResults"
               vkGetQueryPoolResults ::
               VkDevice -- ^ device
                        ->
                 VkQueryPool -- ^ queryPool
                             ->
                   Data.Word.Word32 -- ^ firstQuery
                                    ->
                     Data.Word.Word32 -- ^ queryCount
                                      ->
                       Foreign.C.Types.CSize -- ^ dataSize
                                             ->
                         Foreign.Ptr.Ptr Data.Void.Void -- ^ pData
                                                        ->
                           VkDeviceSize -- ^ stride
                                        -> VkQueryResultFlags -- ^ flags
                                                              -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateBuffer
--   >     ( VkDevice device
--   >     , const VkBufferCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkBuffer* pBuffer
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateBuffer.html vkCreateBuffer registry at www.khronos.org>
foreign import ccall unsafe "vkCreateBuffer" vkCreateBuffer ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkBufferCreateInfo -- ^ pCreateInfo
                                                    ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkBuffer -- ^ pBuffer
                                              -> IO VkResult

-- | > void vkDestroyBuffer
--   >     ( VkDevice device
--   >     , VkBuffer buffer
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyBuffer.html vkDestroyBuffer registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyBuffer" vkDestroyBuffer ::
               VkDevice -- ^ device
                        ->
                 VkBuffer -- ^ buffer
                          -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                   -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateBufferView
--   >     ( VkDevice device
--   >     , const VkBufferViewCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkBufferView* pView
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateBufferView.html vkCreateBufferView registry at www.khronos.org>
foreign import ccall unsafe "vkCreateBufferView" vkCreateBufferView
               ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkBufferViewCreateInfo -- ^ pCreateInfo
                                                        ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkBufferView -- ^ pView
                                                  -> IO VkResult

-- | > void vkDestroyBufferView
--   >     ( VkDevice device
--   >     , VkBufferView bufferView
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyBufferView.html vkDestroyBufferView registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyBufferView"
               vkDestroyBufferView ::
               VkDevice -- ^ device
                        ->
                 VkBufferView -- ^ bufferView
                              -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                       -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateImage
--   >     ( VkDevice device
--   >     , const VkImageCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkImage* pImage
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateImage.html vkCreateImage registry at www.khronos.org>
foreign import ccall unsafe "vkCreateImage" vkCreateImage ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkImageCreateInfo -- ^ pCreateInfo
                                                   ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkImage -- ^ pImage
                                             -> IO VkResult

-- | > void vkDestroyImage
--   >     ( VkDevice device
--   >     , VkImage image
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyImage.html vkDestroyImage registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyImage" vkDestroyImage ::
               VkDevice -- ^ device
                        ->
                 VkImage -- ^ image
                         -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                  -> IO ()

-- | > void vkGetImageSubresourceLayout
--   >     ( VkDevice device
--   >     , VkImage image
--   >     , const VkImageSubresource* pSubresource
--   >     , VkSubresourceLayout* pLayout
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetImageSubresourceLayout.html vkGetImageSubresourceLayout registry at www.khronos.org>
foreign import ccall unsafe "vkGetImageSubresourceLayout"
               vkGetImageSubresourceLayout ::
               VkDevice -- ^ device
                        ->
                 VkImage -- ^ image
                         ->
                   Foreign.Ptr.Ptr VkImageSubresource -- ^ pSubresource
                                                      ->
                     Foreign.Ptr.Ptr VkSubresourceLayout -- ^ pLayout
                                                         -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateImageView
--   >     ( VkDevice device
--   >     , const VkImageViewCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkImageView* pView
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateImageView.html vkCreateImageView registry at www.khronos.org>
foreign import ccall unsafe "vkCreateImageView" vkCreateImageView
               ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkImageViewCreateInfo -- ^ pCreateInfo
                                                       ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkImageView -- ^ pView
                                                 -> IO VkResult

-- | > void vkDestroyImageView
--   >     ( VkDevice device
--   >     , VkImageView imageView
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyImageView.html vkDestroyImageView registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyImageView" vkDestroyImageView
               ::
               VkDevice -- ^ device
                        ->
                 VkImageView -- ^ imageView
                             -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                      -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_INVALID_SHADER_NV'.
--
--   > VkResult vkCreateShaderModule
--   >     ( VkDevice device
--   >     , const VkShaderModuleCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkShaderModule* pShaderModule
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateShaderModule.html vkCreateShaderModule registry at www.khronos.org>
foreign import ccall unsafe "vkCreateShaderModule"
               vkCreateShaderModule ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkShaderModuleCreateInfo -- ^ pCreateInfo
                                                          ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkShaderModule -- ^ pShaderModule
                                                    -> IO VkResult

-- | > void vkDestroyShaderModule
--   >     ( VkDevice device
--   >     , VkShaderModule shaderModule
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyShaderModule.html vkDestroyShaderModule registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyShaderModule"
               vkDestroyShaderModule ::
               VkDevice -- ^ device
                        ->
                 VkShaderModule -- ^ shaderModule
                                -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                         -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreatePipelineCache
--   >     ( VkDevice device
--   >     , const VkPipelineCacheCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkPipelineCache* pPipelineCache
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreatePipelineCache.html vkCreatePipelineCache registry at www.khronos.org>
foreign import ccall unsafe "vkCreatePipelineCache"
               vkCreatePipelineCache ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkPipelineCacheCreateInfo -- ^ pCreateInfo
                                                           ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkPipelineCache -- ^ pPipelineCache
                                                     -> IO VkResult

-- | > void vkDestroyPipelineCache
--   >     ( VkDevice device
--   >     , VkPipelineCache pipelineCache
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyPipelineCache.html vkDestroyPipelineCache registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyPipelineCache"
               vkDestroyPipelineCache ::
               VkDevice -- ^ device
                        ->
                 VkPipelineCache -- ^ pipelineCache
                                 -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                          -> IO ()

-- | Success codes: 'VK_SUCCESS', 'VK_INCOMPLETE'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkGetPipelineCacheData
--   >     ( VkDevice device
--   >     , VkPipelineCache pipelineCache
--   >     , size_t* pDataSize
--   >     , void* pData
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetPipelineCacheData.html vkGetPipelineCacheData registry at www.khronos.org>
foreign import ccall unsafe "vkGetPipelineCacheData"
               vkGetPipelineCacheData ::
               VkDevice -- ^ device
                        ->
                 VkPipelineCache -- ^ pipelineCache
                                 ->
                   Foreign.Ptr.Ptr Foreign.C.Types.CSize -- ^ pDataSize
                                                         ->
                     Foreign.Ptr.Ptr Data.Void.Void -- ^ pData
                                                    -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkMergePipelineCaches
--   >     ( VkDevice device
--   >     , VkPipelineCache dstCache
--   >     , uint32_t srcCacheCount
--   >     , const VkPipelineCache* pSrcCaches
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkMergePipelineCaches.html vkMergePipelineCaches registry at www.khronos.org>
foreign import ccall unsafe "vkMergePipelineCaches"
               vkMergePipelineCaches ::
               VkDevice -- ^ device
                        ->
                 VkPipelineCache -- ^ dstCache
                                 ->
                   Data.Word.Word32 -- ^ srcCacheCount
                                    -> Foreign.Ptr.Ptr VkPipelineCache -- ^ pSrcCaches
                                                                       -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_INVALID_SHADER_NV'.
--
--   > VkResult vkCreateGraphicsPipelines
--   >     ( VkDevice device
--   >     , VkPipelineCache pipelineCache
--   >     , uint32_t createInfoCount
--   >     , const VkGraphicsPipelineCreateInfo* pCreateInfos
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkPipeline* pPipelines
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateGraphicsPipelines.html vkCreateGraphicsPipelines registry at www.khronos.org>
foreign import ccall unsafe "vkCreateGraphicsPipelines"
               vkCreateGraphicsPipelines ::
               VkDevice -- ^ device
                        ->
                 VkPipelineCache -- ^ pipelineCache
                                 ->
                   Data.Word.Word32 -- ^ createInfoCount
                                    ->
                     Foreign.Ptr.Ptr VkGraphicsPipelineCreateInfo -- ^ pCreateInfos
                                                                  ->
                       Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                             ->
                         Foreign.Ptr.Ptr VkPipeline -- ^ pPipelines
                                                    -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_INVALID_SHADER_NV'.
--
--   > VkResult vkCreateComputePipelines
--   >     ( VkDevice device
--   >     , VkPipelineCache pipelineCache
--   >     , uint32_t createInfoCount
--   >     , const VkComputePipelineCreateInfo* pCreateInfos
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkPipeline* pPipelines
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateComputePipelines.html vkCreateComputePipelines registry at www.khronos.org>
foreign import ccall unsafe "vkCreateComputePipelines"
               vkCreateComputePipelines ::
               VkDevice -- ^ device
                        ->
                 VkPipelineCache -- ^ pipelineCache
                                 ->
                   Data.Word.Word32 -- ^ createInfoCount
                                    ->
                     Foreign.Ptr.Ptr VkComputePipelineCreateInfo -- ^ pCreateInfos
                                                                 ->
                       Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                             ->
                         Foreign.Ptr.Ptr VkPipeline -- ^ pPipelines
                                                    -> IO VkResult

-- | > void vkDestroyPipeline
--   >     ( VkDevice device
--   >     , VkPipeline pipeline
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyPipeline.html vkDestroyPipeline registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyPipeline" vkDestroyPipeline
               ::
               VkDevice -- ^ device
                        ->
                 VkPipeline -- ^ pipeline
                            -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                     -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreatePipelineLayout
--   >     ( VkDevice device
--   >     , const VkPipelineLayoutCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkPipelineLayout* pPipelineLayout
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreatePipelineLayout.html vkCreatePipelineLayout registry at www.khronos.org>
foreign import ccall unsafe "vkCreatePipelineLayout"
               vkCreatePipelineLayout ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkPipelineLayoutCreateInfo -- ^ pCreateInfo
                                                            ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkPipelineLayout -- ^ pPipelineLayout
                                                      -> IO VkResult

-- | > void vkDestroyPipelineLayout
--   >     ( VkDevice device
--   >     , VkPipelineLayout pipelineLayout
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyPipelineLayout.html vkDestroyPipelineLayout registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyPipelineLayout"
               vkDestroyPipelineLayout ::
               VkDevice -- ^ device
                        ->
                 VkPipelineLayout -- ^ pipelineLayout
                                  -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                           -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_TOO_MANY_OBJECTS'.
--
--   > VkResult vkCreateSampler
--   >     ( VkDevice device
--   >     , const VkSamplerCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkSampler* pSampler
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateSampler.html vkCreateSampler registry at www.khronos.org>
foreign import ccall unsafe "vkCreateSampler" vkCreateSampler ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkSamplerCreateInfo -- ^ pCreateInfo
                                                     ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkSampler -- ^ pSampler
                                               -> IO VkResult

-- | > void vkDestroySampler
--   >     ( VkDevice device
--   >     , VkSampler sampler
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroySampler.html vkDestroySampler registry at www.khronos.org>
foreign import ccall unsafe "vkDestroySampler" vkDestroySampler ::
               VkDevice -- ^ device
                        ->
                 VkSampler -- ^ sampler
                           -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                    -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateDescriptorSetLayout
--   >     ( VkDevice device
--   >     , const VkDescriptorSetLayoutCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkDescriptorSetLayout* pSetLayout
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateDescriptorSetLayout.html vkCreateDescriptorSetLayout registry at www.khronos.org>
foreign import ccall unsafe "vkCreateDescriptorSetLayout"
               vkCreateDescriptorSetLayout ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkDescriptorSetLayoutCreateInfo -- ^ pCreateInfo
                                                                 ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkDescriptorSetLayout -- ^ pSetLayout
                                                           -> IO VkResult

-- | > void vkDestroyDescriptorSetLayout
--   >     ( VkDevice device
--   >     , VkDescriptorSetLayout descriptorSetLayout
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyDescriptorSetLayout.html vkDestroyDescriptorSetLayout registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyDescriptorSetLayout"
               vkDestroyDescriptorSetLayout ::
               VkDevice -- ^ device
                        ->
                 VkDescriptorSetLayout -- ^ descriptorSetLayout
                                       ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateDescriptorPool
--   >     ( VkDevice device
--   >     , const VkDescriptorPoolCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkDescriptorPool* pDescriptorPool
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateDescriptorPool.html vkCreateDescriptorPool registry at www.khronos.org>
foreign import ccall unsafe "vkCreateDescriptorPool"
               vkCreateDescriptorPool ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkDescriptorPoolCreateInfo -- ^ pCreateInfo
                                                            ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkDescriptorPool -- ^ pDescriptorPool
                                                      -> IO VkResult

-- | > void vkDestroyDescriptorPool
--   >     ( VkDevice device
--   >     , VkDescriptorPool descriptorPool
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyDescriptorPool.html vkDestroyDescriptorPool registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyDescriptorPool"
               vkDestroyDescriptorPool ::
               VkDevice -- ^ device
                        ->
                 VkDescriptorPool -- ^ descriptorPool
                                  -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                           -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkResetDescriptorPool
--   >     ( VkDevice device
--   >     , VkDescriptorPool descriptorPool
--   >     , VkDescriptorPoolResetFlags flags
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkResetDescriptorPool.html vkResetDescriptorPool registry at www.khronos.org>
foreign import ccall unsafe "vkResetDescriptorPool"
               vkResetDescriptorPool ::
               VkDevice -- ^ device
                        ->
                 VkDescriptorPool -- ^ descriptorPool
                                  -> VkDescriptorPoolResetFlags -- ^ flags
                                                                -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY', 'VK_ERROR_FRAGMENTED_POOL', 'VK_ERROR_OUT_OF_POOL_MEMORY_KHR'.
--
--   > VkResult vkAllocateDescriptorSets
--   >     ( VkDevice device
--   >     , const VkDescriptorSetAllocateInfo* pAllocateInfo
--   >     , VkDescriptorSet* pDescriptorSets
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkAllocateDescriptorSets.html vkAllocateDescriptorSets registry at www.khronos.org>
foreign import ccall unsafe "vkAllocateDescriptorSets"
               vkAllocateDescriptorSets ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkDescriptorSetAllocateInfo -- ^ pAllocateInfo
                                                             ->
                   Foreign.Ptr.Ptr VkDescriptorSet -- ^ pDescriptorSets
                                                   -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkFreeDescriptorSets
--   >     ( VkDevice device
--   >     , VkDescriptorPool descriptorPool
--   >     , uint32_t descriptorSetCount
--   >     , const VkDescriptorSet* pDescriptorSets
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkFreeDescriptorSets.html vkFreeDescriptorSets registry at www.khronos.org>
foreign import ccall unsafe "vkFreeDescriptorSets"
               vkFreeDescriptorSets ::
               VkDevice -- ^ device
                        ->
                 VkDescriptorPool -- ^ descriptorPool
                                  ->
                   Data.Word.Word32 -- ^ descriptorSetCount
                                    -> Foreign.Ptr.Ptr VkDescriptorSet -- ^ pDescriptorSets
                                                                       -> IO VkResult

-- | > void vkUpdateDescriptorSets
--   >     ( VkDevice device
--   >     , uint32_t descriptorWriteCount
--   >     , const VkWriteDescriptorSet* pDescriptorWrites
--   >     , uint32_t descriptorCopyCount
--   >     , const VkCopyDescriptorSet* pDescriptorCopies
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkUpdateDescriptorSets.html vkUpdateDescriptorSets registry at www.khronos.org>
foreign import ccall unsafe "vkUpdateDescriptorSets"
               vkUpdateDescriptorSets ::
               VkDevice -- ^ device
                        ->
                 Data.Word.Word32 -- ^ descriptorWriteCount
                                  ->
                   Foreign.Ptr.Ptr VkWriteDescriptorSet -- ^ pDescriptorWrites
                                                        ->
                     Data.Word.Word32 -- ^ descriptorCopyCount
                                      -> Foreign.Ptr.Ptr VkCopyDescriptorSet -- ^ pDescriptorCopies
                                                                             -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateFramebuffer
--   >     ( VkDevice device
--   >     , const VkFramebufferCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkFramebuffer* pFramebuffer
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateFramebuffer.html vkCreateFramebuffer registry at www.khronos.org>
foreign import ccall unsafe "vkCreateFramebuffer"
               vkCreateFramebuffer ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkFramebufferCreateInfo -- ^ pCreateInfo
                                                         ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkFramebuffer -- ^ pFramebuffer
                                                   -> IO VkResult

-- | > void vkDestroyFramebuffer
--   >     ( VkDevice device
--   >     , VkFramebuffer framebuffer
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyFramebuffer.html vkDestroyFramebuffer registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyFramebuffer"
               vkDestroyFramebuffer ::
               VkDevice -- ^ device
                        ->
                 VkFramebuffer -- ^ framebuffer
                               -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                        -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateRenderPass
--   >     ( VkDevice device
--   >     , const VkRenderPassCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkRenderPass* pRenderPass
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateRenderPass.html vkCreateRenderPass registry at www.khronos.org>
foreign import ccall unsafe "vkCreateRenderPass" vkCreateRenderPass
               ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkRenderPassCreateInfo -- ^ pCreateInfo
                                                        ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkRenderPass -- ^ pRenderPass
                                                  -> IO VkResult

-- | > void vkDestroyRenderPass
--   >     ( VkDevice device
--   >     , VkRenderPass renderPass
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyRenderPass.html vkDestroyRenderPass registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyRenderPass"
               vkDestroyRenderPass ::
               VkDevice -- ^ device
                        ->
                 VkRenderPass -- ^ renderPass
                              -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                       -> IO ()

-- | > void vkGetRenderAreaGranularity
--   >     ( VkDevice device
--   >     , VkRenderPass renderPass
--   >     , VkExtent2D* pGranularity
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetRenderAreaGranularity.html vkGetRenderAreaGranularity registry at www.khronos.org>
foreign import ccall unsafe "vkGetRenderAreaGranularity"
               vkGetRenderAreaGranularity ::
               VkDevice -- ^ device
                        -> VkRenderPass -- ^ renderPass
                                        -> Foreign.Ptr.Ptr VkExtent2D -- ^ pGranularity
                                                                      -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkCreateCommandPool
--   >     ( VkDevice device
--   >     , const VkCommandPoolCreateInfo* pCreateInfo
--   >     , const VkAllocationCallbacks* pAllocator
--   >     , VkCommandPool* pCommandPool
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCreateCommandPool.html vkCreateCommandPool registry at www.khronos.org>
foreign import ccall unsafe "vkCreateCommandPool"
               vkCreateCommandPool ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkCommandPoolCreateInfo -- ^ pCreateInfo
                                                         ->
                   Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                         ->
                     Foreign.Ptr.Ptr VkCommandPool -- ^ pCommandPool
                                                   -> IO VkResult

-- | > void vkDestroyCommandPool
--   >     ( VkDevice device
--   >     , VkCommandPool commandPool
--   >     , const VkAllocationCallbacks* pAllocator
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkDestroyCommandPool.html vkDestroyCommandPool registry at www.khronos.org>
foreign import ccall unsafe "vkDestroyCommandPool"
               vkDestroyCommandPool ::
               VkDevice -- ^ device
                        ->
                 VkCommandPool -- ^ commandPool
                               -> Foreign.Ptr.Ptr VkAllocationCallbacks -- ^ pAllocator
                                                                        -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkResetCommandPool
--   >     ( VkDevice device
--   >     , VkCommandPool commandPool
--   >     , VkCommandPoolResetFlags flags
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkResetCommandPool.html vkResetCommandPool registry at www.khronos.org>
foreign import ccall unsafe "vkResetCommandPool" vkResetCommandPool
               ::
               VkDevice -- ^ device
                        -> VkCommandPool -- ^ commandPool
                                         -> VkCommandPoolResetFlags -- ^ flags
                                                                    -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkAllocateCommandBuffers
--   >     ( VkDevice device
--   >     , const VkCommandBufferAllocateInfo* pAllocateInfo
--   >     , VkCommandBuffer* pCommandBuffers
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkAllocateCommandBuffers.html vkAllocateCommandBuffers registry at www.khronos.org>
foreign import ccall unsafe "vkAllocateCommandBuffers"
               vkAllocateCommandBuffers ::
               VkDevice -- ^ device
                        ->
                 Foreign.Ptr.Ptr VkCommandBufferAllocateInfo -- ^ pAllocateInfo
                                                             ->
                   Foreign.Ptr.Ptr VkCommandBuffer -- ^ pCommandBuffers
                                                   -> IO VkResult

-- | > void vkFreeCommandBuffers
--   >     ( VkDevice device
--   >     , VkCommandPool commandPool
--   >     , uint32_t commandBufferCount
--   >     , const VkCommandBuffer* pCommandBuffers
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkFreeCommandBuffers.html vkFreeCommandBuffers registry at www.khronos.org>
foreign import ccall unsafe "vkFreeCommandBuffers"
               vkFreeCommandBuffers ::
               VkDevice -- ^ device
                        ->
                 VkCommandPool -- ^ commandPool
                               ->
                   Data.Word.Word32 -- ^ commandBufferCount
                                    -> Foreign.Ptr.Ptr VkCommandBuffer -- ^ pCommandBuffers
                                                                       -> IO ()

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkBeginCommandBuffer
--   >     ( VkCommandBuffer commandBuffer
--   >     , const VkCommandBufferBeginInfo* pBeginInfo
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkBeginCommandBuffer.html vkBeginCommandBuffer registry at www.khronos.org>
foreign import ccall unsafe "vkBeginCommandBuffer"
               vkBeginCommandBuffer ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Foreign.Ptr.Ptr VkCommandBufferBeginInfo -- ^ pBeginInfo
                                                          -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkEndCommandBuffer
--   >     ( VkCommandBuffer commandBuffer
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkEndCommandBuffer.html vkEndCommandBuffer registry at www.khronos.org>
foreign import ccall unsafe "vkEndCommandBuffer" vkEndCommandBuffer
               :: VkCommandBuffer -- ^ commandBuffer
                                  -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_OUT_OF_DEVICE_MEMORY'.
--
--   > VkResult vkResetCommandBuffer
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkCommandBufferResetFlags flags
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkResetCommandBuffer.html vkResetCommandBuffer registry at www.khronos.org>
foreign import ccall unsafe "vkResetCommandBuffer"
               vkResetCommandBuffer ::
               VkCommandBuffer -- ^ commandBuffer
                               -> VkCommandBufferResetFlags -- ^ flags
                                                            -> IO VkResult

-- | queues: @graphics,compute@
--
--   renderpass: @both@
--
--   > void vkCmdBindPipeline
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkPipelineBindPoint pipelineBindPoint
--   >     , VkPipeline pipeline
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdBindPipeline.html vkCmdBindPipeline registry at www.khronos.org>
foreign import ccall unsafe "vkCmdBindPipeline" vkCmdBindPipeline
               :: VkCommandBuffer -- ^ commandBuffer
                                  -> VkPipelineBindPoint -- ^ pipelineBindPoint
                                                         -> VkPipeline -- ^ pipeline
                                                                       -> IO ()

-- | queues: @graphics@
--
--   renderpass: @both@
--
--   > void vkCmdSetViewport
--   >     ( VkCommandBuffer commandBuffer
--   >     , uint32_t firstViewport
--   >     , uint32_t viewportCount
--   >     , const VkViewport* pViewports
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdSetViewport.html vkCmdSetViewport registry at www.khronos.org>
foreign import ccall unsafe "vkCmdSetViewport" vkCmdSetViewport ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Data.Word.Word32 -- ^ firstViewport
                                  ->
                   Data.Word.Word32 -- ^ viewportCount
                                    -> Foreign.Ptr.Ptr VkViewport -- ^ pViewports
                                                                  -> IO ()

-- | queues: @graphics@
--
--   renderpass: @both@
--
--   > void vkCmdSetScissor
--   >     ( VkCommandBuffer commandBuffer
--   >     , uint32_t firstScissor
--   >     , uint32_t scissorCount
--   >     , const VkRect2D* pScissors
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdSetScissor.html vkCmdSetScissor registry at www.khronos.org>
foreign import ccall unsafe "vkCmdSetScissor" vkCmdSetScissor ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Data.Word.Word32 -- ^ firstScissor
                                  ->
                   Data.Word.Word32 -- ^ scissorCount
                                    -> Foreign.Ptr.Ptr VkRect2D -- ^ pScissors
                                                                -> IO ()

-- | queues: @graphics@
--
--   renderpass: @both@
--
--   > void vkCmdSetLineWidth
--   >     ( VkCommandBuffer commandBuffer
--   >     , float lineWidth
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdSetLineWidth.html vkCmdSetLineWidth registry at www.khronos.org>
foreign import ccall unsafe "vkCmdSetLineWidth" vkCmdSetLineWidth
               :: VkCommandBuffer -- ^ commandBuffer
                                  -> Foreign.C.Types.CFloat -- ^ lineWidth
                                                            -> IO ()

-- | queues: @graphics@
--
--   renderpass: @both@
--
--   > void vkCmdSetDepthBias
--   >     ( VkCommandBuffer commandBuffer
--   >     , float depthBiasConstantFactor
--   >     , float depthBiasClamp
--   >     , float depthBiasSlopeFactor
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdSetDepthBias.html vkCmdSetDepthBias registry at www.khronos.org>
foreign import ccall unsafe "vkCmdSetDepthBias" vkCmdSetDepthBias
               ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Foreign.C.Types.CFloat -- ^ depthBiasConstantFactor
                                        ->
                   Foreign.C.Types.CFloat -- ^ depthBiasClamp
                                          -> Foreign.C.Types.CFloat -- ^ depthBiasSlopeFactor
                                                                    -> IO ()

-- | queues: @graphics@
--
--   renderpass: @both@
--
--   > void vkCmdSetBlendConstants
--   >     ( VkCommandBuffer commandBuffer
--   >     , const float blendConstants[4]
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdSetBlendConstants.html vkCmdSetBlendConstants registry at www.khronos.org>
foreign import ccall unsafe "vkCmdSetBlendConstants"
               vkCmdSetBlendConstants ::
               VkCommandBuffer -- ^ commandBuffer
                               -> Foreign.Ptr.Ptr Foreign.C.Types.CFloat -- ^ blendConstants
                                                                         -> IO ()

-- | queues: @graphics@
--
--   renderpass: @both@
--
--   > void vkCmdSetDepthBounds
--   >     ( VkCommandBuffer commandBuffer
--   >     , float minDepthBounds
--   >     , float maxDepthBounds
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdSetDepthBounds.html vkCmdSetDepthBounds registry at www.khronos.org>
foreign import ccall unsafe "vkCmdSetDepthBounds"
               vkCmdSetDepthBounds ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Foreign.C.Types.CFloat -- ^ minDepthBounds
                                        -> Foreign.C.Types.CFloat -- ^ maxDepthBounds
                                                                  -> IO ()

-- | queues: @graphics@
--
--   renderpass: @both@
--
--   > void vkCmdSetStencilCompareMask
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkStencilFaceFlags faceMask
--   >     , uint32_t compareMask
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdSetStencilCompareMask.html vkCmdSetStencilCompareMask registry at www.khronos.org>
foreign import ccall unsafe "vkCmdSetStencilCompareMask"
               vkCmdSetStencilCompareMask ::
               VkCommandBuffer -- ^ commandBuffer
                               -> VkStencilFaceFlags -- ^ faceMask
                                                     -> Data.Word.Word32 -- ^ compareMask
                                                                         -> IO ()

-- | queues: @graphics@
--
--   renderpass: @both@
--
--   > void vkCmdSetStencilWriteMask
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkStencilFaceFlags faceMask
--   >     , uint32_t writeMask
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdSetStencilWriteMask.html vkCmdSetStencilWriteMask registry at www.khronos.org>
foreign import ccall unsafe "vkCmdSetStencilWriteMask"
               vkCmdSetStencilWriteMask ::
               VkCommandBuffer -- ^ commandBuffer
                               -> VkStencilFaceFlags -- ^ faceMask
                                                     -> Data.Word.Word32 -- ^ writeMask
                                                                         -> IO ()

-- | queues: @graphics@
--
--   renderpass: @both@
--
--   > void vkCmdSetStencilReference
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkStencilFaceFlags faceMask
--   >     , uint32_t reference
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdSetStencilReference.html vkCmdSetStencilReference registry at www.khronos.org>
foreign import ccall unsafe "vkCmdSetStencilReference"
               vkCmdSetStencilReference ::
               VkCommandBuffer -- ^ commandBuffer
                               -> VkStencilFaceFlags -- ^ faceMask
                                                     -> Data.Word.Word32 -- ^ reference
                                                                         -> IO ()

-- | queues: @graphics,compute@
--
--   renderpass: @both@
--
--   > void vkCmdBindDescriptorSets
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkPipelineBindPoint pipelineBindPoint
--   >     , VkPipelineLayout layout
--   >     , uint32_t firstSet
--   >     , uint32_t descriptorSetCount
--   >     , const VkDescriptorSet* pDescriptorSets
--   >     , uint32_t dynamicOffsetCount
--   >     , const uint32_t* pDynamicOffsets
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdBindDescriptorSets.html vkCmdBindDescriptorSets registry at www.khronos.org>
foreign import ccall unsafe "vkCmdBindDescriptorSets"
               vkCmdBindDescriptorSets ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkPipelineBindPoint -- ^ pipelineBindPoint
                                     ->
                   VkPipelineLayout -- ^ layout
                                    ->
                     Data.Word.Word32 -- ^ firstSet
                                      ->
                       Data.Word.Word32 -- ^ descriptorSetCount
                                        ->
                         Foreign.Ptr.Ptr VkDescriptorSet -- ^ pDescriptorSets
                                                         ->
                           Data.Word.Word32 -- ^ dynamicOffsetCount
                                            -> Foreign.Ptr.Ptr Data.Word.Word32 -- ^ pDynamicOffsets
                                                                                -> IO ()

-- | queues: @graphics@
--
--   renderpass: @both@
--
--   > void vkCmdBindIndexBuffer
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkBuffer buffer
--   >     , VkDeviceSize offset
--   >     , VkIndexType indexType
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdBindIndexBuffer.html vkCmdBindIndexBuffer registry at www.khronos.org>
foreign import ccall unsafe "vkCmdBindIndexBuffer"
               vkCmdBindIndexBuffer ::
               VkCommandBuffer -- ^ commandBuffer
                               -> VkBuffer -- ^ buffer
                                           -> VkDeviceSize -- ^ offset
                                                           -> VkIndexType -- ^ indexType
                                                                          -> IO ()

-- | queues: @graphics@
--
--   renderpass: @both@
--
--   > void vkCmdBindVertexBuffers
--   >     ( VkCommandBuffer commandBuffer
--   >     , uint32_t firstBinding
--   >     , uint32_t bindingCount
--   >     , const VkBuffer* pBuffers
--   >     , const VkDeviceSize* pOffsets
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdBindVertexBuffers.html vkCmdBindVertexBuffers registry at www.khronos.org>
foreign import ccall unsafe "vkCmdBindVertexBuffers"
               vkCmdBindVertexBuffers ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Data.Word.Word32 -- ^ firstBinding
                                  ->
                   Data.Word.Word32 -- ^ bindingCount
                                    ->
                     Foreign.Ptr.Ptr VkBuffer -- ^ pBuffers
                                              -> Foreign.Ptr.Ptr VkDeviceSize -- ^ pOffsets
                                                                              -> IO ()

-- | queues: @graphics@
--
--   renderpass: @inside@
--
--   pipeline: @graphics@
--
--   > void vkCmdDraw
--   >     ( VkCommandBuffer commandBuffer
--   >     , uint32_t vertexCount
--   >     , uint32_t instanceCount
--   >     , uint32_t firstVertex
--   >     , uint32_t firstInstance
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdDraw.html vkCmdDraw registry at www.khronos.org>
foreign import ccall unsafe "vkCmdDraw" vkCmdDraw ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Data.Word.Word32 -- ^ vertexCount
                                  ->
                   Data.Word.Word32 -- ^ instanceCount
                                    -> Data.Word.Word32 -- ^ firstVertex
                                                        -> Data.Word.Word32 -- ^ firstInstance
                                                                            -> IO ()

-- | queues: @graphics@
--
--   renderpass: @inside@
--
--   pipeline: @graphics@
--
--   > void vkCmdDrawIndexed
--   >     ( VkCommandBuffer commandBuffer
--   >     , uint32_t indexCount
--   >     , uint32_t instanceCount
--   >     , uint32_t firstIndex
--   >     , int32_t vertexOffset
--   >     , uint32_t firstInstance
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdDrawIndexed.html vkCmdDrawIndexed registry at www.khronos.org>
foreign import ccall unsafe "vkCmdDrawIndexed" vkCmdDrawIndexed ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Data.Word.Word32 -- ^ indexCount
                                  ->
                   Data.Word.Word32 -- ^ instanceCount
                                    ->
                     Data.Word.Word32 -- ^ firstIndex
                                      -> Data.Int.Int32 -- ^ vertexOffset
                                                        -> Data.Word.Word32 -- ^ firstInstance
                                                                            -> IO ()

-- | queues: @graphics@
--
--   renderpass: @inside@
--
--   pipeline: @graphics@
--
--   > void vkCmdDrawIndirect
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkBuffer buffer
--   >     , VkDeviceSize offset
--   >     , uint32_t drawCount
--   >     , uint32_t stride
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdDrawIndirect.html vkCmdDrawIndirect registry at www.khronos.org>
foreign import ccall unsafe "vkCmdDrawIndirect" vkCmdDrawIndirect
               ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkBuffer -- ^ buffer
                          ->
                   VkDeviceSize -- ^ offset
                                -> Data.Word.Word32 -- ^ drawCount
                                                    -> Data.Word.Word32 -- ^ stride
                                                                        -> IO ()

-- | queues: @graphics@
--
--   renderpass: @inside@
--
--   pipeline: @graphics@
--
--   > void vkCmdDrawIndexedIndirect
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkBuffer buffer
--   >     , VkDeviceSize offset
--   >     , uint32_t drawCount
--   >     , uint32_t stride
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdDrawIndexedIndirect.html vkCmdDrawIndexedIndirect registry at www.khronos.org>
foreign import ccall unsafe "vkCmdDrawIndexedIndirect"
               vkCmdDrawIndexedIndirect ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkBuffer -- ^ buffer
                          ->
                   VkDeviceSize -- ^ offset
                                -> Data.Word.Word32 -- ^ drawCount
                                                    -> Data.Word.Word32 -- ^ stride
                                                                        -> IO ()

-- | queues: @compute@
--
--   renderpass: @outside@
--
--   pipeline: @compute@
--
--   > void vkCmdDispatch
--   >     ( VkCommandBuffer commandBuffer
--   >     , uint32_t groupCountX
--   >     , uint32_t groupCountY
--   >     , uint32_t groupCountZ
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdDispatch.html vkCmdDispatch registry at www.khronos.org>
foreign import ccall unsafe "vkCmdDispatch" vkCmdDispatch ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Data.Word.Word32 -- ^ groupCountX
                                  -> Data.Word.Word32 -- ^ groupCountY
                                                      -> Data.Word.Word32 -- ^ groupCountZ
                                                                          -> IO ()

-- | queues: @compute@
--
--   renderpass: @outside@
--
--   pipeline: @compute@
--
--   > void vkCmdDispatchIndirect
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkBuffer buffer
--   >     , VkDeviceSize offset
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdDispatchIndirect.html vkCmdDispatchIndirect registry at www.khronos.org>
foreign import ccall unsafe "vkCmdDispatchIndirect"
               vkCmdDispatchIndirect ::
               VkCommandBuffer -- ^ commandBuffer
                               -> VkBuffer -- ^ buffer
                                           -> VkDeviceSize -- ^ offset
                                                           -> IO ()

-- | queues: @transfer,graphics,compute@
--
--   renderpass: @outside@
--
--   pipeline: @transfer@
--
--   > void vkCmdCopyBuffer
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkBuffer srcBuffer
--   >     , VkBuffer dstBuffer
--   >     , uint32_t regionCount
--   >     , const VkBufferCopy* pRegions
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdCopyBuffer.html vkCmdCopyBuffer registry at www.khronos.org>
foreign import ccall unsafe "vkCmdCopyBuffer" vkCmdCopyBuffer ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkBuffer -- ^ srcBuffer
                          ->
                   VkBuffer -- ^ dstBuffer
                            ->
                     Data.Word.Word32 -- ^ regionCount
                                      -> Foreign.Ptr.Ptr VkBufferCopy -- ^ pRegions
                                                                      -> IO ()

-- | queues: @transfer,graphics,compute@
--
--   renderpass: @outside@
--
--   pipeline: @transfer@
--
--   > void vkCmdCopyImage
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkImage srcImage
--   >     , VkImageLayout srcImageLayout
--   >     , VkImage dstImage
--   >     , VkImageLayout dstImageLayout
--   >     , uint32_t regionCount
--   >     , const VkImageCopy* pRegions
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdCopyImage.html vkCmdCopyImage registry at www.khronos.org>
foreign import ccall unsafe "vkCmdCopyImage" vkCmdCopyImage ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkImage -- ^ srcImage
                         ->
                   VkImageLayout -- ^ srcImageLayout
                                 ->
                     VkImage -- ^ dstImage
                             ->
                       VkImageLayout -- ^ dstImageLayout
                                     ->
                         Data.Word.Word32 -- ^ regionCount
                                          -> Foreign.Ptr.Ptr VkImageCopy -- ^ pRegions
                                                                         -> IO ()

-- | queues: @graphics@
--
--   renderpass: @outside@
--
--   pipeline: @transfer@
--
--   > void vkCmdBlitImage
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkImage srcImage
--   >     , VkImageLayout srcImageLayout
--   >     , VkImage dstImage
--   >     , VkImageLayout dstImageLayout
--   >     , uint32_t regionCount
--   >     , const VkImageBlit* pRegions
--   >     , VkFilter filter
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdBlitImage.html vkCmdBlitImage registry at www.khronos.org>
foreign import ccall unsafe "vkCmdBlitImage" vkCmdBlitImage ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkImage -- ^ srcImage
                         ->
                   VkImageLayout -- ^ srcImageLayout
                                 ->
                     VkImage -- ^ dstImage
                             ->
                       VkImageLayout -- ^ dstImageLayout
                                     ->
                         Data.Word.Word32 -- ^ regionCount
                                          ->
                           Foreign.Ptr.Ptr VkImageBlit -- ^ pRegions
                                                       -> VkFilter -- ^ filter
                                                                   -> IO ()

-- | queues: @transfer,graphics,compute@
--
--   renderpass: @outside@
--
--   pipeline: @transfer@
--
--   > void vkCmdCopyBufferToImage
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkBuffer srcBuffer
--   >     , VkImage dstImage
--   >     , VkImageLayout dstImageLayout
--   >     , uint32_t regionCount
--   >     , const VkBufferImageCopy* pRegions
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdCopyBufferToImage.html vkCmdCopyBufferToImage registry at www.khronos.org>
foreign import ccall unsafe "vkCmdCopyBufferToImage"
               vkCmdCopyBufferToImage ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkBuffer -- ^ srcBuffer
                          ->
                   VkImage -- ^ dstImage
                           ->
                     VkImageLayout -- ^ dstImageLayout
                                   ->
                       Data.Word.Word32 -- ^ regionCount
                                        -> Foreign.Ptr.Ptr VkBufferImageCopy -- ^ pRegions
                                                                             -> IO ()

-- | queues: @transfer,graphics,compute@
--
--   renderpass: @outside@
--
--   pipeline: @transfer@
--
--   > void vkCmdCopyImageToBuffer
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkImage srcImage
--   >     , VkImageLayout srcImageLayout
--   >     , VkBuffer dstBuffer
--   >     , uint32_t regionCount
--   >     , const VkBufferImageCopy* pRegions
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdCopyImageToBuffer.html vkCmdCopyImageToBuffer registry at www.khronos.org>
foreign import ccall unsafe "vkCmdCopyImageToBuffer"
               vkCmdCopyImageToBuffer ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkImage -- ^ srcImage
                         ->
                   VkImageLayout -- ^ srcImageLayout
                                 ->
                     VkBuffer -- ^ dstBuffer
                              ->
                       Data.Word.Word32 -- ^ regionCount
                                        -> Foreign.Ptr.Ptr VkBufferImageCopy -- ^ pRegions
                                                                             -> IO ()

-- | queues: @transfer,graphics,compute@
--
--   renderpass: @outside@
--
--   pipeline: @transfer@
--
--   > void vkCmdUpdateBuffer
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkBuffer dstBuffer
--   >     , VkDeviceSize dstOffset
--   >     , VkDeviceSize dataSize
--   >     , const void* pData
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdUpdateBuffer.html vkCmdUpdateBuffer registry at www.khronos.org>
foreign import ccall unsafe "vkCmdUpdateBuffer" vkCmdUpdateBuffer
               ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkBuffer -- ^ dstBuffer
                          ->
                   VkDeviceSize -- ^ dstOffset
                                ->
                     VkDeviceSize -- ^ dataSize
                                  -> Foreign.Ptr.Ptr Data.Void.Void -- ^ pData
                                                                    -> IO ()

-- | transfer support is only available when VK_KHR_maintenance1 is enabled, as documented in valid usage language in the specification
--
--   queues: @transfer,graphics,compute@
--
--   renderpass: @outside@
--
--   pipeline: @transfer@
--
--   > void vkCmdFillBuffer
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkBuffer dstBuffer
--   >     , VkDeviceSize dstOffset
--   >     , VkDeviceSize size
--   >     , uint32_t data
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdFillBuffer.html vkCmdFillBuffer registry at www.khronos.org>
foreign import ccall unsafe "vkCmdFillBuffer" vkCmdFillBuffer ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkBuffer -- ^ dstBuffer
                          ->
                   VkDeviceSize -- ^ dstOffset
                                -> VkDeviceSize -- ^ size
                                                -> Data.Word.Word32 -- ^ data
                                                                    -> IO ()

-- | queues: @graphics,compute@
--
--   renderpass: @outside@
--
--   pipeline: @transfer@
--
--   > void vkCmdClearColorImage
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkImage image
--   >     , VkImageLayout imageLayout
--   >     , const VkClearColorValue* pColor
--   >     , uint32_t rangeCount
--   >     , const VkImageSubresourceRange* pRanges
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdClearColorImage.html vkCmdClearColorImage registry at www.khronos.org>
foreign import ccall unsafe "vkCmdClearColorImage"
               vkCmdClearColorImage ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkImage -- ^ image
                         ->
                   VkImageLayout -- ^ imageLayout
                                 ->
                     Foreign.Ptr.Ptr VkClearColorValue -- ^ pColor
                                                       ->
                       Data.Word.Word32 -- ^ rangeCount
                                        ->
                         Foreign.Ptr.Ptr VkImageSubresourceRange -- ^ pRanges
                                                                 -> IO ()

-- | queues: @graphics@
--
--   renderpass: @outside@
--
--   pipeline: @transfer@
--
--   > void vkCmdClearDepthStencilImage
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkImage image
--   >     , VkImageLayout imageLayout
--   >     , const VkClearDepthStencilValue* pDepthStencil
--   >     , uint32_t rangeCount
--   >     , const VkImageSubresourceRange* pRanges
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdClearDepthStencilImage.html vkCmdClearDepthStencilImage registry at www.khronos.org>
foreign import ccall unsafe "vkCmdClearDepthStencilImage"
               vkCmdClearDepthStencilImage ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkImage -- ^ image
                         ->
                   VkImageLayout -- ^ imageLayout
                                 ->
                     Foreign.Ptr.Ptr VkClearDepthStencilValue -- ^ pDepthStencil
                                                              ->
                       Data.Word.Word32 -- ^ rangeCount
                                        ->
                         Foreign.Ptr.Ptr VkImageSubresourceRange -- ^ pRanges
                                                                 -> IO ()

-- | queues: @graphics@
--
--   renderpass: @inside@
--
--   pipeline: @graphics@
--
--   > void vkCmdClearAttachments
--   >     ( VkCommandBuffer commandBuffer
--   >     , uint32_t attachmentCount
--   >     , const VkClearAttachment* pAttachments
--   >     , uint32_t rectCount
--   >     , const VkClearRect* pRects
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdClearAttachments.html vkCmdClearAttachments registry at www.khronos.org>
foreign import ccall unsafe "vkCmdClearAttachments"
               vkCmdClearAttachments ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Data.Word.Word32 -- ^ attachmentCount
                                  ->
                   Foreign.Ptr.Ptr VkClearAttachment -- ^ pAttachments
                                                     ->
                     Data.Word.Word32 -- ^ rectCount
                                      -> Foreign.Ptr.Ptr VkClearRect -- ^ pRects
                                                                     -> IO ()

-- | queues: @graphics@
--
--   renderpass: @outside@
--
--   pipeline: @transfer@
--
--   > void vkCmdResolveImage
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkImage srcImage
--   >     , VkImageLayout srcImageLayout
--   >     , VkImage dstImage
--   >     , VkImageLayout dstImageLayout
--   >     , uint32_t regionCount
--   >     , const VkImageResolve* pRegions
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdResolveImage.html vkCmdResolveImage registry at www.khronos.org>
foreign import ccall unsafe "vkCmdResolveImage" vkCmdResolveImage
               ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkImage -- ^ srcImage
                         ->
                   VkImageLayout -- ^ srcImageLayout
                                 ->
                     VkImage -- ^ dstImage
                             ->
                       VkImageLayout -- ^ dstImageLayout
                                     ->
                         Data.Word.Word32 -- ^ regionCount
                                          -> Foreign.Ptr.Ptr VkImageResolve -- ^ pRegions
                                                                            -> IO ()

-- | queues: @graphics,compute@
--
--   renderpass: @outside@
--
--   > void vkCmdSetEvent
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkEvent event
--   >     , VkPipelineStageFlags stageMask
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdSetEvent.html vkCmdSetEvent registry at www.khronos.org>
foreign import ccall unsafe "vkCmdSetEvent" vkCmdSetEvent ::
               VkCommandBuffer -- ^ commandBuffer
                               -> VkEvent -- ^ event
                                          -> VkPipelineStageFlags -- ^ stageMask
                                                                  -> IO ()

-- | queues: @graphics,compute@
--
--   renderpass: @outside@
--
--   > void vkCmdResetEvent
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkEvent event
--   >     , VkPipelineStageFlags stageMask
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdResetEvent.html vkCmdResetEvent registry at www.khronos.org>
foreign import ccall unsafe "vkCmdResetEvent" vkCmdResetEvent ::
               VkCommandBuffer -- ^ commandBuffer
                               -> VkEvent -- ^ event
                                          -> VkPipelineStageFlags -- ^ stageMask
                                                                  -> IO ()

-- | queues: @graphics,compute@
--
--   renderpass: @both@
--
--   > void vkCmdWaitEvents
--   >     ( VkCommandBuffer commandBuffer
--   >     , uint32_t eventCount
--   >     , const VkEvent* pEvents
--   >     , VkPipelineStageFlags srcStageMask
--   >     , VkPipelineStageFlags dstStageMask
--   >     , uint32_t memoryBarrierCount
--   >     , const VkMemoryBarrier* pMemoryBarriers
--   >     , uint32_t bufferMemoryBarrierCount
--   >     , const VkBufferMemoryBarrier* pBufferMemoryBarriers
--   >     , uint32_t imageMemoryBarrierCount
--   >     , const VkImageMemoryBarrier* pImageMemoryBarriers
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdWaitEvents.html vkCmdWaitEvents registry at www.khronos.org>
foreign import ccall unsafe "vkCmdWaitEvents" vkCmdWaitEvents ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Data.Word.Word32 -- ^ eventCount
                                  ->
                   Foreign.Ptr.Ptr VkEvent -- ^ pEvents
                                           ->
                     VkPipelineStageFlags -- ^ srcStageMask
                                          ->
                       VkPipelineStageFlags -- ^ dstStageMask
                                            ->
                         Data.Word.Word32 -- ^ memoryBarrierCount
                                          ->
                           Foreign.Ptr.Ptr VkMemoryBarrier -- ^ pMemoryBarriers
                                                           ->
                             Data.Word.Word32 -- ^ bufferMemoryBarrierCount
                                              ->
                               Foreign.Ptr.Ptr VkBufferMemoryBarrier -- ^ pBufferMemoryBarriers
                                                                     ->
                                 Data.Word.Word32 -- ^ imageMemoryBarrierCount
                                                  -> Foreign.Ptr.Ptr VkImageMemoryBarrier -- ^ pImageMemoryBarriers
                                                                                          -> IO ()

-- | queues: @transfer,graphics,compute@
--
--   renderpass: @both@
--
--   > void vkCmdPipelineBarrier
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkPipelineStageFlags srcStageMask
--   >     , VkPipelineStageFlags dstStageMask
--   >     , VkDependencyFlags dependencyFlags
--   >     , uint32_t memoryBarrierCount
--   >     , const VkMemoryBarrier* pMemoryBarriers
--   >     , uint32_t bufferMemoryBarrierCount
--   >     , const VkBufferMemoryBarrier* pBufferMemoryBarriers
--   >     , uint32_t imageMemoryBarrierCount
--   >     , const VkImageMemoryBarrier* pImageMemoryBarriers
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdPipelineBarrier.html vkCmdPipelineBarrier registry at www.khronos.org>
foreign import ccall unsafe "vkCmdPipelineBarrier"
               vkCmdPipelineBarrier ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkPipelineStageFlags -- ^ srcStageMask
                                      ->
                   VkPipelineStageFlags -- ^ dstStageMask
                                        ->
                     VkDependencyFlags -- ^ dependencyFlags
                                       ->
                       Data.Word.Word32 -- ^ memoryBarrierCount
                                        ->
                         Foreign.Ptr.Ptr VkMemoryBarrier -- ^ pMemoryBarriers
                                                         ->
                           Data.Word.Word32 -- ^ bufferMemoryBarrierCount
                                            ->
                             Foreign.Ptr.Ptr VkBufferMemoryBarrier -- ^ pBufferMemoryBarriers
                                                                   ->
                               Data.Word.Word32 -- ^ imageMemoryBarrierCount
                                                -> Foreign.Ptr.Ptr VkImageMemoryBarrier -- ^ pImageMemoryBarriers
                                                                                        -> IO ()

-- | queues: @graphics,compute@
--
--   renderpass: @both@
--
--   > void vkCmdBeginQuery
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkQueryPool queryPool
--   >     , uint32_t query
--   >     , VkQueryControlFlags flags
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdBeginQuery.html vkCmdBeginQuery registry at www.khronos.org>
foreign import ccall unsafe "vkCmdBeginQuery" vkCmdBeginQuery ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkQueryPool -- ^ queryPool
                             -> Data.Word.Word32 -- ^ query
                                                 -> VkQueryControlFlags -- ^ flags
                                                                        -> IO ()

-- | queues: @graphics,compute@
--
--   renderpass: @both@
--
--   > void vkCmdEndQuery
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkQueryPool queryPool
--   >     , uint32_t query
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdEndQuery.html vkCmdEndQuery registry at www.khronos.org>
foreign import ccall unsafe "vkCmdEndQuery" vkCmdEndQuery ::
               VkCommandBuffer -- ^ commandBuffer
                               -> VkQueryPool -- ^ queryPool
                                              -> Data.Word.Word32 -- ^ query
                                                                  -> IO ()

-- | queues: @graphics,compute@
--
--   renderpass: @outside@
--
--   > void vkCmdResetQueryPool
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkQueryPool queryPool
--   >     , uint32_t firstQuery
--   >     , uint32_t queryCount
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdResetQueryPool.html vkCmdResetQueryPool registry at www.khronos.org>
foreign import ccall unsafe "vkCmdResetQueryPool"
               vkCmdResetQueryPool ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkQueryPool -- ^ queryPool
                             -> Data.Word.Word32 -- ^ firstQuery
                                                 -> Data.Word.Word32 -- ^ queryCount
                                                                     -> IO ()

-- | queues: @transfer,graphics,compute@
--
--   renderpass: @both@
--
--   pipeline: @transfer@
--
--   > void vkCmdWriteTimestamp
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkPipelineStageFlagBits pipelineStage
--   >     , VkQueryPool queryPool
--   >     , uint32_t query
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdWriteTimestamp.html vkCmdWriteTimestamp registry at www.khronos.org>
foreign import ccall unsafe "vkCmdWriteTimestamp"
               vkCmdWriteTimestamp ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkPipelineStageFlagBits -- ^ pipelineStage
                                         -> VkQueryPool -- ^ queryPool
                                                        -> Data.Word.Word32 -- ^ query
                                                                            -> IO ()

-- | queues: @graphics,compute@
--
--   renderpass: @outside@
--
--   pipeline: @transfer@
--
--   > void vkCmdCopyQueryPoolResults
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkQueryPool queryPool
--   >     , uint32_t firstQuery
--   >     , uint32_t queryCount
--   >     , VkBuffer dstBuffer
--   >     , VkDeviceSize dstOffset
--   >     , VkDeviceSize stride
--   >     , VkQueryResultFlags flags
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdCopyQueryPoolResults.html vkCmdCopyQueryPoolResults registry at www.khronos.org>
foreign import ccall unsafe "vkCmdCopyQueryPoolResults"
               vkCmdCopyQueryPoolResults ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkQueryPool -- ^ queryPool
                             ->
                   Data.Word.Word32 -- ^ firstQuery
                                    ->
                     Data.Word.Word32 -- ^ queryCount
                                      ->
                       VkBuffer -- ^ dstBuffer
                                ->
                         VkDeviceSize -- ^ dstOffset
                                      -> VkDeviceSize -- ^ stride
                                                      -> VkQueryResultFlags -- ^ flags
                                                                            -> IO ()

-- | queues: @graphics,compute@
--
--   renderpass: @both@
--
--   > void vkCmdPushConstants
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkPipelineLayout layout
--   >     , VkShaderStageFlags stageFlags
--   >     , uint32_t offset
--   >     , uint32_t size
--   >     , const void* pValues
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdPushConstants.html vkCmdPushConstants registry at www.khronos.org>
foreign import ccall unsafe "vkCmdPushConstants" vkCmdPushConstants
               ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 VkPipelineLayout -- ^ layout
                                  ->
                   VkShaderStageFlags -- ^ stageFlags
                                      ->
                     Data.Word.Word32 -- ^ offset
                                      ->
                       Data.Word.Word32 -- ^ size
                                        -> Foreign.Ptr.Ptr Data.Void.Void -- ^ pValues
                                                                          -> IO ()

-- | queues: @graphics@
--
--   renderpass: @outside@
--
--   pipeline: @graphics@
--
--   > void vkCmdBeginRenderPass
--   >     ( VkCommandBuffer commandBuffer
--   >     , const VkRenderPassBeginInfo* pRenderPassBegin
--   >     , VkSubpassContents contents
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdBeginRenderPass.html vkCmdBeginRenderPass registry at www.khronos.org>
foreign import ccall unsafe "vkCmdBeginRenderPass"
               vkCmdBeginRenderPass ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Foreign.Ptr.Ptr VkRenderPassBeginInfo -- ^ pRenderPassBegin
                                                       -> VkSubpassContents -- ^ contents
                                                                            -> IO ()

-- | queues: @graphics@
--
--   renderpass: @inside@
--
--   pipeline: @graphics@
--
--   > void vkCmdNextSubpass
--   >     ( VkCommandBuffer commandBuffer
--   >     , VkSubpassContents contents
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdNextSubpass.html vkCmdNextSubpass registry at www.khronos.org>
foreign import ccall unsafe "vkCmdNextSubpass" vkCmdNextSubpass ::
               VkCommandBuffer -- ^ commandBuffer
                               -> VkSubpassContents -- ^ contents
                                                    -> IO ()

-- | queues: @graphics@
--
--   renderpass: @inside@
--
--   pipeline: @graphics@
--
--   > void vkCmdEndRenderPass
--   >     ( VkCommandBuffer commandBuffer
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdEndRenderPass.html vkCmdEndRenderPass registry at www.khronos.org>
foreign import ccall unsafe "vkCmdEndRenderPass" vkCmdEndRenderPass
               :: VkCommandBuffer -- ^ commandBuffer
                                  -> IO ()

-- | queues: @transfer,graphics,compute@
--
--   renderpass: @both@
--
--   > void vkCmdExecuteCommands
--   >     ( VkCommandBuffer commandBuffer
--   >     , uint32_t commandBufferCount
--   >     , const VkCommandBuffer* pCommandBuffers
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkCmdExecuteCommands.html vkCmdExecuteCommands registry at www.khronos.org>
foreign import ccall unsafe "vkCmdExecuteCommands"
               vkCmdExecuteCommands ::
               VkCommandBuffer -- ^ commandBuffer
                               ->
                 Data.Word.Word32 -- ^ commandBufferCount
                                  -> Foreign.Ptr.Ptr VkCommandBuffer -- ^ pCommandBuffers
                                                                     -> IO ()

data VkBufferMemoryBarrier = VkBufferMemoryBarrier## ByteArray##

instance Eq VkBufferMemoryBarrier where
        (VkBufferMemoryBarrier## a) == (VkBufferMemoryBarrier## b)
          = EQ == cmpImmutableContent a b

        {-# INLINE (==) #-}

instance Ord VkBufferMemoryBarrier where
        (VkBufferMemoryBarrier## a) `compare` (VkBufferMemoryBarrier## b)
          = cmpImmutableContent a b

        {-# INLINE compare #-}

instance Storable VkBufferMemoryBarrier where
        sizeOf ~_ = #{size VkBufferMemoryBarrier}

        {-# INLINE sizeOf #-}
        alignment ~_ = #{alignment VkBufferMemoryBarrier}

        {-# INLINE alignment #-}
        peek (Ptr addr)
          | I## n <- sizeOf (undefined :: VkBufferMemoryBarrier),
            I## a <- alignment (undefined :: VkBufferMemoryBarrier) =
            IO
              (\ s ->
                 case newAlignedPinnedByteArray## n a s of
                     (## s1, mba ##) -> case copyAddrToByteArray## addr mba 0## n s1 of
                                          s2 -> case unsafeFreezeByteArray## mba s2 of
                                                    (## s3, ba ##) -> (## s3,
                                                                       VkBufferMemoryBarrier## ba ##))

        {-# INLINE peek #-}
        poke (Ptr addr) (VkBufferMemoryBarrier## ba)
          | I## n <- sizeOf (undefined :: VkBufferMemoryBarrier) =
            IO (\ s -> (## copyByteArrayToAddr## ba 0## addr n s, () ##))

        {-# INLINE poke #-}

instance VulkanMarshal VkBufferMemoryBarrier where
        {-# INLINE newVkData #-}
        newVkData f
          | I## n <- sizeOf (undefined :: VkBufferMemoryBarrier),
            I## a <- alignment (undefined :: VkBufferMemoryBarrier) =
            IO
              (\ s0 ->
                 case newAlignedPinnedByteArray## n a s0 of
                     (## s1, mba ##) -> case unsafeFreezeByteArray## mba s1 of
                                          (## s2, ba ##) -> case f (Ptr (byteArrayContents## ba)) of
                                                              IO k -> case k s2 of
                                                                          (## s3, () ##) -> (## s3,
                                                                                             VkBufferMemoryBarrier##
                                                                                               ba ##))

        {-# INLINE unsafePtr #-}
        unsafePtr (VkBufferMemoryBarrier## ba) = Ptr (byteArrayContents## ba)

        {-# INLINE fromForeignPtr #-}
        fromForeignPtr = fromForeignPtr## VkBufferMemoryBarrier##

        {-# INLINE toForeignPtr #-}
        toForeignPtr (VkBufferMemoryBarrier## ba)
          = do ForeignPtr addr (PlainForeignPtr r) <- newForeignPtr_
                                                        (Ptr (byteArrayContents## ba))
               IO
                 (\ s -> (## s, ForeignPtr addr (MallocPtr (unsafeCoerce## ba) r) ##))

        {-# INLINE toPlainForeignPtr #-}
        toPlainForeignPtr (VkBufferMemoryBarrier## ba)
          = IO
              (\ s ->
                 (## s,
                    ForeignPtr (byteArrayContents## ba)
                      (PlainPtr (unsafeCoerce## ba)) ##))

        {-# INLINE touchVkData #-}
        touchVkData x@(VkBufferMemoryBarrier## ba)
          = IO (\ s -> (## touch## x (touch## ba s), () ##))

instance {-# OVERLAPPING #-} HasVkSType VkBufferMemoryBarrier where
        type VkSTypeMType VkBufferMemoryBarrier = VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkBufferMemoryBarrier, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkBufferMemoryBarrier, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkBufferMemoryBarrier, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkBufferMemoryBarrier, sType}

instance {-# OVERLAPPING #-} HasVkPNext VkBufferMemoryBarrier where
        type VkPNextMType VkBufferMemoryBarrier =
             Foreign.Ptr.Ptr Data.Void.Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkBufferMemoryBarrier, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkBufferMemoryBarrier, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkBufferMemoryBarrier, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkBufferMemoryBarrier, pNext}

instance {-# OVERLAPPING #-}
         HasVkSrcAccessMask VkBufferMemoryBarrier where
        type VkSrcAccessMaskMType VkBufferMemoryBarrier = VkAccessFlags

        {-# NOINLINE vkSrcAccessMask #-}
        vkSrcAccessMask x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkBufferMemoryBarrier, srcAccessMask})

        {-# INLINE vkSrcAccessMaskByteOffset #-}
        vkSrcAccessMaskByteOffset ~_
          = #{offset VkBufferMemoryBarrier, srcAccessMask}

        {-# INLINE readVkSrcAccessMask #-}
        readVkSrcAccessMask p
          = peekByteOff p
              #{offset VkBufferMemoryBarrier, srcAccessMask}

        {-# INLINE writeVkSrcAccessMask #-}
        writeVkSrcAccessMask p
          = pokeByteOff p
              #{offset VkBufferMemoryBarrier, srcAccessMask}

instance {-# OVERLAPPING #-}
         HasVkDstAccessMask VkBufferMemoryBarrier where
        type VkDstAccessMaskMType VkBufferMemoryBarrier = VkAccessFlags

        {-# NOINLINE vkDstAccessMask #-}
        vkDstAccessMask x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkBufferMemoryBarrier, dstAccessMask})

        {-# INLINE vkDstAccessMaskByteOffset #-}
        vkDstAccessMaskByteOffset ~_
          = #{offset VkBufferMemoryBarrier, dstAccessMask}

        {-# INLINE readVkDstAccessMask #-}
        readVkDstAccessMask p
          = peekByteOff p
              #{offset VkBufferMemoryBarrier, dstAccessMask}

        {-# INLINE writeVkDstAccessMask #-}
        writeVkDstAccessMask p
          = pokeByteOff p
              #{offset VkBufferMemoryBarrier, dstAccessMask}

class HasVkSrcQueueFamilyIndex a where
        type VkSrcQueueFamilyIndexMType a :: *

        vkSrcQueueFamilyIndex :: a -> VkSrcQueueFamilyIndexMType a

        vkSrcQueueFamilyIndexByteOffset :: a -> Int

        readVkSrcQueueFamilyIndex ::
                                  Ptr a -> IO (VkSrcQueueFamilyIndexMType a)

        writeVkSrcQueueFamilyIndex ::
                                   Ptr a -> VkSrcQueueFamilyIndexMType a -> IO ()

instance {-# OVERLAPPABLE #-}
         TypeError
           (ShowType a :<>:
              Text " does not seem to have field 'srcQueueFamilyIndex'." :$$:
                Text
                  "Check Vulkan documentation for available fields of this type.") =>
         HasVkSrcQueueFamilyIndex a

instance {-# OVERLAPPING #-}
         HasVkSrcQueueFamilyIndex VkBufferMemoryBarrier where
        type VkSrcQueueFamilyIndexMType VkBufferMemoryBarrier =
             Data.Word.Word32

        {-# NOINLINE vkSrcQueueFamilyIndex #-}
        vkSrcQueueFamilyIndex x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkBufferMemoryBarrier, srcQueueFamilyIndex})

        {-# INLINE vkSrcQueueFamilyIndexByteOffset #-}
        vkSrcQueueFamilyIndexByteOffset ~_
          = #{offset VkBufferMemoryBarrier, srcQueueFamilyIndex}

        {-# INLINE readVkSrcQueueFamilyIndex #-}
        readVkSrcQueueFamilyIndex p
          = peekByteOff p
              #{offset VkBufferMemoryBarrier, srcQueueFamilyIndex}

        {-# INLINE writeVkSrcQueueFamilyIndex #-}
        writeVkSrcQueueFamilyIndex p
          = pokeByteOff p
              #{offset VkBufferMemoryBarrier, srcQueueFamilyIndex}

class HasVkDstQueueFamilyIndex a where
        type VkDstQueueFamilyIndexMType a :: *

        vkDstQueueFamilyIndex :: a -> VkDstQueueFamilyIndexMType a

        vkDstQueueFamilyIndexByteOffset :: a -> Int

        readVkDstQueueFamilyIndex ::
                                  Ptr a -> IO (VkDstQueueFamilyIndexMType a)

        writeVkDstQueueFamilyIndex ::
                                   Ptr a -> VkDstQueueFamilyIndexMType a -> IO ()

instance {-# OVERLAPPABLE #-}
         TypeError
           (ShowType a :<>:
              Text " does not seem to have field 'dstQueueFamilyIndex'." :$$:
                Text
                  "Check Vulkan documentation for available fields of this type.") =>
         HasVkDstQueueFamilyIndex a

instance {-# OVERLAPPING #-}
         HasVkDstQueueFamilyIndex VkBufferMemoryBarrier where
        type VkDstQueueFamilyIndexMType VkBufferMemoryBarrier =
             Data.Word.Word32

        {-# NOINLINE vkDstQueueFamilyIndex #-}
        vkDstQueueFamilyIndex x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkBufferMemoryBarrier, dstQueueFamilyIndex})

        {-# INLINE vkDstQueueFamilyIndexByteOffset #-}
        vkDstQueueFamilyIndexByteOffset ~_
          = #{offset VkBufferMemoryBarrier, dstQueueFamilyIndex}

        {-# INLINE readVkDstQueueFamilyIndex #-}
        readVkDstQueueFamilyIndex p
          = peekByteOff p
              #{offset VkBufferMemoryBarrier, dstQueueFamilyIndex}

        {-# INLINE writeVkDstQueueFamilyIndex #-}
        writeVkDstQueueFamilyIndex p
          = pokeByteOff p
              #{offset VkBufferMemoryBarrier, dstQueueFamilyIndex}

instance {-# OVERLAPPING #-} HasVkBuffer VkBufferMemoryBarrier
         where
        type VkBufferMType VkBufferMemoryBarrier = VkBuffer

        {-# NOINLINE vkBuffer #-}
        vkBuffer x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkBufferMemoryBarrier, buffer})

        {-# INLINE vkBufferByteOffset #-}
        vkBufferByteOffset ~_
          = #{offset VkBufferMemoryBarrier, buffer}

        {-# INLINE readVkBuffer #-}
        readVkBuffer p
          = peekByteOff p #{offset VkBufferMemoryBarrier, buffer}

        {-# INLINE writeVkBuffer #-}
        writeVkBuffer p
          = pokeByteOff p #{offset VkBufferMemoryBarrier, buffer}

instance {-# OVERLAPPING #-} HasVkOffset VkBufferMemoryBarrier
         where
        type VkOffsetMType VkBufferMemoryBarrier = VkDeviceSize

        {-# NOINLINE vkOffset #-}
        vkOffset x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkBufferMemoryBarrier, offset})

        {-# INLINE vkOffsetByteOffset #-}
        vkOffsetByteOffset ~_
          = #{offset VkBufferMemoryBarrier, offset}

        {-# INLINE readVkOffset #-}
        readVkOffset p
          = peekByteOff p #{offset VkBufferMemoryBarrier, offset}

        {-# INLINE writeVkOffset #-}
        writeVkOffset p
          = pokeByteOff p #{offset VkBufferMemoryBarrier, offset}

instance {-# OVERLAPPING #-} HasVkSize VkBufferMemoryBarrier where
        type VkSizeMType VkBufferMemoryBarrier = VkDeviceSize

        {-# NOINLINE vkSize #-}
        vkSize x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkBufferMemoryBarrier, size})

        {-# INLINE vkSizeByteOffset #-}
        vkSizeByteOffset ~_
          = #{offset VkBufferMemoryBarrier, size}

        {-# INLINE readVkSize #-}
        readVkSize p
          = peekByteOff p #{offset VkBufferMemoryBarrier, size}

        {-# INLINE writeVkSize #-}
        writeVkSize p
          = pokeByteOff p #{offset VkBufferMemoryBarrier, size}

instance Show VkBufferMemoryBarrier where
        showsPrec d x
          = showString "VkBufferMemoryBarrier {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkSrcAccessMask = " .
                            showsPrec d (vkSrcAccessMask x) .
                              showString ", " .
                                showString "vkDstAccessMask = " .
                                  showsPrec d (vkDstAccessMask x) .
                                    showString ", " .
                                      showString "vkSrcQueueFamilyIndex = " .
                                        showsPrec d (vkSrcQueueFamilyIndex x) .
                                          showString ", " .
                                            showString "vkDstQueueFamilyIndex = " .
                                              showsPrec d (vkDstQueueFamilyIndex x) .
                                                showString ", " .
                                                  showString "vkBuffer = " .
                                                    showsPrec d (vkBuffer x) .
                                                      showString ", " .
                                                        showString "vkOffset = " .
                                                          showsPrec d (vkOffset x) .
                                                            showString ", " .
                                                              showString "vkSize = " .
                                                                showsPrec d (vkSize x) .
                                                                  showChar '}'

data VkDispatchIndirectCommand = VkDispatchIndirectCommand## ByteArray##

instance Eq VkDispatchIndirectCommand where
        (VkDispatchIndirectCommand## a) == (VkDispatchIndirectCommand## b)
          = EQ == cmpImmutableContent a b

        {-# INLINE (==) #-}

instance Ord VkDispatchIndirectCommand where
        (VkDispatchIndirectCommand## a) `compare`
          (VkDispatchIndirectCommand## b) = cmpImmutableContent a b

        {-# INLINE compare #-}

instance Storable VkDispatchIndirectCommand where
        sizeOf ~_ = #{size VkDispatchIndirectCommand}

        {-# INLINE sizeOf #-}
        alignment ~_ = #{alignment VkDispatchIndirectCommand}

        {-# INLINE alignment #-}
        peek (Ptr addr)
          | I## n <- sizeOf (undefined :: VkDispatchIndirectCommand),
            I## a <- alignment (undefined :: VkDispatchIndirectCommand) =
            IO
              (\ s ->
                 case newAlignedPinnedByteArray## n a s of
                     (## s1, mba ##) -> case copyAddrToByteArray## addr mba 0## n s1 of
                                          s2 -> case unsafeFreezeByteArray## mba s2 of
                                                    (## s3, ba ##) -> (## s3,
                                                                       VkDispatchIndirectCommand##
                                                                         ba ##))

        {-# INLINE peek #-}
        poke (Ptr addr) (VkDispatchIndirectCommand## ba)
          | I## n <- sizeOf (undefined :: VkDispatchIndirectCommand) =
            IO (\ s -> (## copyByteArrayToAddr## ba 0## addr n s, () ##))

        {-# INLINE poke #-}

instance VulkanMarshal VkDispatchIndirectCommand where
        {-# INLINE newVkData #-}
        newVkData f
          | I## n <- sizeOf (undefined :: VkDispatchIndirectCommand),
            I## a <- alignment (undefined :: VkDispatchIndirectCommand) =
            IO
              (\ s0 ->
                 case newAlignedPinnedByteArray## n a s0 of
                     (## s1, mba ##) -> case unsafeFreezeByteArray## mba s1 of
                                          (## s2, ba ##) -> case f (Ptr (byteArrayContents## ba)) of
                                                              IO k -> case k s2 of
                                                                          (## s3, () ##) -> (## s3,
                                                                                             VkDispatchIndirectCommand##
                                                                                               ba ##))

        {-# INLINE unsafePtr #-}
        unsafePtr (VkDispatchIndirectCommand## ba)
          = Ptr (byteArrayContents## ba)

        {-# INLINE fromForeignPtr #-}
        fromForeignPtr = fromForeignPtr## VkDispatchIndirectCommand##

        {-# INLINE toForeignPtr #-}
        toForeignPtr (VkDispatchIndirectCommand## ba)
          = do ForeignPtr addr (PlainForeignPtr r) <- newForeignPtr_
                                                        (Ptr (byteArrayContents## ba))
               IO
                 (\ s -> (## s, ForeignPtr addr (MallocPtr (unsafeCoerce## ba) r) ##))

        {-# INLINE toPlainForeignPtr #-}
        toPlainForeignPtr (VkDispatchIndirectCommand## ba)
          = IO
              (\ s ->
                 (## s,
                    ForeignPtr (byteArrayContents## ba)
                      (PlainPtr (unsafeCoerce## ba)) ##))

        {-# INLINE touchVkData #-}
        touchVkData x@(VkDispatchIndirectCommand## ba)
          = IO (\ s -> (## touch## x (touch## ba s), () ##))

instance {-# OVERLAPPING #-} HasVkX VkDispatchIndirectCommand where
        type VkXMType VkDispatchIndirectCommand = Data.Word.Word32

        {-# NOINLINE vkX #-}
        vkX x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkDispatchIndirectCommand, x})

        {-# INLINE vkXByteOffset #-}
        vkXByteOffset ~_ = #{offset VkDispatchIndirectCommand, x}

        {-# INLINE readVkX #-}
        readVkX p
          = peekByteOff p #{offset VkDispatchIndirectCommand, x}

        {-# INLINE writeVkX #-}
        writeVkX p
          = pokeByteOff p #{offset VkDispatchIndirectCommand, x}

instance {-# OVERLAPPING #-} HasVkY VkDispatchIndirectCommand where
        type VkYMType VkDispatchIndirectCommand = Data.Word.Word32

        {-# NOINLINE vkY #-}
        vkY x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkDispatchIndirectCommand, y})

        {-# INLINE vkYByteOffset #-}
        vkYByteOffset ~_ = #{offset VkDispatchIndirectCommand, y}

        {-# INLINE readVkY #-}
        readVkY p
          = peekByteOff p #{offset VkDispatchIndirectCommand, y}

        {-# INLINE writeVkY #-}
        writeVkY p
          = pokeByteOff p #{offset VkDispatchIndirectCommand, y}

instance {-# OVERLAPPING #-} HasVkZ VkDispatchIndirectCommand where
        type VkZMType VkDispatchIndirectCommand = Data.Word.Word32

        {-# NOINLINE vkZ #-}
        vkZ x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkDispatchIndirectCommand, z})

        {-# INLINE vkZByteOffset #-}
        vkZByteOffset ~_ = #{offset VkDispatchIndirectCommand, z}

        {-# INLINE readVkZ #-}
        readVkZ p
          = peekByteOff p #{offset VkDispatchIndirectCommand, z}

        {-# INLINE writeVkZ #-}
        writeVkZ p
          = pokeByteOff p #{offset VkDispatchIndirectCommand, z}

instance Show VkDispatchIndirectCommand where
        showsPrec d x
          = showString "VkDispatchIndirectCommand {" .
              showString "vkX = " .
                showsPrec d (vkX x) .
                  showString ", " .
                    showString "vkY = " .
                      showsPrec d (vkY x) .
                        showString ", " .
                          showString "vkZ = " . showsPrec d (vkZ x) . showChar '}'

data VkDrawIndexedIndirectCommand = VkDrawIndexedIndirectCommand## ByteArray##

instance Eq VkDrawIndexedIndirectCommand where
        (VkDrawIndexedIndirectCommand## a) ==
          (VkDrawIndexedIndirectCommand## b) = EQ == cmpImmutableContent a b

        {-# INLINE (==) #-}

instance Ord VkDrawIndexedIndirectCommand where
        (VkDrawIndexedIndirectCommand## a) `compare`
          (VkDrawIndexedIndirectCommand## b) = cmpImmutableContent a b

        {-# INLINE compare #-}

instance Storable VkDrawIndexedIndirectCommand where
        sizeOf ~_ = #{size VkDrawIndexedIndirectCommand}

        {-# INLINE sizeOf #-}
        alignment ~_ = #{alignment VkDrawIndexedIndirectCommand}

        {-# INLINE alignment #-}
        peek (Ptr addr)
          | I## n <- sizeOf (undefined :: VkDrawIndexedIndirectCommand),
            I## a <- alignment (undefined :: VkDrawIndexedIndirectCommand) =
            IO
              (\ s ->
                 case newAlignedPinnedByteArray## n a s of
                     (## s1, mba ##) -> case copyAddrToByteArray## addr mba 0## n s1 of
                                          s2 -> case unsafeFreezeByteArray## mba s2 of
                                                    (## s3, ba ##) -> (## s3,
                                                                       VkDrawIndexedIndirectCommand##
                                                                         ba ##))

        {-# INLINE peek #-}
        poke (Ptr addr) (VkDrawIndexedIndirectCommand## ba)
          | I## n <- sizeOf (undefined :: VkDrawIndexedIndirectCommand) =
            IO (\ s -> (## copyByteArrayToAddr## ba 0## addr n s, () ##))

        {-# INLINE poke #-}

instance VulkanMarshal VkDrawIndexedIndirectCommand where
        {-# INLINE newVkData #-}
        newVkData f
          | I## n <- sizeOf (undefined :: VkDrawIndexedIndirectCommand),
            I## a <- alignment (undefined :: VkDrawIndexedIndirectCommand) =
            IO
              (\ s0 ->
                 case newAlignedPinnedByteArray## n a s0 of
                     (## s1, mba ##) -> case unsafeFreezeByteArray## mba s1 of
                                          (## s2, ba ##) -> case f (Ptr (byteArrayContents## ba)) of
                                                              IO k -> case k s2 of
                                                                          (## s3, () ##) -> (## s3,
                                                                                             VkDrawIndexedIndirectCommand##
                                                                                               ba ##))

        {-# INLINE unsafePtr #-}
        unsafePtr (VkDrawIndexedIndirectCommand## ba)
          = Ptr (byteArrayContents## ba)

        {-# INLINE fromForeignPtr #-}
        fromForeignPtr = fromForeignPtr## VkDrawIndexedIndirectCommand##

        {-# INLINE toForeignPtr #-}
        toForeignPtr (VkDrawIndexedIndirectCommand## ba)
          = do ForeignPtr addr (PlainForeignPtr r) <- newForeignPtr_
                                                        (Ptr (byteArrayContents## ba))
               IO
                 (\ s -> (## s, ForeignPtr addr (MallocPtr (unsafeCoerce## ba) r) ##))

        {-# INLINE toPlainForeignPtr #-}
        toPlainForeignPtr (VkDrawIndexedIndirectCommand## ba)
          = IO
              (\ s ->
                 (## s,
                    ForeignPtr (byteArrayContents## ba)
                      (PlainPtr (unsafeCoerce## ba)) ##))

        {-# INLINE touchVkData #-}
        touchVkData x@(VkDrawIndexedIndirectCommand## ba)
          = IO (\ s -> (## touch## x (touch## ba s), () ##))

class HasVkIndexCount a where
        type VkIndexCountMType a :: *

        vkIndexCount :: a -> VkIndexCountMType a

        vkIndexCountByteOffset :: a -> Int

        readVkIndexCount :: Ptr a -> IO (VkIndexCountMType a)

        writeVkIndexCount :: Ptr a -> VkIndexCountMType a -> IO ()

instance {-# OVERLAPPABLE #-}
         TypeError
           (ShowType a :<>:
              Text " does not seem to have field 'indexCount'." :$$:
                Text
                  "Check Vulkan documentation for available fields of this type.") =>
         HasVkIndexCount a

instance {-# OVERLAPPING #-}
         HasVkIndexCount VkDrawIndexedIndirectCommand where
        type VkIndexCountMType VkDrawIndexedIndirectCommand =
             Data.Word.Word32

        {-# NOINLINE vkIndexCount #-}
        vkIndexCount x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkDrawIndexedIndirectCommand, indexCount})

        {-# INLINE vkIndexCountByteOffset #-}
        vkIndexCountByteOffset ~_
          = #{offset VkDrawIndexedIndirectCommand, indexCount}

        {-# INLINE readVkIndexCount #-}
        readVkIndexCount p
          = peekByteOff p
              #{offset VkDrawIndexedIndirectCommand, indexCount}

        {-# INLINE writeVkIndexCount #-}
        writeVkIndexCount p
          = pokeByteOff p
              #{offset VkDrawIndexedIndirectCommand, indexCount}

class HasVkInstanceCount a where
        type VkInstanceCountMType a :: *

        vkInstanceCount :: a -> VkInstanceCountMType a

        vkInstanceCountByteOffset :: a -> Int

        readVkInstanceCount :: Ptr a -> IO (VkInstanceCountMType a)

        writeVkInstanceCount :: Ptr a -> VkInstanceCountMType a -> IO ()

instance {-# OVERLAPPABLE #-}
         TypeError
           (ShowType a :<>:
              Text " does not seem to have field 'instanceCount'." :$$:
                Text
                  "Check Vulkan documentation for available fields of this type.") =>
         HasVkInstanceCount a

instance {-# OVERLAPPING #-}
         HasVkInstanceCount VkDrawIndexedIndirectCommand where
        type VkInstanceCountMType VkDrawIndexedIndirectCommand =
             Data.Word.Word32

        {-# NOINLINE vkInstanceCount #-}
        vkInstanceCount x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkDrawIndexedIndirectCommand, instanceCount})

        {-# INLINE vkInstanceCountByteOffset #-}
        vkInstanceCountByteOffset ~_
          = #{offset VkDrawIndexedIndirectCommand, instanceCount}

        {-# INLINE readVkInstanceCount #-}
        readVkInstanceCount p
          = peekByteOff p
              #{offset VkDrawIndexedIndirectCommand, instanceCount}

        {-# INLINE writeVkInstanceCount #-}
        writeVkInstanceCount p
          = pokeByteOff p
              #{offset VkDrawIndexedIndirectCommand, instanceCount}

class HasVkFirstIndex a where
        type VkFirstIndexMType a :: *

        vkFirstIndex :: a -> VkFirstIndexMType a

        vkFirstIndexByteOffset :: a -> Int

        readVkFirstIndex :: Ptr a -> IO (VkFirstIndexMType a)

        writeVkFirstIndex :: Ptr a -> VkFirstIndexMType a -> IO ()

instance {-# OVERLAPPABLE #-}
         TypeError
           (ShowType a :<>:
              Text " does not seem to have field 'firstIndex'." :$$:
                Text
                  "Check Vulkan documentation for available fields of this type.") =>
         HasVkFirstIndex a

instance {-# OVERLAPPING #-}
         HasVkFirstIndex VkDrawIndexedIndirectCommand where
        type VkFirstIndexMType VkDrawIndexedIndirectCommand =
             Data.Word.Word32

        {-# NOINLINE vkFirstIndex #-}
        vkFirstIndex x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkDrawIndexedIndirectCommand, firstIndex})

        {-# INLINE vkFirstIndexByteOffset #-}
        vkFirstIndexByteOffset ~_
          = #{offset VkDrawIndexedIndirectCommand, firstIndex}

        {-# INLINE readVkFirstIndex #-}
        readVkFirstIndex p
          = peekByteOff p
              #{offset VkDrawIndexedIndirectCommand, firstIndex}

        {-# INLINE writeVkFirstIndex #-}
        writeVkFirstIndex p
          = pokeByteOff p
              #{offset VkDrawIndexedIndirectCommand, firstIndex}

class HasVkVertexOffset a where
        type VkVertexOffsetMType a :: *

        vkVertexOffset :: a -> VkVertexOffsetMType a

        vkVertexOffsetByteOffset :: a -> Int

        readVkVertexOffset :: Ptr a -> IO (VkVertexOffsetMType a)

        writeVkVertexOffset :: Ptr a -> VkVertexOffsetMType a -> IO ()

instance {-# OVERLAPPABLE #-}
         TypeError
           (ShowType a :<>:
              Text " does not seem to have field 'vertexOffset'." :$$:
                Text
                  "Check Vulkan documentation for available fields of this type.") =>
         HasVkVertexOffset a

instance {-# OVERLAPPING #-}
         HasVkVertexOffset VkDrawIndexedIndirectCommand where
        type VkVertexOffsetMType VkDrawIndexedIndirectCommand =
             Data.Int.Int32

        {-# NOINLINE vkVertexOffset #-}
        vkVertexOffset x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkDrawIndexedIndirectCommand, vertexOffset})

        {-# INLINE vkVertexOffsetByteOffset #-}
        vkVertexOffsetByteOffset ~_
          = #{offset VkDrawIndexedIndirectCommand, vertexOffset}

        {-# INLINE readVkVertexOffset #-}
        readVkVertexOffset p
          = peekByteOff p
              #{offset VkDrawIndexedIndirectCommand, vertexOffset}

        {-# INLINE writeVkVertexOffset #-}
        writeVkVertexOffset p
          = pokeByteOff p
              #{offset VkDrawIndexedIndirectCommand, vertexOffset}

class HasVkFirstInstance a where
        type VkFirstInstanceMType a :: *

        vkFirstInstance :: a -> VkFirstInstanceMType a

        vkFirstInstanceByteOffset :: a -> Int

        readVkFirstInstance :: Ptr a -> IO (VkFirstInstanceMType a)

        writeVkFirstInstance :: Ptr a -> VkFirstInstanceMType a -> IO ()

instance {-# OVERLAPPABLE #-}
         TypeError
           (ShowType a :<>:
              Text " does not seem to have field 'firstInstance'." :$$:
                Text
                  "Check Vulkan documentation for available fields of this type.") =>
         HasVkFirstInstance a

instance {-# OVERLAPPING #-}
         HasVkFirstInstance VkDrawIndexedIndirectCommand where
        type VkFirstInstanceMType VkDrawIndexedIndirectCommand =
             Data.Word.Word32

        {-# NOINLINE vkFirstInstance #-}
        vkFirstInstance x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkDrawIndexedIndirectCommand, firstInstance})

        {-# INLINE vkFirstInstanceByteOffset #-}
        vkFirstInstanceByteOffset ~_
          = #{offset VkDrawIndexedIndirectCommand, firstInstance}

        {-# INLINE readVkFirstInstance #-}
        readVkFirstInstance p
          = peekByteOff p
              #{offset VkDrawIndexedIndirectCommand, firstInstance}

        {-# INLINE writeVkFirstInstance #-}
        writeVkFirstInstance p
          = pokeByteOff p
              #{offset VkDrawIndexedIndirectCommand, firstInstance}

instance Show VkDrawIndexedIndirectCommand where
        showsPrec d x
          = showString "VkDrawIndexedIndirectCommand {" .
              showString "vkIndexCount = " .
                showsPrec d (vkIndexCount x) .
                  showString ", " .
                    showString "vkInstanceCount = " .
                      showsPrec d (vkInstanceCount x) .
                        showString ", " .
                          showString "vkFirstIndex = " .
                            showsPrec d (vkFirstIndex x) .
                              showString ", " .
                                showString "vkVertexOffset = " .
                                  showsPrec d (vkVertexOffset x) .
                                    showString ", " .
                                      showString "vkFirstInstance = " .
                                        showsPrec d (vkFirstInstance x) . showChar '}'

data VkDrawIndirectCommand = VkDrawIndirectCommand## ByteArray##

instance Eq VkDrawIndirectCommand where
        (VkDrawIndirectCommand## a) == (VkDrawIndirectCommand## b)
          = EQ == cmpImmutableContent a b

        {-# INLINE (==) #-}

instance Ord VkDrawIndirectCommand where
        (VkDrawIndirectCommand## a) `compare` (VkDrawIndirectCommand## b)
          = cmpImmutableContent a b

        {-# INLINE compare #-}

instance Storable VkDrawIndirectCommand where
        sizeOf ~_ = #{size VkDrawIndirectCommand}

        {-# INLINE sizeOf #-}
        alignment ~_ = #{alignment VkDrawIndirectCommand}

        {-# INLINE alignment #-}
        peek (Ptr addr)
          | I## n <- sizeOf (undefined :: VkDrawIndirectCommand),
            I## a <- alignment (undefined :: VkDrawIndirectCommand) =
            IO
              (\ s ->
                 case newAlignedPinnedByteArray## n a s of
                     (## s1, mba ##) -> case copyAddrToByteArray## addr mba 0## n s1 of
                                          s2 -> case unsafeFreezeByteArray## mba s2 of
                                                    (## s3, ba ##) -> (## s3,
                                                                       VkDrawIndirectCommand## ba ##))

        {-# INLINE peek #-}
        poke (Ptr addr) (VkDrawIndirectCommand## ba)
          | I## n <- sizeOf (undefined :: VkDrawIndirectCommand) =
            IO (\ s -> (## copyByteArrayToAddr## ba 0## addr n s, () ##))

        {-# INLINE poke #-}

instance VulkanMarshal VkDrawIndirectCommand where
        {-# INLINE newVkData #-}
        newVkData f
          | I## n <- sizeOf (undefined :: VkDrawIndirectCommand),
            I## a <- alignment (undefined :: VkDrawIndirectCommand) =
            IO
              (\ s0 ->
                 case newAlignedPinnedByteArray## n a s0 of
                     (## s1, mba ##) -> case unsafeFreezeByteArray## mba s1 of
                                          (## s2, ba ##) -> case f (Ptr (byteArrayContents## ba)) of
                                                              IO k -> case k s2 of
                                                                          (## s3, () ##) -> (## s3,
                                                                                             VkDrawIndirectCommand##
                                                                                               ba ##))

        {-# INLINE unsafePtr #-}
        unsafePtr (VkDrawIndirectCommand## ba) = Ptr (byteArrayContents## ba)

        {-# INLINE fromForeignPtr #-}
        fromForeignPtr = fromForeignPtr## VkDrawIndirectCommand##

        {-# INLINE toForeignPtr #-}
        toForeignPtr (VkDrawIndirectCommand## ba)
          = do ForeignPtr addr (PlainForeignPtr r) <- newForeignPtr_
                                                        (Ptr (byteArrayContents## ba))
               IO
                 (\ s -> (## s, ForeignPtr addr (MallocPtr (unsafeCoerce## ba) r) ##))

        {-# INLINE toPlainForeignPtr #-}
        toPlainForeignPtr (VkDrawIndirectCommand## ba)
          = IO
              (\ s ->
                 (## s,
                    ForeignPtr (byteArrayContents## ba)
                      (PlainPtr (unsafeCoerce## ba)) ##))

        {-# INLINE touchVkData #-}
        touchVkData x@(VkDrawIndirectCommand## ba)
          = IO (\ s -> (## touch## x (touch## ba s), () ##))

class HasVkVertexCount a where
        type VkVertexCountMType a :: *

        vkVertexCount :: a -> VkVertexCountMType a

        vkVertexCountByteOffset :: a -> Int

        readVkVertexCount :: Ptr a -> IO (VkVertexCountMType a)

        writeVkVertexCount :: Ptr a -> VkVertexCountMType a -> IO ()

instance {-# OVERLAPPABLE #-}
         TypeError
           (ShowType a :<>:
              Text " does not seem to have field 'vertexCount'." :$$:
                Text
                  "Check Vulkan documentation for available fields of this type.") =>
         HasVkVertexCount a

instance {-# OVERLAPPING #-} HasVkVertexCount VkDrawIndirectCommand
         where
        type VkVertexCountMType VkDrawIndirectCommand = Data.Word.Word32

        {-# NOINLINE vkVertexCount #-}
        vkVertexCount x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkDrawIndirectCommand, vertexCount})

        {-# INLINE vkVertexCountByteOffset #-}
        vkVertexCountByteOffset ~_
          = #{offset VkDrawIndirectCommand, vertexCount}

        {-# INLINE readVkVertexCount #-}
        readVkVertexCount p
          = peekByteOff p
              #{offset VkDrawIndirectCommand, vertexCount}

        {-# INLINE writeVkVertexCount #-}
        writeVkVertexCount p
          = pokeByteOff p
              #{offset VkDrawIndirectCommand, vertexCount}

instance {-# OVERLAPPING #-}
         HasVkInstanceCount VkDrawIndirectCommand where
        type VkInstanceCountMType VkDrawIndirectCommand = Data.Word.Word32

        {-# NOINLINE vkInstanceCount #-}
        vkInstanceCount x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkDrawIndirectCommand, instanceCount})

        {-# INLINE vkInstanceCountByteOffset #-}
        vkInstanceCountByteOffset ~_
          = #{offset VkDrawIndirectCommand, instanceCount}

        {-# INLINE readVkInstanceCount #-}
        readVkInstanceCount p
          = peekByteOff p
              #{offset VkDrawIndirectCommand, instanceCount}

        {-# INLINE writeVkInstanceCount #-}
        writeVkInstanceCount p
          = pokeByteOff p
              #{offset VkDrawIndirectCommand, instanceCount}

class HasVkFirstVertex a where
        type VkFirstVertexMType a :: *

        vkFirstVertex :: a -> VkFirstVertexMType a

        vkFirstVertexByteOffset :: a -> Int

        readVkFirstVertex :: Ptr a -> IO (VkFirstVertexMType a)

        writeVkFirstVertex :: Ptr a -> VkFirstVertexMType a -> IO ()

instance {-# OVERLAPPABLE #-}
         TypeError
           (ShowType a :<>:
              Text " does not seem to have field 'firstVertex'." :$$:
                Text
                  "Check Vulkan documentation for available fields of this type.") =>
         HasVkFirstVertex a

instance {-# OVERLAPPING #-} HasVkFirstVertex VkDrawIndirectCommand
         where
        type VkFirstVertexMType VkDrawIndirectCommand = Data.Word.Word32

        {-# NOINLINE vkFirstVertex #-}
        vkFirstVertex x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkDrawIndirectCommand, firstVertex})

        {-# INLINE vkFirstVertexByteOffset #-}
        vkFirstVertexByteOffset ~_
          = #{offset VkDrawIndirectCommand, firstVertex}

        {-# INLINE readVkFirstVertex #-}
        readVkFirstVertex p
          = peekByteOff p
              #{offset VkDrawIndirectCommand, firstVertex}

        {-# INLINE writeVkFirstVertex #-}
        writeVkFirstVertex p
          = pokeByteOff p
              #{offset VkDrawIndirectCommand, firstVertex}

instance {-# OVERLAPPING #-}
         HasVkFirstInstance VkDrawIndirectCommand where
        type VkFirstInstanceMType VkDrawIndirectCommand = Data.Word.Word32

        {-# NOINLINE vkFirstInstance #-}
        vkFirstInstance x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkDrawIndirectCommand, firstInstance})

        {-# INLINE vkFirstInstanceByteOffset #-}
        vkFirstInstanceByteOffset ~_
          = #{offset VkDrawIndirectCommand, firstInstance}

        {-# INLINE readVkFirstInstance #-}
        readVkFirstInstance p
          = peekByteOff p
              #{offset VkDrawIndirectCommand, firstInstance}

        {-# INLINE writeVkFirstInstance #-}
        writeVkFirstInstance p
          = pokeByteOff p
              #{offset VkDrawIndirectCommand, firstInstance}

instance Show VkDrawIndirectCommand where
        showsPrec d x
          = showString "VkDrawIndirectCommand {" .
              showString "vkVertexCount = " .
                showsPrec d (vkVertexCount x) .
                  showString ", " .
                    showString "vkInstanceCount = " .
                      showsPrec d (vkInstanceCount x) .
                        showString ", " .
                          showString "vkFirstVertex = " .
                            showsPrec d (vkFirstVertex x) .
                              showString ", " .
                                showString "vkFirstInstance = " .
                                  showsPrec d (vkFirstInstance x) . showChar '}'

data VkImageMemoryBarrier = VkImageMemoryBarrier## ByteArray##

instance Eq VkImageMemoryBarrier where
        (VkImageMemoryBarrier## a) == (VkImageMemoryBarrier## b)
          = EQ == cmpImmutableContent a b

        {-# INLINE (==) #-}

instance Ord VkImageMemoryBarrier where
        (VkImageMemoryBarrier## a) `compare` (VkImageMemoryBarrier## b)
          = cmpImmutableContent a b

        {-# INLINE compare #-}

instance Storable VkImageMemoryBarrier where
        sizeOf ~_ = #{size VkImageMemoryBarrier}

        {-# INLINE sizeOf #-}
        alignment ~_ = #{alignment VkImageMemoryBarrier}

        {-# INLINE alignment #-}
        peek (Ptr addr)
          | I## n <- sizeOf (undefined :: VkImageMemoryBarrier),
            I## a <- alignment (undefined :: VkImageMemoryBarrier) =
            IO
              (\ s ->
                 case newAlignedPinnedByteArray## n a s of
                     (## s1, mba ##) -> case copyAddrToByteArray## addr mba 0## n s1 of
                                          s2 -> case unsafeFreezeByteArray## mba s2 of
                                                    (## s3, ba ##) -> (## s3,
                                                                       VkImageMemoryBarrier## ba ##))

        {-# INLINE peek #-}
        poke (Ptr addr) (VkImageMemoryBarrier## ba)
          | I## n <- sizeOf (undefined :: VkImageMemoryBarrier) =
            IO (\ s -> (## copyByteArrayToAddr## ba 0## addr n s, () ##))

        {-# INLINE poke #-}

instance VulkanMarshal VkImageMemoryBarrier where
        {-# INLINE newVkData #-}
        newVkData f
          | I## n <- sizeOf (undefined :: VkImageMemoryBarrier),
            I## a <- alignment (undefined :: VkImageMemoryBarrier) =
            IO
              (\ s0 ->
                 case newAlignedPinnedByteArray## n a s0 of
                     (## s1, mba ##) -> case unsafeFreezeByteArray## mba s1 of
                                          (## s2, ba ##) -> case f (Ptr (byteArrayContents## ba)) of
                                                              IO k -> case k s2 of
                                                                          (## s3, () ##) -> (## s3,
                                                                                             VkImageMemoryBarrier##
                                                                                               ba ##))

        {-# INLINE unsafePtr #-}
        unsafePtr (VkImageMemoryBarrier## ba) = Ptr (byteArrayContents## ba)

        {-# INLINE fromForeignPtr #-}
        fromForeignPtr = fromForeignPtr## VkImageMemoryBarrier##

        {-# INLINE toForeignPtr #-}
        toForeignPtr (VkImageMemoryBarrier## ba)
          = do ForeignPtr addr (PlainForeignPtr r) <- newForeignPtr_
                                                        (Ptr (byteArrayContents## ba))
               IO
                 (\ s -> (## s, ForeignPtr addr (MallocPtr (unsafeCoerce## ba) r) ##))

        {-# INLINE toPlainForeignPtr #-}
        toPlainForeignPtr (VkImageMemoryBarrier## ba)
          = IO
              (\ s ->
                 (## s,
                    ForeignPtr (byteArrayContents## ba)
                      (PlainPtr (unsafeCoerce## ba)) ##))

        {-# INLINE touchVkData #-}
        touchVkData x@(VkImageMemoryBarrier## ba)
          = IO (\ s -> (## touch## x (touch## ba s), () ##))

instance {-# OVERLAPPING #-} HasVkSType VkImageMemoryBarrier where
        type VkSTypeMType VkImageMemoryBarrier = VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkImageMemoryBarrier, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkImageMemoryBarrier, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkImageMemoryBarrier, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkImageMemoryBarrier, sType}

instance {-# OVERLAPPING #-} HasVkPNext VkImageMemoryBarrier where
        type VkPNextMType VkImageMemoryBarrier =
             Foreign.Ptr.Ptr Data.Void.Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkImageMemoryBarrier, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkImageMemoryBarrier, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkImageMemoryBarrier, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkImageMemoryBarrier, pNext}

instance {-# OVERLAPPING #-}
         HasVkSrcAccessMask VkImageMemoryBarrier where
        type VkSrcAccessMaskMType VkImageMemoryBarrier = VkAccessFlags

        {-# NOINLINE vkSrcAccessMask #-}
        vkSrcAccessMask x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkImageMemoryBarrier, srcAccessMask})

        {-# INLINE vkSrcAccessMaskByteOffset #-}
        vkSrcAccessMaskByteOffset ~_
          = #{offset VkImageMemoryBarrier, srcAccessMask}

        {-# INLINE readVkSrcAccessMask #-}
        readVkSrcAccessMask p
          = peekByteOff p
              #{offset VkImageMemoryBarrier, srcAccessMask}

        {-# INLINE writeVkSrcAccessMask #-}
        writeVkSrcAccessMask p
          = pokeByteOff p
              #{offset VkImageMemoryBarrier, srcAccessMask}

instance {-# OVERLAPPING #-}
         HasVkDstAccessMask VkImageMemoryBarrier where
        type VkDstAccessMaskMType VkImageMemoryBarrier = VkAccessFlags

        {-# NOINLINE vkDstAccessMask #-}
        vkDstAccessMask x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkImageMemoryBarrier, dstAccessMask})

        {-# INLINE vkDstAccessMaskByteOffset #-}
        vkDstAccessMaskByteOffset ~_
          = #{offset VkImageMemoryBarrier, dstAccessMask}

        {-# INLINE readVkDstAccessMask #-}
        readVkDstAccessMask p
          = peekByteOff p
              #{offset VkImageMemoryBarrier, dstAccessMask}

        {-# INLINE writeVkDstAccessMask #-}
        writeVkDstAccessMask p
          = pokeByteOff p
              #{offset VkImageMemoryBarrier, dstAccessMask}

class HasVkOldLayout a where
        type VkOldLayoutMType a :: *

        vkOldLayout :: a -> VkOldLayoutMType a

        vkOldLayoutByteOffset :: a -> Int

        readVkOldLayout :: Ptr a -> IO (VkOldLayoutMType a)

        writeVkOldLayout :: Ptr a -> VkOldLayoutMType a -> IO ()

instance {-# OVERLAPPABLE #-}
         TypeError
           (ShowType a :<>:
              Text " does not seem to have field 'oldLayout'." :$$:
                Text
                  "Check Vulkan documentation for available fields of this type.") =>
         HasVkOldLayout a

instance {-# OVERLAPPING #-} HasVkOldLayout VkImageMemoryBarrier
         where
        type VkOldLayoutMType VkImageMemoryBarrier = VkImageLayout

        {-# NOINLINE vkOldLayout #-}
        vkOldLayout x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkImageMemoryBarrier, oldLayout})

        {-# INLINE vkOldLayoutByteOffset #-}
        vkOldLayoutByteOffset ~_
          = #{offset VkImageMemoryBarrier, oldLayout}

        {-# INLINE readVkOldLayout #-}
        readVkOldLayout p
          = peekByteOff p #{offset VkImageMemoryBarrier, oldLayout}

        {-# INLINE writeVkOldLayout #-}
        writeVkOldLayout p
          = pokeByteOff p #{offset VkImageMemoryBarrier, oldLayout}

class HasVkNewLayout a where
        type VkNewLayoutMType a :: *

        vkNewLayout :: a -> VkNewLayoutMType a

        vkNewLayoutByteOffset :: a -> Int

        readVkNewLayout :: Ptr a -> IO (VkNewLayoutMType a)

        writeVkNewLayout :: Ptr a -> VkNewLayoutMType a -> IO ()

instance {-# OVERLAPPABLE #-}
         TypeError
           (ShowType a :<>:
              Text " does not seem to have field 'newLayout'." :$$:
                Text
                  "Check Vulkan documentation for available fields of this type.") =>
         HasVkNewLayout a

instance {-# OVERLAPPING #-} HasVkNewLayout VkImageMemoryBarrier
         where
        type VkNewLayoutMType VkImageMemoryBarrier = VkImageLayout

        {-# NOINLINE vkNewLayout #-}
        vkNewLayout x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkImageMemoryBarrier, newLayout})

        {-# INLINE vkNewLayoutByteOffset #-}
        vkNewLayoutByteOffset ~_
          = #{offset VkImageMemoryBarrier, newLayout}

        {-# INLINE readVkNewLayout #-}
        readVkNewLayout p
          = peekByteOff p #{offset VkImageMemoryBarrier, newLayout}

        {-# INLINE writeVkNewLayout #-}
        writeVkNewLayout p
          = pokeByteOff p #{offset VkImageMemoryBarrier, newLayout}

instance {-# OVERLAPPING #-}
         HasVkSrcQueueFamilyIndex VkImageMemoryBarrier where
        type VkSrcQueueFamilyIndexMType VkImageMemoryBarrier =
             Data.Word.Word32

        {-# NOINLINE vkSrcQueueFamilyIndex #-}
        vkSrcQueueFamilyIndex x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkImageMemoryBarrier, srcQueueFamilyIndex})

        {-# INLINE vkSrcQueueFamilyIndexByteOffset #-}
        vkSrcQueueFamilyIndexByteOffset ~_
          = #{offset VkImageMemoryBarrier, srcQueueFamilyIndex}

        {-# INLINE readVkSrcQueueFamilyIndex #-}
        readVkSrcQueueFamilyIndex p
          = peekByteOff p
              #{offset VkImageMemoryBarrier, srcQueueFamilyIndex}

        {-# INLINE writeVkSrcQueueFamilyIndex #-}
        writeVkSrcQueueFamilyIndex p
          = pokeByteOff p
              #{offset VkImageMemoryBarrier, srcQueueFamilyIndex}

instance {-# OVERLAPPING #-}
         HasVkDstQueueFamilyIndex VkImageMemoryBarrier where
        type VkDstQueueFamilyIndexMType VkImageMemoryBarrier =
             Data.Word.Word32

        {-# NOINLINE vkDstQueueFamilyIndex #-}
        vkDstQueueFamilyIndex x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkImageMemoryBarrier, dstQueueFamilyIndex})

        {-# INLINE vkDstQueueFamilyIndexByteOffset #-}
        vkDstQueueFamilyIndexByteOffset ~_
          = #{offset VkImageMemoryBarrier, dstQueueFamilyIndex}

        {-# INLINE readVkDstQueueFamilyIndex #-}
        readVkDstQueueFamilyIndex p
          = peekByteOff p
              #{offset VkImageMemoryBarrier, dstQueueFamilyIndex}

        {-# INLINE writeVkDstQueueFamilyIndex #-}
        writeVkDstQueueFamilyIndex p
          = pokeByteOff p
              #{offset VkImageMemoryBarrier, dstQueueFamilyIndex}

instance {-# OVERLAPPING #-} HasVkImage VkImageMemoryBarrier where
        type VkImageMType VkImageMemoryBarrier = VkImage

        {-# NOINLINE vkImage #-}
        vkImage x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkImageMemoryBarrier, image})

        {-# INLINE vkImageByteOffset #-}
        vkImageByteOffset ~_
          = #{offset VkImageMemoryBarrier, image}

        {-# INLINE readVkImage #-}
        readVkImage p
          = peekByteOff p #{offset VkImageMemoryBarrier, image}

        {-# INLINE writeVkImage #-}
        writeVkImage p
          = pokeByteOff p #{offset VkImageMemoryBarrier, image}

instance {-# OVERLAPPING #-}
         HasVkSubresourceRange VkImageMemoryBarrier where
        type VkSubresourceRangeMType VkImageMemoryBarrier =
             VkImageSubresourceRange

        {-# NOINLINE vkSubresourceRange #-}
        vkSubresourceRange x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkImageMemoryBarrier, subresourceRange})

        {-# INLINE vkSubresourceRangeByteOffset #-}
        vkSubresourceRangeByteOffset ~_
          = #{offset VkImageMemoryBarrier, subresourceRange}

        {-# INLINE readVkSubresourceRange #-}
        readVkSubresourceRange p
          = peekByteOff p
              #{offset VkImageMemoryBarrier, subresourceRange}

        {-# INLINE writeVkSubresourceRange #-}
        writeVkSubresourceRange p
          = pokeByteOff p
              #{offset VkImageMemoryBarrier, subresourceRange}

instance Show VkImageMemoryBarrier where
        showsPrec d x
          = showString "VkImageMemoryBarrier {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkSrcAccessMask = " .
                            showsPrec d (vkSrcAccessMask x) .
                              showString ", " .
                                showString "vkDstAccessMask = " .
                                  showsPrec d (vkDstAccessMask x) .
                                    showString ", " .
                                      showString "vkOldLayout = " .
                                        showsPrec d (vkOldLayout x) .
                                          showString ", " .
                                            showString "vkNewLayout = " .
                                              showsPrec d (vkNewLayout x) .
                                                showString ", " .
                                                  showString "vkSrcQueueFamilyIndex = " .
                                                    showsPrec d (vkSrcQueueFamilyIndex x) .
                                                      showString ", " .
                                                        showString "vkDstQueueFamilyIndex = " .
                                                          showsPrec d (vkDstQueueFamilyIndex x) .
                                                            showString ", " .
                                                              showString "vkImage = " .
                                                                showsPrec d (vkImage x) .
                                                                  showString ", " .
                                                                    showString
                                                                      "vkSubresourceRange = "
                                                                      .
                                                                      showsPrec d
                                                                        (vkSubresourceRange x)
                                                                        . showChar '}'

data VkMemoryBarrier = VkMemoryBarrier## ByteArray##

instance Eq VkMemoryBarrier where
        (VkMemoryBarrier## a) == (VkMemoryBarrier## b)
          = EQ == cmpImmutableContent a b

        {-# INLINE (==) #-}

instance Ord VkMemoryBarrier where
        (VkMemoryBarrier## a) `compare` (VkMemoryBarrier## b)
          = cmpImmutableContent a b

        {-# INLINE compare #-}

instance Storable VkMemoryBarrier where
        sizeOf ~_ = #{size VkMemoryBarrier}

        {-# INLINE sizeOf #-}
        alignment ~_ = #{alignment VkMemoryBarrier}

        {-# INLINE alignment #-}
        peek (Ptr addr)
          | I## n <- sizeOf (undefined :: VkMemoryBarrier),
            I## a <- alignment (undefined :: VkMemoryBarrier) =
            IO
              (\ s ->
                 case newAlignedPinnedByteArray## n a s of
                     (## s1, mba ##) -> case copyAddrToByteArray## addr mba 0## n s1 of
                                          s2 -> case unsafeFreezeByteArray## mba s2 of
                                                    (## s3, ba ##) -> (## s3, VkMemoryBarrier## ba ##))

        {-# INLINE peek #-}
        poke (Ptr addr) (VkMemoryBarrier## ba)
          | I## n <- sizeOf (undefined :: VkMemoryBarrier) =
            IO (\ s -> (## copyByteArrayToAddr## ba 0## addr n s, () ##))

        {-# INLINE poke #-}

instance VulkanMarshal VkMemoryBarrier where
        {-# INLINE newVkData #-}
        newVkData f
          | I## n <- sizeOf (undefined :: VkMemoryBarrier),
            I## a <- alignment (undefined :: VkMemoryBarrier) =
            IO
              (\ s0 ->
                 case newAlignedPinnedByteArray## n a s0 of
                     (## s1, mba ##) -> case unsafeFreezeByteArray## mba s1 of
                                          (## s2, ba ##) -> case f (Ptr (byteArrayContents## ba)) of
                                                              IO k -> case k s2 of
                                                                          (## s3, () ##) -> (## s3,
                                                                                             VkMemoryBarrier##
                                                                                               ba ##))

        {-# INLINE unsafePtr #-}
        unsafePtr (VkMemoryBarrier## ba) = Ptr (byteArrayContents## ba)

        {-# INLINE fromForeignPtr #-}
        fromForeignPtr = fromForeignPtr## VkMemoryBarrier##

        {-# INLINE toForeignPtr #-}
        toForeignPtr (VkMemoryBarrier## ba)
          = do ForeignPtr addr (PlainForeignPtr r) <- newForeignPtr_
                                                        (Ptr (byteArrayContents## ba))
               IO
                 (\ s -> (## s, ForeignPtr addr (MallocPtr (unsafeCoerce## ba) r) ##))

        {-# INLINE toPlainForeignPtr #-}
        toPlainForeignPtr (VkMemoryBarrier## ba)
          = IO
              (\ s ->
                 (## s,
                    ForeignPtr (byteArrayContents## ba)
                      (PlainPtr (unsafeCoerce## ba)) ##))

        {-# INLINE touchVkData #-}
        touchVkData x@(VkMemoryBarrier## ba)
          = IO (\ s -> (## touch## x (touch## ba s), () ##))

instance {-# OVERLAPPING #-} HasVkSType VkMemoryBarrier where
        type VkSTypeMType VkMemoryBarrier = VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkMemoryBarrier, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_ = #{offset VkMemoryBarrier, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkMemoryBarrier, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkMemoryBarrier, sType}

instance {-# OVERLAPPING #-} HasVkPNext VkMemoryBarrier where
        type VkPNextMType VkMemoryBarrier = Foreign.Ptr.Ptr Data.Void.Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkMemoryBarrier, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_ = #{offset VkMemoryBarrier, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkMemoryBarrier, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkMemoryBarrier, pNext}

instance {-# OVERLAPPING #-} HasVkSrcAccessMask VkMemoryBarrier
         where
        type VkSrcAccessMaskMType VkMemoryBarrier = VkAccessFlags

        {-# NOINLINE vkSrcAccessMask #-}
        vkSrcAccessMask x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkMemoryBarrier, srcAccessMask})

        {-# INLINE vkSrcAccessMaskByteOffset #-}
        vkSrcAccessMaskByteOffset ~_
          = #{offset VkMemoryBarrier, srcAccessMask}

        {-# INLINE readVkSrcAccessMask #-}
        readVkSrcAccessMask p
          = peekByteOff p #{offset VkMemoryBarrier, srcAccessMask}

        {-# INLINE writeVkSrcAccessMask #-}
        writeVkSrcAccessMask p
          = pokeByteOff p #{offset VkMemoryBarrier, srcAccessMask}

instance {-# OVERLAPPING #-} HasVkDstAccessMask VkMemoryBarrier
         where
        type VkDstAccessMaskMType VkMemoryBarrier = VkAccessFlags

        {-# NOINLINE vkDstAccessMask #-}
        vkDstAccessMask x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x)
                 #{offset VkMemoryBarrier, dstAccessMask})

        {-# INLINE vkDstAccessMaskByteOffset #-}
        vkDstAccessMaskByteOffset ~_
          = #{offset VkMemoryBarrier, dstAccessMask}

        {-# INLINE readVkDstAccessMask #-}
        readVkDstAccessMask p
          = peekByteOff p #{offset VkMemoryBarrier, dstAccessMask}

        {-# INLINE writeVkDstAccessMask #-}
        writeVkDstAccessMask p
          = pokeByteOff p #{offset VkMemoryBarrier, dstAccessMask}

instance Show VkMemoryBarrier where
        showsPrec d x
          = showString "VkMemoryBarrier {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkSrcAccessMask = " .
                            showsPrec d (vkSrcAccessMask x) .
                              showString ", " .
                                showString "vkDstAccessMask = " .
                                  showsPrec d (vkDstAccessMask x) . showChar '}'