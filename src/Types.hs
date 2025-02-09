{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric, DuplicateRecordFields #-}

module Types where

import Data.Aeson
import GHC.Generics
import qualified Data.HashMap.Strict as HM
import Control.Exception

data DocumentData = DocumentData
  { documentContents :: String
  }
  deriving (Generic, ToJSON, FromJSON)

data DocData = DocData
  { document_data :: String
  }
  deriving (Generic, ToJSON, FromJSON)

data FormatedDocData = FormatedDocData
  { doc :: String
  }
  deriving (Generic, ToJSON, FromJSON)

data DocumentSplitData = DocumentSplitData
  { contents :: [String]
  }
  deriving (Generic, ToJSON, FromJSON)

data Message = Message
  { role :: String
  , content :: String
  } deriving (Show, Generic)

data LLMRequestBody = LLMRequestBody
  { messages :: [Message]
  , max_tokens :: Int
  , temperature :: Double
  , frequency_penalty :: Double
  , presence_penalty :: Double
  , top_p :: Double
  , stop :: Maybe String
  } deriving (Show, Generic)

instance ToJSON Message
instance ToJSON LLMRequestBody

data Choice = Choice
  { message :: MessageContent
  } deriving (Show, Generic)

data MessageContent = MessageContent
  { content :: String
  } deriving (Show, Generic)

data ResponseBody = ResponseBody
  { choices :: [Choice]
  } deriving (Show, Generic)

instance FromJSON Choice
instance FromJSON MessageContent
instance FromJSON ResponseBody

data CodeInput = CodeInput
  { inputs :: [String]
  , output :: String
  , document_data :: String
  , module_name :: Maybe String
  }
  deriving (Generic, ToJSON, FromJSON, Show)

data CodeOutput = CodeOutput
  { code :: String
  , hallucinated_functions :: [String]
  , hallucinations_functions_score :: Float
  , hallucinations_types_score :: Float
  , hallucinated_functions_options :: HM.HashMap String [String]
  }
  deriving (Generic, ToJSON, FromJSON, Show)

data ErrorResponse = ErrorResponse
  { responseCode :: Int
  , responseMessage :: String
  }
  deriving (Generic, ToJSON, FromJSON, Show)
instance Exception ErrorResponse

data FlowInput = FlowInput
  { inputType :: [String]
  , accDetailsType :: String
  , gatewayName :: String
  , gatewayReqType :: String
  , gatewayRespType :: String
  }
  deriving (Generic, ToJSON, FromJSON, Show)

data FlowOutput = FlowOutput
  { instances :: String
  }
  deriving (Generic, ToJSON, FromJSON, Show)
