/*----- PROTECTED REGION ID(GenericSimulatorStateMachine.cpp) ENABLED START -----*/
static const char *RcsId = "$Id: GenericSimulatorStateMachine.cpp,v 1.2 2013-08-08 09:50:40 tappret Exp $";
//=============================================================================
//
// file :        GenericSimulatorStateMachine.cpp
//
// description : State machine file for the GenericSimulator class
//
// project :     GenericSimulator
//
// This file is part of Tango device class.
// 
// Tango is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// Tango is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with Tango.  If not, see <http://www.gnu.org/licenses/>.
// 
// $Author: tappret $
//
// $Revision: 1.2 $
// $Date: 2013-08-08 09:50:40 $
//
// $HeadURL:  $
//
//=============================================================================
//                This file is generated by POGO
//        (Program Obviously used to Generate tango Object)
//=============================================================================

#include <GenericSimulator.h>

/*----- PROTECTED REGION END -----*/	//	GenericSimulator::GenericSimulatorStateMachine.cpp

//================================================================
//  States   |  Description
//================================================================
//  ON       |  
//  OFF      |  
//  FAULT    |  
//  INIT     |  
//  DISABLE  |  
//  UNKNOWN  |  


namespace GenericSimulator_ns
{
//=================================================
//		Attributes Allowed Methods
//=================================================

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_Rocknroll_allowed()
 *	Description : Execution allowed for Rocknroll attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_Rocknroll_allowed(TANGO_UNUSED(Tango::AttReqType type))
{
	//	Not any excluded states for Rocknroll attribute in Write access.
	/*----- PROTECTED REGION ID(GenericSimulator::RocknrollStateAllowed_WRITE) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::RocknrollStateAllowed_WRITE

	//	Not any excluded states for Rocknroll attribute in read access.
	/*----- PROTECTED REGION ID(GenericSimulator::RocknrollStateAllowed_READ) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::RocknrollStateAllowed_READ
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_Frequency_allowed()
 *	Description : Execution allowed for Frequency attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_Frequency_allowed(TANGO_UNUSED(Tango::AttReqType type))
{
	//	Not any excluded states for Frequency attribute in Write access.
	/*----- PROTECTED REGION ID(GenericSimulator::FrequencyStateAllowed_WRITE) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::FrequencyStateAllowed_WRITE

	//	Not any excluded states for Frequency attribute in read access.
	/*----- PROTECTED REGION ID(GenericSimulator::FrequencyStateAllowed_READ) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::FrequencyStateAllowed_READ
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_Value_allowed()
 *	Description : Execution allowed for Value attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_Value_allowed(TANGO_UNUSED(Tango::AttReqType type))
{
	//	Not any excluded states for Value attribute in Write access.
	/*----- PROTECTED REGION ID(GenericSimulator::ValueStateAllowed_WRITE) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::ValueStateAllowed_WRITE

	//	Not any excluded states for Value attribute in read access.
	/*----- PROTECTED REGION ID(GenericSimulator::ValueStateAllowed_READ) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::ValueStateAllowed_READ
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_Position_allowed()
 *	Description : Execution allowed for Position attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_Position_allowed(TANGO_UNUSED(Tango::AttReqType type))
{
	//	Not any excluded states for Position attribute in Write access.
	/*----- PROTECTED REGION ID(GenericSimulator::PositionStateAllowed_WRITE) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::PositionStateAllowed_WRITE

	//	Not any excluded states for Position attribute in read access.
	/*----- PROTECTED REGION ID(GenericSimulator::PositionStateAllowed_READ) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::PositionStateAllowed_READ
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_Current_allowed()
 *	Description : Execution allowed for Current attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_Current_allowed(TANGO_UNUSED(Tango::AttReqType type))
{
	//	Not any excluded states for Current attribute in Write access.
	/*----- PROTECTED REGION ID(GenericSimulator::CurrentStateAllowed_WRITE) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::CurrentStateAllowed_WRITE

	//	Not any excluded states for Current attribute in read access.
	/*----- PROTECTED REGION ID(GenericSimulator::CurrentStateAllowed_READ) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::CurrentStateAllowed_READ
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_Interlocks_allowed()
 *	Description : Execution allowed for Interlocks attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_Interlocks_allowed(TANGO_UNUSED(Tango::AttReqType type))
{

	//	Not any excluded states for Interlocks attribute in read access.
	/*----- PROTECTED REGION ID(GenericSimulator::InterlocksStateAllowed_READ) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::InterlocksStateAllowed_READ
	return true;
}


//=================================================
//		Commands Allowed Methods
//=================================================

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_On_allowed()
 *	Description : Execution allowed for On attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_On_allowed(TANGO_UNUSED(const CORBA::Any &any))
{
	//	Not any excluded states for On command.
	/*----- PROTECTED REGION ID(GenericSimulator::OnStateAllowed) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::OnStateAllowed
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_Off_allowed()
 *	Description : Execution allowed for Off attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_Off_allowed(TANGO_UNUSED(const CORBA::Any &any))
{
	//	Not any excluded states for Off command.
	/*----- PROTECTED REGION ID(GenericSimulator::OffStateAllowed) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::OffStateAllowed
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_Reset_allowed()
 *	Description : Execution allowed for Reset attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_Reset_allowed(TANGO_UNUSED(const CORBA::Any &any))
{
	//	Not any excluded states for Reset command.
	/*----- PROTECTED REGION ID(GenericSimulator::ResetStateAllowed) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::ResetStateAllowed
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_GetInterlockState_allowed()
 *	Description : Execution allowed for GetInterlockState attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_GetInterlockState_allowed(TANGO_UNUSED(const CORBA::Any &any))
{
	//	Not any excluded states for GetInterlockState command.
	/*----- PROTECTED REGION ID(GenericSimulator::GetInterlockStateStateAllowed) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::GetInterlockStateStateAllowed
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_GetInterlockDescription_allowed()
 *	Description : Execution allowed for GetInterlockDescription attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_GetInterlockDescription_allowed(TANGO_UNUSED(const CORBA::Any &any))
{
	//	Not any excluded states for GetInterlockDescription command.
	/*----- PROTECTED REGION ID(GenericSimulator::GetInterlockDescriptionStateAllowed) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::GetInterlockDescriptionStateAllowed
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_SetInterlockState_allowed()
 *	Description : Execution allowed for SetInterlockState attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_SetInterlockState_allowed(TANGO_UNUSED(const CORBA::Any &any))
{
	//	Not any excluded states for SetInterlockState command.
	/*----- PROTECTED REGION ID(GenericSimulator::SetInterlockStateStateAllowed) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::SetInterlockStateStateAllowed
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_StopPolling_allowed()
 *	Description : Execution allowed for StopPolling attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_StopPolling_allowed(TANGO_UNUSED(const CORBA::Any &any))
{
	//	Not any excluded states for StopPolling command.
	/*----- PROTECTED REGION ID(GenericSimulator::StopPollingStateAllowed) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::StopPollingStateAllowed
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_StartPolling_allowed()
 *	Description : Execution allowed for StartPolling attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_StartPolling_allowed(TANGO_UNUSED(const CORBA::Any &any))
{
	//	Not any excluded states for StartPolling command.
	/*----- PROTECTED REGION ID(GenericSimulator::StartPollingStateAllowed) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::StartPollingStateAllowed
	return true;
}

//--------------------------------------------------------
/**
 *	Method      : GenericSimulator::is_changeState_allowed()
 *	Description : Execution allowed for changeState attribute
 */
//--------------------------------------------------------
bool GenericSimulator::is_changeState_allowed(TANGO_UNUSED(const CORBA::Any &any))
{
	//	Not any excluded states for changeState command.
	/*----- PROTECTED REGION ID(GenericSimulator::changeStateStateAllowed) ENABLED START -----*/
	
	/*----- PROTECTED REGION END -----*/	//	GenericSimulator::changeStateStateAllowed
	return true;
}


/*----- PROTECTED REGION ID(GenericSimulator::GenericSimulatorStateAllowed.AdditionalMethods) ENABLED START -----*/

//	Additional Methods

/*----- PROTECTED REGION END -----*/	//	GenericSimulator::GenericSimulatorStateAllowed.AdditionalMethods

}	//	End of namespace
