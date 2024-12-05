Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ABC1E522
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 22:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733439496; cv=fail; b=hWcGr6HATjTslUoosVYdPWH6Gvw+tJ71MLontAGCGxtKjAifaq+Lu4IJIHpw9sxMC8I1rxJ6FF+UNDC+7WOhHzxluHz2UjWA1PyJTP073IZBKsN+03SpAB2d63Ke0o9eyV2GtGBceyF3qhTIteshmmxWRFyrco05lLp/Wi9iL+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733439496; c=relaxed/simple;
	bh=SbFzi5BWcSLd5ond0lRvNLEeV1CXKDUa7Q+8WKnrNoA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AiGiRIQqm6Qtm2DXIF5FT+k8MaFN+j0ROZ7F1KPT6RD6iiuNXRIRMI5TXM+qQCohWff+TjZFKYtg27bgRvdAdtdjP6GZ/4iBzJeSdmYZpIDuMpkw8khX7yD7BcpdWYQ4D86NS+Q85sA4u+TscfaQHYMMvF4Dqss2qYulfRjvu6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jQYWs775; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fh8bZkqo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jQYWs775";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fh8bZkqo"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5LNW3Z001745
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 22:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=QY/tuLc4zUURd6b9kmOSwV/Bvgi3b4p4Vay8C2uy0FQ=; b=
	jQYWs775kbKhjSFAGAu0H+xKjyXdR0zr0rWsbeJg/mdfmYaAoKq81U+PXgImh4ZD
	WicKw1dNMzpN2N34zHrh+60xaF3J+VOEfl3uCrrh7bqHUNSFPuyxhhmTznRrMgVF
	SzQ4DiFj4iKWHtoI8qknlC6+M7gho0gaNYK+34+YmSrZ/S2NBtFQE4SSEbe/+l+1
	0VMPPtc/eWr2LuOgy4+q0OYJz5UkjYnpIOmq55khDADqq6HQCblISm5VO7Sg5nlL
	dwr3yE7JuBVMkOqr7O79zYhbN16PMQ81gCfXUCJoSCE9XFMjk4BLn9DSPVac0Fb+
	Y8WLCF7LPwe/HFsNhI/7Dg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437trbvdbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 22:58:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5ML0Go011632
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 22:58:12 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437s5bj9h0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 22:58:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9yshwMK8bX6JP4dcx/QPlwKw5AXCvhMZUyOkO15nQ2Zj8nUKsUyl0dHC6beNJtMgVm9tQu5x4n1b/wxaD9bfW0JdzMmU5t8/oFtNnNSXzmk0N93iIund19SJg4J5XBM3EsHNTzq9zuqVsPI6bhLlU39hl4c+mxBYDYZ1e2YoQbBUMSyYIXC5Bo4pP8Q6aPVSj61Pr4MQmedtyNIHo1ruJMLz99kf7eqkJlc66Xj/DiK3kZK7txtVPfaNtc0Y1UnBGo5iwTmI9ZF2kYu+PnlJRADxkvZNVZh/2gMqaSWsxQo+JLye+pYU39wAjiW9e3ZPmyu5396qBOHmH0IuUaayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY/tuLc4zUURd6b9kmOSwV/Bvgi3b4p4Vay8C2uy0FQ=;
 b=B5qfil4/9OejtbRpI3b95V3wgG3h7wS0g6OqrAaTDmltI46wKQ4kKpOEUCQKHjLNLF43a2JCYbIUn1PS0lC/gC/7RCrBtZImOUKGlha/EqyWyTbOI0ZBWH/gmfhUlIE2krTCRNcPO1ko484JI/Pp3Pv9HToclLZyv3QVisqJitDoyHT+Lcfni3T/PsMiCh6+wMRvhI2raFMfMMkPAGwGD3r8kUX+o/UlsKWgzCTbh65Rm/0CXJ675gKrwW32WvrO/fsOVO1gdkF1aNBMtozrYn/De2Cfm06YyrOwx2K3v4i4eBg8c26Y2x22EU3WiUXK8SfuAKgntpM31OkeRJ+0gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY/tuLc4zUURd6b9kmOSwV/Bvgi3b4p4Vay8C2uy0FQ=;
 b=Fh8bZkqoktV67Pwf1hnAcwt9rDmWIVIZWyiShq+tNyBh3D3VLoOu3MedbhF5fmiF7o58TkK/l89UE92joDNJFnsUywV8pymKjxqrD2u7DRSm3CmMRxj6PpHVs34lVHVc0xDmH43DlFTSzf2raquTs8ZWsPUQPsxTHLlXiBuHpr8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV3PR10MB8155.namprd10.prod.outlook.com (2603:10b6:408:28f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Thu, 5 Dec
 2024 22:58:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 22:58:09 +0000
Message-ID: <b7c1fd43-d7e8-37b2-649f-609c54db40c9@oracle.com>
Date: Thu, 5 Dec 2024 17:58:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 2/4] fbt: clean up fprobe/kprobe support
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
References: <PH8SPRMB0037647B2AD6DBEFE5E31417C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
 <6efebe82-1f0e-2fce-3c78-cb734be36273@oracle.com>
 <Z1Imc8J6z85i1gEU@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z1Imc8J6z85i1gEU@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV3PR10MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5d54dd-4e80-4018-a27d-08dd158049b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qnd3b3BtSCtwaUE5VitpcEVlMVJNdURiQjVhci9tVXEyYmVkVithWHR3SnJJ?=
 =?utf-8?B?UFhxdmt5ck16emVyMTQ0QXgrcEhsVnNNTkZCYTk3eTdIdm9xdm9sbzJ0U2Qy?=
 =?utf-8?B?aGI2d2duOC9neC9IcjgyQTZTSmNpLzNiaGx4VEpyMFRLZlZSc0kxSzZvbTJH?=
 =?utf-8?B?TmwrT2xkVnp4QmhSOVBZMGtkYnh1RmZ0bW1WdXRYR3I1bnN1NVdqTWR5ZGs2?=
 =?utf-8?B?K3BrbWo5b3ZCK3F1ZGJmMGJxakp1TjUzSlBpa05TUDBoekh2TlNtblJLOGNX?=
 =?utf-8?B?c2twODA4N1o2VFM5UGt4NDBTNnFndHZKN1h5cEJjL05lQmppWWtBQXRLWHdo?=
 =?utf-8?B?eGZOelNibjVUTE05cWJGcE9KbTAySTI2ajBGcEpnZWozVFJML0NhbFprNUlv?=
 =?utf-8?B?TUVUQWJ2aTg0ME1aeHRxRW5ReEsyZ1E3QjRnZ3NlUkZQOCtZWFUrQmFiMVJx?=
 =?utf-8?B?ZDQvM3Y5ZjZQRzRSL09sRlBmTGxMREhma1BZWi84d3ZsM2RXRzN3NFJnUGlG?=
 =?utf-8?B?MEhKVDRkcXduKzBZb0l1eitjbXJUZjBmeDA2OFlhMFgvZ2tQL1NyZ0FydWVE?=
 =?utf-8?B?OEhtSlhkeExKZnlGOHlyUXUvZityM1JzaTVYdGp0TlpOaDBVTmN2ditlV2Zh?=
 =?utf-8?B?ZGFESkF0bXVNSzBrb2xBQURQTW1MZnovd1pGcEtYL3Fza3hjV3NSei9EQjZE?=
 =?utf-8?B?TEVpY2p2cksrR3YwRHNXTXJ5VzNuUURBckt0MlpEdG91TlIrNThGdzgxK2RU?=
 =?utf-8?B?Qk5NeitEZlFRZHFFbzRGMGpteHdoOFJaWHkvVWtMTnhiczZ2SkhRRlVHL2Yx?=
 =?utf-8?B?Z3ZWTzVxZnVmMWJYbFZpSU1kMWtzNTg1WFQxcFlyYUcxOWVmVEV0SjEzV0RQ?=
 =?utf-8?B?cENMM05KR3hnV1gzTzg0YWZiSTRjQjRleVdnR2RhUmdxTjN5K0I1TXBuc2xr?=
 =?utf-8?B?SEJoTFNlTWR1azhXaC9XV3YrQlI5eWxKTEpJMHZkNGFweEtMRnVLblJHWUhi?=
 =?utf-8?B?QitMNmhiMGFvM0pQTEZJb0VHYjVLZUZxOWswa1J4VXlTMzhrOFU3SFVFcVd5?=
 =?utf-8?B?YS82bWZ5U1ZVeElFYnRpVWZYdGFSMCtiSDdNbmNjd3VXaWZ6YnEvRGZ6WlBX?=
 =?utf-8?B?eW9TNzJ2VnRFbC9GQnVRZllKQ21pT1hsM2JaNjFqUjlaOFV0R1QzZm1IVUl1?=
 =?utf-8?B?bGR3NmtyamgyUXRDL0dSQjZha0twaHVQaVBsQjVOZkxESDJYVXhyV2pOb0xx?=
 =?utf-8?B?ejcwUEVRNnhKeWZtY1ZhM1NKM0Z2S3cvancxdkNFb0xyNi9aRkpoZlVtOU1D?=
 =?utf-8?B?d3pTR3dGcVd1Z3lTVCtsY0MrU1l5ZllXYng1NnU4QjVTUnViWW9DVmk3eEFJ?=
 =?utf-8?B?eUwwQmI1R2JBOEdMR1dKWGZZV09hQmNwTXlDOHMvR1RWNUFEd1Z1WkxpV1hk?=
 =?utf-8?B?RUtUNzBpUzVONitybDYxZkxLZHFpQSt0cFc4UDNCMXlqV2RYZ2NjeDlvVEhR?=
 =?utf-8?B?YnZ2NG5BWWMwdkhXSHRIUlVHTkd0a0NsUUFDSEdKMVJtb1JyeTBvUFJZR2FW?=
 =?utf-8?B?Y2JKKzlWWWQ5WGZMcVdvVkZLa0VqeFV4N0Mrc1NVMUUyTjRLdE1SQ1Ztc3M0?=
 =?utf-8?B?SFlUQ0pCdk9XZXdVQ2REbzc0Qm51ckd4K2NTMGNsWWpreENTMExWOTJ6OHEy?=
 =?utf-8?B?T2pVT0l3QkpIejJqODE5Nm45WXdaLzMvU3pwVS92cHg2eFl3THFYeTZCUlFG?=
 =?utf-8?B?YUM5U1dZWGpHakduNkdHZk9YSktzYzluZWFMTDJ6bG9JMDhqOEhScExRMGgy?=
 =?utf-8?B?R0w4dHhTR1UwMlovYkI4dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGxORytmbFVxVlIxRHR6czA1TzBPUXlJV3IzZ2tqZVJxbytBeUgzWXZvRHRR?=
 =?utf-8?B?MEcvSGdpdmJRYThUT1N2b24rSkt4U3NYZC9uMmgvZ2VrUitsckNIdndHa1pt?=
 =?utf-8?B?Z3MvZm9TYmx1bHZNYnpFaVRKVVY1aXZEUm8xakJhVHdLQkJQVWtMbjZQUjBM?=
 =?utf-8?B?Y0ZrKzE5WUdmNHpHMGVRTXVtWk5CMG0zWWtON1lBM0RoS09TQVFzR3kyOW5t?=
 =?utf-8?B?eUxzU1B3Wk1Wd1VEZTBzemEyUzdMSFY4bUovbmlmay9CNFlxanRYeXVXajJs?=
 =?utf-8?B?RHE0QkFqeWtoMXpzZmQ2NWcyNjJQVnNicnMvcjgxSjgrMXFuMmlTMXhHREtG?=
 =?utf-8?B?R2FhSk44OGNIZDR2Q2pDTUNKOEY0ZHlDb1ptV1JFNjNLWVNvSmluSGhpL3Mv?=
 =?utf-8?B?ZlJiR0M3WlFLeVU4QktrYXhFTE9ETzdBL2IyRjE0MHlrOEI5eTd3MnU1d1Nh?=
 =?utf-8?B?Ti81Wm5QdldldXZEaVZoaGFrSnhyZ1UrRmVtcWwyNHdTM1NGZC9DaHc5MWF4?=
 =?utf-8?B?cktzRnYxQXRNWFM1UlFnbXlpdjVwWWtQRGdSdUtOWXB3TGRPcUhtaTBHK0g3?=
 =?utf-8?B?clVXcVJZSUJDV21LeE1PMmtCR2d2OGNaakZIeDMyV3RUeDhtNjFEcHhiV3lE?=
 =?utf-8?B?UGwxQ0pFem9tbVhyMnRKVnhTc2ZyRkNoY1JFdDIwbGVTMERpdWNzMHQyTUJi?=
 =?utf-8?B?TUgzT0pTTTVNL3pUdHYvWnRwcGxtb1lnZG51dDNPU0t2OVlNdmx1UDhYbUZH?=
 =?utf-8?B?NStCVGVMQjYvRWFvb3JySjJxUjBxWlIzbFZaNmRTamNKV3V1eVhRWWhuNHQr?=
 =?utf-8?B?em5keEovT3RvR3BxcmNnYXg3SmZGamtHU29SRlJ0c1QvS2RDR2Nubys4MmtY?=
 =?utf-8?B?SXRGZ0VicGtCRElobjZOMHBvWCtabUFRcnBpanpuREc3dUhjeUwxL3J4eHI2?=
 =?utf-8?B?ZFVjUzNSNWkxd0N0VmE2NGVYV0JJRys4NCtmamIrdm44UzVkRVlsYTdKVGkv?=
 =?utf-8?B?UysxY1ovbUs5SnBrT2tFeExCdlFTdUtBcGF0aFBKWDMrYzhKbGpITDNFb2Zi?=
 =?utf-8?B?YTl5YThsWlNVTDZIV2RjL3VnTHZIWG1qci9zK3JpdkhTVUlVRVhJZjF3dXpB?=
 =?utf-8?B?b0Q2Yk1sVXdTRlNJMHdKZjllT1hpSk14Z2Vic0hXc3dCRzZkZVlhYmpGZG92?=
 =?utf-8?B?dXhDSmJwNDR6anpOSFdjQW9PU09yNkZPU2RjR2c4c29QVmxVd3E2eU5MWjlw?=
 =?utf-8?B?WHJEUzVIcXI1a2h1K0VYV3ZyTXNJS0I2ZisvdGorSXQ3SWN2aXBGQS91a25D?=
 =?utf-8?B?dWRYWGtaOHlZV3RKQ3p4RnBPR2VmVnVHUVh0OEg1Qnl0SWx0RldsNUk4UXEy?=
 =?utf-8?B?SjIwelR5SGNsU2lXanZMMEp4RU1YNHJtZG1NSGJ0R1lWZStlQy93TGxvUEU1?=
 =?utf-8?B?bVNVK0ZxSVNTUGxCTDNBaWZEU2thRTBiN3NCTnpNb1lDVVE1NFYrK3VxK0R4?=
 =?utf-8?B?eDlWMlpDWTNOQS9NeHZmSEVHTWUybFp4U3BtVWpNa3dra3h5c1BUbSs4bmFD?=
 =?utf-8?B?ZlZrdnM3eXNBdzhjbHRTNHhSVG5hZGdPTFJ0NWJDYXlDMDFuKy84WHhua1RM?=
 =?utf-8?B?NVQ2dXA3UmFYUXZpYVhIYVg3QnNXci9sbzc1dk44c2dnTjhhU0xLbjZBRGhh?=
 =?utf-8?B?bjA2a1lBQXR4R2hrOU44YXMyMnF0S0FBMFI3L2lBYXJrTGNtVVhINkMxUEU0?=
 =?utf-8?B?ajNxeVlyM05CcFppanpJZjlQcTF0RTNnUjdzd2ttQjNtU0t3ZjF0NXhXai9X?=
 =?utf-8?B?ZFQzMWN0aWRJVkY5MEc3NWZXc2hyVGV0eGZwcFdqOSt0ajB1cXl0OVdkcUQw?=
 =?utf-8?B?SHFLejlUbHdTUkRJTFpoYUtUUWNkQW1WSWhaR0NxUTh2ZU1QaVhSd3h1Qy9y?=
 =?utf-8?B?NWhyYXEvTGFEa1cxWVMxUHhIdHJPcE5DTis0Y1dCaEk2RVBFQUw0MWhzREln?=
 =?utf-8?B?OFhoN0NEZUxZSjVVdXFvZE9kbHdGR2Y4MVd5ZzlHdlB5bzJqTFdRMDhhYUdv?=
 =?utf-8?B?cU1EWWloUksxWnA1cktLWndQcFovZ2JvU3NRclhYcmEvdDhzVmVFYlROd2h2?=
 =?utf-8?Q?dlbK40PkUCUg5vKM5Nnyj1YEl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EW9ch7miJiTwRWYpVgqgujVBG0qLY+A5lQ9iBX93+DGOt3bwvYZ/AmCC8Z1N3ZOcRymXeaOoj7aZXzRk0PTedTDQBTjBeSyxb9e+t29TmJsSRDBPG0EujOAvUiuY8HHp6d0D9A16w8LNBy3K9r5x4yGOgWeus3xX12DIkn68REjNFLsms3yGZkM5MD3vushewG0vW1+oBGAOvHm0FIc+yYkYaNu6KIK5BopwE16FMdYS5+sg2Xj5LFtshlX7o3+vxoi60AIR+XjxScujvIlrvyttIadbKOve3EeN6oHUUnkZpCl0HPJsAmxDMEEItPlJxKWDbqboPW/vSbS1WAcBiLcPHmcEgrCwO49YNkKr+64cj1/loMVvLpMIu1AH6ir31+dciY/9fJzT/dEzzxPX20gZ33IIKM2tXjLPByXY4Kc2+vdqDIC3ebt+pjVm3lrLh2b9uWyfgCLRtp0QiymZgt/l6r0UMWSTAFIVHZsrprPe7XYqQc0fF+9KSlPTjHTqQ1X6d7rOcbwCep5A+oy8++ZB244nBDUOZfrsm6+VFAjyTQ3oe3r1bAsgY4YWziYOKrT4g4xnWN6/qMxGVvE19qWe4AubCiSozkaNTC2bhFI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5d54dd-4e80-4018-a27d-08dd158049b4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 22:58:09.6087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hq5FPWdWW4WX8VS2VxgJLhnzb+mYB+KRJz5UIVtPaV9V0BWvTbUNDvAzJx6B+PK6cMIqD6bauTNNIcbhUPCzXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8155
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_16,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050171
X-Proofpoint-GUID: egHKNNzMsTAMFafBAuGDOHkYSsIA7djV
X-Proofpoint-ORIG-GUID: egHKNNzMsTAMFafBAuGDOHkYSsIA7djV

On 12/5/24 17:17, Kris Van Hees wrote:

> On Thu, Dec 05, 2024 at 05:05:15PM -0500, Eugene Loh wrote:
>> I wouldn't mind a few commit msg words on what "clean up" means.
>>
>> Mostly, how/where is dt_fbt_fprobe used?  Put another way...
>>
>> On 12/5/24 13:53, Kris Van Hees via DTrace-devel wrote:
>>> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
>>> @@ -73,9 +75,10 @@ static int populate(dtrace_hdl_t *dtp)
>>>    	dtrace_syminfo_t	sip;
>>>    	dtrace_probedesc_t	pd;
>>> -	impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
>>> +	if (!BPF_HAS(dtp, BPF_FEAT_FENTRY))
>>> +		dt_fbt = dt_fbt_kprobe;
>> If the BPF_HAS() test passes, shouldn't we have basically
>> dt_fbt=dt_fbt_fprobe?  In which case, one might arguably go back to the
>> ternary op?
> Since dt_fbt is initialized as dt_fbt_fprobe (the default), this conditional
> sets it to dt_fbt_kprobe if fprobes are not available.  I figured that was
> obvious from the code.

Sorry, where should I look to see that dt_fbt is initialized to 
dt_fbt_fprobe?
