module Web.Framework.Plzwrk.Util
  ( pT
  , pF
  , eventTargetValue
  , eventPreventDefault
  , eventTargetBlur
  , elementSetAttribute
  , elementTagName
  , eventTargetAddEventListener
  , eventTargetRemoveEventListener
  , getPropertyAsBool
  , getPropertyAsDouble
  , getPropertyAsInt
  , getPropertyAsString
  , htmlElemenetClick
  , consoleLogS
  , nodeAppendChild
  , nodeChildNodes
  , nodeInsertBefore
  , nodeRemoveChild
  , nodeTextContent
  )
where

import           Control.Monad
import           Data.HashMap.Strict           as HM
import           Data.Set                      as S
import           Web.Framework.Plzwrk.Base      ( dats
                                                , dats'
                                                , PwAttribute(..)
                                                )
import           Web.Framework.Plzwrk.JSEnv

-- | Creates a text attribute wrapped in an applicative functor
pT :: String -> s -> PwAttribute s opq
pT t _ = PwTextAttribute t

-- | Creates a callback attribute wrapped in an applicative functor
pF :: (opq -> s -> IO s) -> s -> PwAttribute s opq
pF f _ = PwFunctionAttribute f

-- |From an event, gets the target's value.
eventTargetValue
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the event
  -> IO (Maybe String) -- ^ the target value, or nothing if it doesn't exist
eventTargetValue browser e = do
  opq <- getPropertyAsOpaque browser e "target"
  maybe (pure Nothing) (\y -> getPropertyAsString browser y "value") opq

-- |From an event, takes the target and blurs it.
eventTargetBlur
  :: JSEnv jsval -- ^ the browser
  -> jsval  -- ^ the event
  -> IO () -- ^ returns nothing
eventTargetBlur browser e = do
  opq <- getPropertyAsOpaque browser e "target"
  maybe (pure ()) (\y -> void $ invokeOn0 browser y "blur") opq

-- |Take an event and prevent the default.
eventPreventDefault
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the event
  -> IO () -- ^ returns nothing
eventPreventDefault browser e = void $ invokeOn0 browser e "preventDefault"

-----------

-- | Sets on an element an attribute. See [Element.setAttribute](https://developer.mozilla.org/en-US/docs/Web/API/Element/setAttribute)
elementSetAttribute
  :: JSEnv jsval -- ^ The browser
  -> jsval -- ^ the node
  -> String -- ^ the attribute name
  -> String -- ^ the attribute
  -> IO () -- ^ returns nothing
elementSetAttribute b e k v = do
  _k <- jsValFromString b k
  _v <- jsValFromString b v
  void $ invokeOn2 b e "setAttribute" _k _v

-- | Gets the tag name of an element.  See [Element.tagName](https://developer.mozilla.org/en-US/docs/Web/API/Element/tagName)
elementTagName
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the element
  -> IO (Maybe String) -- ^ Returns the tag name
elementTagName b v = do
  _o <- getPropertyAsOpaque b v "tagName"
  maybe (pure Nothing) (castToString b) _o

-- | Takes a target and an event name and adds a listener. See [EventTarget.addEventListener](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)
eventTargetAddEventListener
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the element
  -> String -- ^ the listener name. note that this should be "click" or "input", not "onclick" nor "oninput"
  -> jsval -- ^ the listener
  -> IO () -- ^ returns nothing
eventTargetAddEventListener b e k v = do
  _k <- jsValFromString b k
  void $ invokeOn2 b e "addEventListener" _k v

-- | Takes a target and an event name and removes a listener. See [EventTarget.removeEventListener](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/removeEventListener)
eventTargetRemoveEventListener
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the element
  -> String -- ^ the listener name. note that this should be "click" or "input", not "onclick" nor "oninput"
  -> jsval -- ^ the listener
  -> IO () -- ^ returns nothing
eventTargetRemoveEventListener b e k v = do
  _k <- jsValFromString b k
  void $ invokeOn2 b e "removeEventListener" _k v

-- | Gets a JavaScript property as a bool, returning @Nothing@ if the object being called is null or undefined or the property cannot be cast to a bool.
getPropertyAsBool
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the object containing the property
  -> String -- ^ the property name
  -> IO (Maybe Bool) -- ^ the response if the property is a bool, else Nothing
getPropertyAsBool b o k = do
  _v <- getPropertyAsOpaque b o k
  maybe (pure Nothing) (castToBool b) _v

-- | Gets a JavaScript property as a double, returning @Nothing@ if the object being called is null or undefined or the property cannot be cast to a double.
getPropertyAsDouble
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the object containing the property
  -> String -- ^ the property name
  -> IO (Maybe Double) -- ^ the response if the property is a double, else Nothing
getPropertyAsDouble b o k = do
  _v <- getPropertyAsOpaque b o k
  maybe (pure Nothing) (castToDouble b) _v

-- | Gets a JavaScript property as an int, returning @Nothing@ if the object being called is null or undefined or the property cannot be cast to an int.
getPropertyAsInt
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the object containing the property
  -> String -- ^ the property name
  -> IO (Maybe Int) -- ^ the response if the property is an int, else Nothing
getPropertyAsInt b o k = do
  _v <- getPropertyAsOpaque b o k
  maybe (pure Nothing) (castToInt b) _v

-- | Gets a JavaScript property as an string, returning @Nothing@ if the object being called is null or undefined.
getPropertyAsString
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the object containing the property
  -> String -- ^ the property name
  -> IO (Maybe String) -- ^ the response
getPropertyAsString b o k = do
  _v <- getPropertyAsOpaque b o k
  maybe (pure Nothing) (castToString b) _v

-- | Takes an element and clicks it. Useful for testing. See [HTMLElement.click](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/click)
htmlElemenetClick :: JSEnv jsval -> jsval -> IO ()
htmlElemenetClick b e = void $ invokeOn0 b e "click"

-- | Logs a string. See [Console.log](https://developer.mozilla.org/en-US/docs/Web/API/Console/log)
consoleLogS :: JSEnv jsval -> String -> IO ()
consoleLogS b s = do
  _s <- jsValFromString b s
  consoleLog b _s

-- | Takes a node and appends a child. See [Node.appendChild](https://developer.mozilla.org/en-US/docs/Web/API/Node/appendChild)
nodeAppendChild
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the node
  -> jsval -- ^ the child to append
  -> IO () -- ^ returns nothing
nodeAppendChild b e v = void $ invokeOn1 b e "appendChild" v

-- | Get the children of a node. See [Node.childNodes](https://developer.mozilla.org/en-US/docs/Web/API/Node/childNodes)
nodeChildNodes
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the node
  -> IO (Maybe [jsval])
nodeChildNodes b v = do
  _cn <- getPropertyAsOpaque b v "childNodes"
  maybe (pure Nothing) (castToArray b) _cn

-- | Inserts a node into an element before another node.  See [Node.insertBefore](https://developer.mozilla.org/en-US/docs/Web/API/Node/insertBefore)
nodeInsertBefore
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the parent element
  -> jsval -- ^ the new node
  -> jsval -- ^ the pre-existing node
  -> IO () -- ^ returns nothing
nodeInsertBefore b e k v = void $ invokeOn2 b e "insertBefore" k v

-- | Removes a child from a parent node.  See [Node.removeChild](https://developer.mozilla.org/en-US/docs/Web/API/Node/removeChild)
nodeRemoveChild
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the parent element
  -> jsval -- ^ the child to remove
  -> IO () -- ^ returns nothing
nodeRemoveChild b e v = void $ invokeOn1 b e "removeChild" v

-- | Gets the text content of a node. See [Node.textContent](https://developer.mozilla.org/en-US/docs/Web/API/Node/textContent)
nodeTextContent
  :: JSEnv jsval -- ^ the browser
  -> jsval -- ^ the node
  -> IO (Maybe String) -- ^ the text content as a string
nodeTextContent b e = do
  _tc <- getPropertyAsOpaque b e "textContent"
  maybe (pure Nothing) (castToString b) _tc

