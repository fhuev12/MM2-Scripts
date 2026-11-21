--[[
  MM2_MurderMystery2_v1  protected build
  Loader: fetch parts -> xor -> lzss -> run
]]
local _XxYWti5={
"https://raw.githubusercontent.com/fhuev12/MM2-Scripts/main/parts/MM2_MurderMystery2_v1.p1.txt",
"https://raw.githubusercontent.com/fhuev12/MM2-Scripts/main/parts/MM2_MurderMystery2_v1.p2.txt",
"https://raw.githubusercontent.com/fhuev12/MM2-Scripts/main/parts/MM2_MurderMystery2_v1.p3.txt"
}
local _oW7J49K={}
for _Z9t5W4z=1,#_XxYWti5 do
  local _URQkl8m=game:HttpGet(_XxYWti5[_Z9t5W4z])
  _oW7J49K[#_oW7J49K+1]=_URQkl8m
end
local _MWaC1sr=table.concat(_oW7J49K):gsub('%s+','')
local _vPWkaTa='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local _ng9nY64={}
for _Z9t5W4z=1,#_vPWkaTa do _ng9nY64[_vPWkaTa:sub(_Z9t5W4z,_Z9t5W4z)]=_Z9t5W4z-1 end
local function _nQcrFd5(_JCFICQZ)
  local _4B8TP64={}
  local _sXKQbxe=#_JCFICQZ
  local _Z9t5W4z=1
  while _Z9t5W4z<=_sXKQbxe do
    local _91q7NFF=_ng9nY64[_JCFICQZ:sub(_Z9t5W4z,_Z9t5W4z)]
    local _flniP3f=_ng9nY64[_JCFICQZ:sub(_Z9t5W4z+1,_Z9t5W4z+1)]
    local _3UyslZ1=_JCFICQZ:sub(_Z9t5W4z+2,_Z9t5W4z+2)
    local _WmFPv1j=_JCFICQZ:sub(_Z9t5W4z+3,_Z9t5W4z+3)
    local _EBKqmPf=(_3UyslZ1=='=') and -1 or _ng9nY64[_3UyslZ1]
    local _0MQByC2=(_WmFPv1j=='=') and -1 or _ng9nY64[_WmFPv1j]
    if not (_91q7NFF and _flniP3f) then break end
    _4B8TP64[#_4B8TP64+1]=string.char(_91q7NFF*4+math.floor(_flniP3f/16))
    if _EBKqmPf and _EBKqmPf>=0 then
      _4B8TP64[#_4B8TP64+1]=string.char((_flniP3f%16)*16+math.floor(_EBKqmPf/4))
      if _0MQByC2 and _0MQByC2>=0 then
        _4B8TP64[#_4B8TP64+1]=string.char((_EBKqmPf%4)*64+_0MQByC2)
      end
    end
    _Z9t5W4z=_Z9t5W4z+4
  end
  return table.concat(_4B8TP64)
end
local _7KHfeKQ='wTVcXhSfGePCqxWAf7qx499MdJLD'
local _OtJM3Ry=bit32
local function _y9tx4xm(_JCFICQZ)
  local _4B8TP64={}
  local _70YUvYg=#_7KHfeKQ
  for _Z9t5W4z=1,#_JCFICQZ do
    _4B8TP64[_Z9t5W4z]=string.char(_OtJM3Ry.bxor(string.byte(_JCFICQZ,_Z9t5W4z),string.byte(_7KHfeKQ,(_Z9t5W4z-1)%_70YUvYg+1)))
  end
  return table.concat(_4B8TP64)
end
local function _jJvVb5I(_JCFICQZ)
  local _4B8TP64={}
  local _Z9t5W4z=1
  local _7Z6gtgk=0
  local _JwpEEy1=0
  while _Z9t5W4z<=#_JCFICQZ do
    if _JwpEEy1==0 then _7Z6gtgk=string.byte(_JCFICQZ,_Z9t5W4z);_Z9t5W4z=_Z9t5W4z+1;_JwpEEy1=8 end
    if _OtJM3Ry.band(_7Z6gtgk,1)==1 then
      local _ObVKqTH=string.byte(_JCFICQZ,_Z9t5W4z)*256+string.byte(_JCFICQZ,_Z9t5W4z+1)
      local _oYjjBUH=string.byte(_JCFICQZ,_Z9t5W4z+2)
      _Z9t5W4z=_Z9t5W4z+3
      local _mO8yuwe=#_4B8TP64-_ObVKqTH
      for _4Wg3e2n=1,_oYjjBUH do _4B8TP64[#_4B8TP64+1]=_4B8TP64[_mO8yuwe+_4Wg3e2n] end
    else
      _4B8TP64[#_4B8TP64+1]=string.sub(_JCFICQZ,_Z9t5W4z,_Z9t5W4z)
      _Z9t5W4z=_Z9t5W4z+1
    end
    _7Z6gtgk=_OtJM3Ry.rshift(_7Z6gtgk,1)
    _JwpEEy1=_JwpEEy1-1
  end
  return table.concat(_4B8TP64)
end
local _8cPokdg=_y9tx4xm(_nQcrFd5(_MWaC1sr))
local _oYjjBUH=_OtJM3Ry.band(string.byte(_8cPokdg,1),255)+_OtJM3Ry.lshift(_OtJM3Ry.band(string.byte(_8cPokdg,2),255),8)+_OtJM3Ry.lshift(_OtJM3Ry.band(string.byte(_8cPokdg,3),255),16)+_OtJM3Ry.lshift(_OtJM3Ry.band(string.byte(_8cPokdg,4),255),24)
local _uUgdxRM=string.sub(_8cPokdg,5,4+_oYjjBUH)
local _9SzuT50=_jJvVb5I(_uUgdxRM)
local _GQgqoB3=(loadstring or load)(_9SzuT50,'@MM2_MurderMystery2_v1')
if not _GQgqoB3 then error('protected payload failed to load') end
_GQgqoB3()
