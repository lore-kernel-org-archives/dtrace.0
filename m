Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520731537C6
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738280608; cv=fail; b=YU1oGOGg0xokvCUtA1BiapFSW+8PNwg417NzB5kgIJdEFqoWfQufCBeIJox/YnR1XsG4OMWDsLPi2wXBF527/FBcXXRcZrIgjv1smGUlm+2fZEGiWlEHLbgYsF+0GN3wREF3cRWJZPAdT3l7fPKzAGJ/MWYk/qFOQzxalvPk7Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738280608; c=relaxed/simple;
	bh=dNA5usNlmujI6mxB1ohNXBYJsXncv+9bD0DcDCENhTg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o8vfqLcFV309RSax8O8W60aMjtAZUKvFYZslpnl+Xo87JC0f0Gpq/ZtQT/Gd1r46GfgRb7EI0Xc1M6cl6u0wugAHKEb3NZVvOUrdxEA1r+OoLYnpe22YIANiZv03870J+v19oKw8gzrvQ9Jk+3LdYtYIuNR31TxSBQcpOLHuXqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bIpUJrQV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O19AfFBP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bIpUJrQV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O19AfFBP"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UNLwJT013190
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=S8BwFflaEkmxM66P7xMyEQurFXmxwHn63V3bWMiERvg=; b=
	bIpUJrQVop3PZxSIGF9Ht7GCmSN/tcR2hpygZZs95b/C+C5YNMoAeEuawrVZ+MyG
	WFnekaKqVrlySrckzvaNZ7EQjwkX9wKTjAheg0F1kIWmiilk4/SIPkkVssyue36W
	GIK5/AEDy5UVSAAEntsx8l1YdIv6p/vcbrvIDfJvmUS+CqQ/loIqopFM0KiAyl5U
	pVB7dZ2lX/Ppn9Oo1DtGKZcGhFHQahuJngAxqKy6S/+0kF05BqeOoMguvlcZCpRQ
	DIjw/kWbfwRTPirXWp9Rvzw9I92iNElWkEWwOzHtyu2SFgOnv09XFdisbmzYtmE1
	8AEtkxRvRCJ9v9aETTEGyw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gk1gr0hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:43:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UNA311016932
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:43:23 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44ggvjn720-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:43:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXv2z9IRn3QVPZhKwrsy1kIQZ5bJkSbI08xVmVm5//IiHquR93raCnGMT9PAJn7VcQ9Q9o8dlnh3x8/FB26FUqUUJ3HMso10pIpuLC+Mto5RTio4HWxuEk5BYazwV65O9fEUcJGwAW6VqKrJeXemf5ATwVFQD3uC6w1iLQNzfrRqyqPEV/g87FSAkqigxcq9PcxSgqtF0MAJvxAvyULZlLCta4ie895oQxfZimbD9WQRGZahBzm9ZmX0L+8czbRCUL3hIEvES0rj/3+DRGupYW9YKy7GLx2UjN6B5lUX0/kUvFs42vErwZmKMCUDk2nwc5H4kn5yW9TDjchlWjAgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8BwFflaEkmxM66P7xMyEQurFXmxwHn63V3bWMiERvg=;
 b=nsU5DNEx58sCzJimCHHZJc3mg/RhO6LIvfrmCAzeIn8PvGeP3Pi+IBqBDCRWpav+ORKHVZdLB9NiJgg7gHBn1uAKMABm9UE7uvmaLanLPaLd926OdX5vtboKrXDfXi+aaQzRyqN22mFsg1SQbqABtTxVqzPfOP1kh5aJl0St2t4mlkB4b6/k1Dt8V+nc3x9/n0kg+2BqArVkC5aVqAMH2QyCojvTSMcFL44vQwE77Ynr89YfGEyWJEb8LRNCC7Q4Utl3ho9S5MSc2JehkC/x8slGQfG3r9VD1oZ1mXgzHLCkFhiRZWO1oRzDr+6oIQsLQE0JvoIO5jkxLWSz1k/Unw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8BwFflaEkmxM66P7xMyEQurFXmxwHn63V3bWMiERvg=;
 b=O19AfFBPbSwyofrD5byRYt0C3pyEHNp3bS21Fys4ehBRXMFiEsWo97VIMt9ngmFWRBiKYRWrlBvOOHPtGnzWiWsR0ZTT7qJxD0f6UvYJCzz6nhOZVXW5Z4RV1/Scan+jWYoFBAh1/5StIlVG+4RE/LVDuXCfWNEgtyoNDTUG/xI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB6399.namprd10.prod.outlook.com (2603:10b6:a03:44b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 23:43:20 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 23:43:20 +0000
Message-ID: <bde7dcb7-380e-dc11-08bb-58c14a6d5230@oracle.com>
Date: Thu, 30 Jan 2025 18:43:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] procfs: populate pr_argc, pr_argv, and pr_envp with
 default values
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <PH8PR10MB633769A4429BE0BA293C8FE0C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <4b5002a1-1c42-9ab1-92f8-3cbb29368de3@oracle.com>
 <Z5wFUtaCwaxo1LpL@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z5wFUtaCwaxo1LpL@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:208:52f::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d478b83-5ea0-417a-102e-08dd4187e08f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3NpcDFxdFo1K3lRN0RtT0Q4L3RxVkpHWUxqN09JVUduTGx2dVZMcUNQbFM4?=
 =?utf-8?B?dVRsNktrMUtkcTNTblM3RTA3QXpZZ0RNeStSSlVSSVJ4RDJWekF2RDhwRk9H?=
 =?utf-8?B?SXlwTXpESjB2a09LREJrbmdnK0pjWmhPT3JWM2JzSTF2ZGVKdFhmRzBLMTBi?=
 =?utf-8?B?RG1PdnNuWEduZUlNZmczZnovR0orY0M0N1d3WGFVMUtLWmlQdTVBNEJ4clVt?=
 =?utf-8?B?eHREOVFlYm9zc2N3ZStSSXRUUFQ3dDNlNTlpK0xXaW1oaHhmTEN4ZUcyTVdz?=
 =?utf-8?B?WnNCcTI0Y3ArMU12TmxYajdYcFgyTEsvdmoybWhzZml1VWFQU1ZkM25HNkpR?=
 =?utf-8?B?enl1QTdQcWVpNnRMc3BhV0loUGZuaXU1ZnRqdnBZZURnRXpRb0NCSjR3L09j?=
 =?utf-8?B?RWoxUTArc2lNRHZpd2NkY081bzgrV3dJN040VXBVcm5CdUtPUXpCbnc2b1RL?=
 =?utf-8?B?TUcrS2tPNjlTOXNUb0dWRHpFY1UybXNMdGpEMWZUR3NpSGM1TUVoT2ZMRlhk?=
 =?utf-8?B?Y0NncVZBVkNaallKeGc0WEtIeWpPcjdYNzJhSFlVeHFCVS9HL0JtR3g2aGtW?=
 =?utf-8?B?NkUvM3loaXRmR2hLcHlHNEQ4RXUxbUg2bDdlVFZsUjBWZjkzZ1pNdGhkM1J2?=
 =?utf-8?B?Q0ViK2ZFRURJNFlDLzcyZE16YmduZmdSNkpNcXpmMTI5TUc0UWlCT3BzV3dS?=
 =?utf-8?B?UzQzaHdlTHc5cTN5R1liMS9GNVpId2ltUW1BOGhLaUN6OUZZVE1rejYwT0pv?=
 =?utf-8?B?cmhEclhOQXROejRFc1BaYUd4M2RCWTZBT2F5cHJPVmlxa1pzMXpnQXNkVXJk?=
 =?utf-8?B?UHl4MjRCRmlpUlVDRklvd0JVSGVvS2gwZ1g4YnQ0YU02MStiY21OZ0l1S2JQ?=
 =?utf-8?B?S3NBcmFteXZaUjdNeklxcnZuSGNXZDhyMlFyZ25BZmlST0ZEc3grM2pSYWxN?=
 =?utf-8?B?anNxemg2b2YyLzExc0lxbUtxODdROGdNbWFHZUxaZHBFeDVYc2llTUk5S3h3?=
 =?utf-8?B?eXZrSUl1bE83aDVpOHlwWVozY0ZvNGN2WlRqTXlEcFVOR2IwdW9nTXp5YlA5?=
 =?utf-8?B?Rkg1N3R5RUlSWFFER0lhWFZ6cVVOWlBEQ3BhTndjS3ZxYW8rN1RTWTh1WlR4?=
 =?utf-8?B?Q216UlliVVJZVWo3VnBWQ0JsN013VGNkUXIvYURET2NDTXZRd3JjbTNXM3Qr?=
 =?utf-8?B?cHYrVzBMQkRHampVSHFaOUhOWFk5azM5enp2STdHUWRuWGJ5cnFiTVBsSjly?=
 =?utf-8?B?RFVldkVlNm0vTWVpTUtHby8vcVAyQVk3bGFUQ1p2d2lLSUk2Q0dHUnVtbWcr?=
 =?utf-8?B?SnBjSWtvWUxFREhBNmlteXdwaUl3VHU0WXB6aldjTit2Y2RGVEx2emkvRVpz?=
 =?utf-8?B?dEtydkNEWjB2bTlMQTcxR2RQRTZWMmZxN2Y5NWJtTVg0enZydVVwQThra1ZE?=
 =?utf-8?B?bmR3UjhPZnpKekpKQnpDNTNuWUZGMlRZZzJLN0ZwL1YwUUM5ZnE5UHNTZHQ1?=
 =?utf-8?B?c09LVnRnYUpITElQUE91dk9ick14UW4vYjNjUy9FRHgrM0U5VGwxeVdzMmJj?=
 =?utf-8?B?VG9PaGdTUTFxaWNUNytDOHJrbzBteDFMb29FU25iUkFYNGlQRFVmVGtpVVBT?=
 =?utf-8?B?c1RQZFdIVlhlRzNaWlQ0UHR2UUQ2L0RYbk14Qk41dkRrcXUxWlZ1VUFOYVh3?=
 =?utf-8?B?TmcvVVZZR3E0dXIvY3pHRU5sTnk3cjM0MEJFQjFXTCtidGU2V1p1MWllTWY5?=
 =?utf-8?B?bTZQRU03SEl4VER0SWhWWmd0TDdMSkVjUXYyOHhkN3gyNjBBRUE2VVdPelZu?=
 =?utf-8?B?UXM4N0xVVUxlZi9IY28zMTR2V2JucTFvV2V6RTNzZm9xZXlrOGxXcUhpVmxa?=
 =?utf-8?Q?M2VxYlx6qkrJq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFVQNXh0bXY4UWRMOHBkekZrMmdYc09rMXZBQmZlZEFWY1RtdEZucFRHN1dp?=
 =?utf-8?B?RXNwRFpVbVUvaGNYOGV1S2Q1b1Y2cndJemphVGJNc3Vra01KSk80UWVEMXAw?=
 =?utf-8?B?a0FESDVjQ0dRZDl4TVVLZ0s1TVdaZm1PcyszTUJqSWNWTUlqeGt5MHVLd0hC?=
 =?utf-8?B?dlg0SFJseUhIQmJiZHZidFR3UWkxZUVqK1dKdXp6b2daRXNvSGFBRGpzbjEy?=
 =?utf-8?B?dEpnZlM0WnFHb09Yditxa2tlQS9mTmZoa0ZJQ1ZmWFQ1aTRaQm5kcU1MRldI?=
 =?utf-8?B?UXBZZ1IrOGFDSGtMYW94SEE1cDNGbHIzRm96N0FaaXduY0M3MVV0bFU2Mm43?=
 =?utf-8?B?M2RHYXZaV3hTd29kY2RtZTZzWjVzMktmdnNUditROG54M1BVd1FmbFNuWHYw?=
 =?utf-8?B?SzE2QTQ3YkoyMFFHVHJ4Z3VRdktYWkxxekVBRzdLUmNkQVRISWcxVjBiaFhH?=
 =?utf-8?B?bnR6dUNyQmVIL0JEa0xacE5DeHJrRlYwUHV0WWMrY2FhZEdGRzBveU9qRUxC?=
 =?utf-8?B?SHVWNFd2VVJqeTBUVE1zVHNSUHpwN05OVVhBM1phN2lmdmUzc05KUFRVM2ta?=
 =?utf-8?B?dVFOQmdyUmxSUjlsTmlTejJiRHV4UHN1cmlUbjhacWd5N3FzTThacTg4bmI2?=
 =?utf-8?B?akE0WGRGTGpPeVlaSWt5dE5tdmxXTFFIbG1tdUFmZVlXeWpmcUNhM3J5YVoz?=
 =?utf-8?B?M3JLa2tMaGFubDV2QWVHY1BpODRia3FzUCt1anVhMHRVcEhmRm5SL29wRnUz?=
 =?utf-8?B?UVRCYUhnSG5VNnVDL01yK0JRdjBXQ293d3FqRjJZc2tsRFc4ODFXSUYzazFh?=
 =?utf-8?B?MytWdFpnOGdZa0Jpd3JUQXJNVVYxTEFTYnZPZXoveVJFTGFpcTg5cVkxRFQ3?=
 =?utf-8?B?MW14Sm5OMkhmUjdKMnIvNURYd2k1MHlCb055VnZscTh6MFpXK3FmQ2pFMEpJ?=
 =?utf-8?B?ZTkwMEgzU1ZycDlWSnZEVkphUGhvdkdaTjNHQ0NrcVhPcytINEU0c1ZsM3Fu?=
 =?utf-8?B?L3g5T2RDbDBlcnFENzErZzQwQ1praWh5YTNRazY3VTYzTkJUY2JCREdaTHcv?=
 =?utf-8?B?am9qMnpXNUxNTkJqZll4UG9oN3N5dTRCU1FlR1J4UkliUjBuSVZES1BLTUJh?=
 =?utf-8?B?Qy9GUzZVbUNiaUZlUmE2dDlCYUdrZ1hLdlpZZk04K2xuZzlEM3RtSVBWVGhi?=
 =?utf-8?B?VWpPS05iK0FpeUtHY0QrUVRlZTN3YWRZVzhSYlprNUFheEJaRnNsVEFuUVox?=
 =?utf-8?B?MG9GdnphTnNVVXVCL1RHZVc0R1hHZ0tTUjN4QWR1aXRQWDhMN2dXVU5VSEdk?=
 =?utf-8?B?REZmK05pVWI0RmxuaElIU3lpby9OMVRESFkzOTNuQlNiTXFiMHBPTHEvOG85?=
 =?utf-8?B?K1VFWHN6TEE3Vyt0WThOQlk1eENTTHpvRmxkSDI0UnhCa003YjhiZFVoWjNk?=
 =?utf-8?B?dDRxWmo1S2FNR0lBSVYrUkNERGpIeTlld1F6MlZxbGM0QzFrbGo3eFdBN1kz?=
 =?utf-8?B?eWVDSG1mZ0NZNHdKbE5wNXVqb0trU0tJeDFmMEhZVGVvaVh6blpwUmhjYXdR?=
 =?utf-8?B?R1VmWEhNaGErdFBON1prSjQ1dHJnQnd1UURkMktHSWZBTERLQjBzcU1uS3BE?=
 =?utf-8?B?a3JXN2tCaUxLVTZMVnByZ05vNm12MjFrMmxuaEQrWUFONGhjOWJqTXJEOTVO?=
 =?utf-8?B?S3dSRktVQUVjaHhsNDY0MGZHUERWOG96K3hmRnNweUNvVDN5ekc1enIvZXVv?=
 =?utf-8?B?aThIOC9iM2pyTXdCRCt1NWVpTC9zN2xtbVRyVjBRdHgzNlQrOHRnRjQyWXly?=
 =?utf-8?B?djM3a0Fmd0g4WUE4aHErZmFuaEl2cWNMRVZjMHIrWkttODJMNmNHUG5LQWpX?=
 =?utf-8?B?UXRVNHJwTytFMnFyaXhoTjVsK0g5dkJSaHh6SkFYS2NEWWMzZlJqNFBockEr?=
 =?utf-8?B?NGN0NFdScVEwMjdCOHhuUGVrOHYxcUpSWXdIWng4QVE0N1lnMWVsZEtTT1VW?=
 =?utf-8?B?ZFJENEVLMnRlcUxKVnVIL2xqQldNaGpSZVVSbDRYenJxQ2laQjVFRGpjRzEz?=
 =?utf-8?B?RzJNQndWcXZmeHZNS042c1B1QkdTTkZkemE0eUFaZTh1S0VZTDZxRitHZDhW?=
 =?utf-8?Q?M4haVxcM1scYgKG37yVxV+uWR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/nH+jpCorI49Mc9T+fp3LMCnQ+b/wcsgIGjPSM+uVhvDmxf0Wwih4FIoryPWkb/34iwIqNdEn06jfqicqGG/kU4vDswG4IhvMRjOU34dhvBWj2C7ScJjo+r2YmY1NTPvPub4J1kcuj4utcIg7shei0qrSiA4JZkBKYRmIKUicgemKOnyleaRB3D+qhAF5A5R/WYk0akRlfvr/Av0rTzT8ztsQB4zEMvhhcp/FtJJ2CEDPXT7ESnREu8dWJSMumIl+nJxmfEdJ4uEYwTXJTJuuOXM/dsMYiMZCwHQPrZZs0Ry5uWqJ7Cc5oznvQRi3/X1MGnbbcguQOZLEfZ+1WHQQ1fds4ZN4j26e1DQlTwIXR6YMKixjhBoSmok0hS2b5bijRp2uTe0LZ/k0r2Z3dzEubSNfswiuOcctSpKNH4220DWPkoxBiH2nim8jABiLBoJcRXRI68G7eeqzzCqfgjvQsVNXgQILgYzkgE5GxiMkDHAkGwLzhVGDUYazEmma6yyQZnEUFGhNmRzhfr9hl8qISsGTWY3IRqTd1V3IRRW8FvpAuW/619dLAwEiPx1yCQ7mdZ5P1S4vt0qtrSlc/nsK84wysD3mprG175JGhVjUeM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d478b83-5ea0-417a-102e-08dd4187e08f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 23:43:20.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7p3Iyms/Ugp8zqSKs2iP837oVVKOpbirgPM1yh0GMrW3ex2o0ntqSPHZqv9shYfhHP//W4RTAOkAoh8ZbdZ5PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6399
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_10,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501300184
X-Proofpoint-ORIG-GUID: oPyXymwo4wgS6ixCr3tX6Fzt-eSu7L5V
X-Proofpoint-GUID: oPyXymwo4wgS6ixCr3tX6Fzt-eSu7L5V

On 1/30/25 18:03, Kris Van Hees wrote:

> On Thu, Jan 30, 2025 at 05:33:45PM -0500, Eugene Loh wrote:
>> My main question is how it is better to provide incorrect results than it is
>> not to have implemented this functionality?  How about just waiting until we
>> implement this functionality?  Isn't it better that a user is told that we
>> haven't implemented this stuff rather than give them results that are
>> incorrect?
> That is always a balance.  Ideally, we should have tests for each independent
> member of each translator, so that we can do more fine grained testing.  But
> it is not sensible that we do not end up testing any translator members because
> some are not implemented, whereas providing a default value for them (which we
> e.g. also do for members in the io translators).  That is the precedent I am
> depending on here.

 From the user's point of view, the choice is between:

*)  the status quo, where an attempt to use one of the unimplemented 
fields returns a rather nice error message that indicates what the 
problem is

*)  the proposed patch, where we "silently" return incorrect values, 
leaving the user with incorrect results or wasting time debugging the 
problem, filing a bug, etc.

So, there is hardly a balance here at all for users:  the status quo is 
far better.

 From our test suite's point of view, there is a choice between less 
coverage (some tests XFAIL) and "more coverage", but I question that 
characterization since the "more coverage" case still doesn't check the 
correctness of the output.  Anyhow, to the extent that this is a 
test-suite issue, let's fix it in the test suite instead of polluting 
user-visible behavior.  Let's not "game the test suite" by modifying 
dtrace.  The whole set of tst.psinfo*.d tests are in need of overhaul;  
so let's improve test coverage by cleaning up the tests rather than 
feeding users incorrect results.

If you'd like me to take a stab at cleaning up tst.psinfo*.d, let me know.

>> It is odd that XFAIL is being lifted when we are producing incorrect output,
>> but I suppose that is the burden of some other test/s.  So, okay.
> Yes, we need more fine grained tests.

FWIW, test/unittest/builtinvar/tst.psinfo.d would also XPASS with this 
patch.

>> On 1/28/25 01:31, Kris Van Hees wrote:
>>> The pr_argc, pr_argv, and pr_envp fields in psinfo are not implemented
>>> yet, so it makes sense to set them to 0 rather than not providing any
>>> translator for them.
