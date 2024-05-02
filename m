Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54212E75
	for <dtrace@lists.linux.dev>; Thu,  2 May 2024 01:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714614343; cv=fail; b=r8FxSskvFAmVGtg6EVC3I/K9OJ4cq6j5enNc33qWgeGeK76aPiHXfQzHGgwnecR5NJUBuZe5L7HxYJprspYQQLe0BxOVu7+PyRyjuwiMjMUEKiVAxrAtUekfhb12NwZmEDmxVAA0lRuRdfXVGNdyjjWOzfxesvbypnEoT+4roE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714614343; c=relaxed/simple;
	bh=dV036gBt+RDwB3mqUipPRSKbp4vhQyPQDT57xCM23/w=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AmhLhsbNTQB3+4Vih3WzlESNrlwgix/QQ/STJ+DG4VlBw13dky4Cys0iFI/JDyL3FP9Htnd0wRD76AESLbDSY0IhVKfA+OCwE1kbHxEcI4QSH3QX7kgmx/DtQDzDZwzjob3ZyTrHz69VfWmX3SRIcwe7MCAJ10MFPxX4xyNzOu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=of5i8Oi1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kV7ftHfa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="of5i8Oi1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kV7ftHfa"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4420pi6W018832
	for <dtrace@lists.linux.dev>; Thu, 2 May 2024 01:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=H/TQ8+D8VDrWVAJkjdgp+yCm25xNxeOayM3gt3iGH+s=;
 b=of5i8Oi1JG1eF7yQgjRWuCbRquAosgyuFFUzgkbY3AJftAz2Ggcqpd6pq9d7GBtd37GB
 4j0AlVapK0Oum13cQ2TqmNRCQrG6U8Q/TyM3S9mnkfSo65AqIV241+1jy0ymFuNVI5Al
 DP/M0oiK4ZKdUZblT1C455vPXURt+T4ylGPFqxfDKMU9x5hUo8q+XVY4E1PtvWrA3p2q
 418gCdJjEclP6PAzRqyO+CGzTUCm2RO/KMFDWkoiFb+vlbOGd9OZ6AiZDcumY6sW0ikt
 fTTmfN6zlgaPbrax6kZdEyE6ofqVmG/PvM6EllXeWmUV3fqctlntEo1TzJzc4UKpuQQi rQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrqy3354k-186
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 May 2024 01:45:35 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 441MQiSC034738
	for <dtrace@lists.linux.dev>; Thu, 2 May 2024 00:52:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xu4c1f4bv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 May 2024 00:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqAFWSqIickw+dSy8GRaskeNJ6RvNXeoSWuz1ZGtbRczivVoq49ITqBLj+u+u10nCILoPVTm53oupM43BQrM8MNx3tPS4eHjSaEu4BThaFM1VjS1p1/StrXD4Vv6+YWxzAI4Er9P+PDF5hPo3XVHKsNZVr5Vm7zpsdWlKe036VvGbods9PYJ63CQYUfFyFUxb8e/qVdYb/DhRG9VYUz95Y3KaORklfnz+Usc0qzPu1V0IrBD4oqRsAUCOAYBZNQ58kVl5lSP7vkGE6XdxmWkq0u9ObZ11IsDWXNYUp2vqsKNki/jThsXXFpfFOH79jqUIVpHLYyYjm6usA582JoUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/TQ8+D8VDrWVAJkjdgp+yCm25xNxeOayM3gt3iGH+s=;
 b=KZc6R9ra8RQMWIvo5snFKEofI/uCPUD/GZXVHn3rjUMsV0/7+9s+ja8oruCSMDJvrK4hJ450fpQupzca585A8yp52bCJIPzI0YHMuNoY+VBHCmLSqGAksRdGfNMfL+K34PJM3gyEO/yEzdWE5BLdfLjW8u1HBSr9JRz5ahsyONYRmuePg/kNlEF+RtmfqlVr86TDq5hkRReCUIlOxRkNfuGdfxxGYDgoV7d5hd08Ml7QE6pGlq47XMRgWrfhUmmrnGOkraD1HfSMgsDAzNIJbYsmcVzClXWNA0fpbxlo1bQRwqK3Ghb9fLQzoKZLSRIBU2vNX/7qOqwfnoigoxWhYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/TQ8+D8VDrWVAJkjdgp+yCm25xNxeOayM3gt3iGH+s=;
 b=kV7ftHfa+HAE+DK/SYtPLsPL5X3DAnoeAZjqgOzxGMRV43lGWBTSBz6p/Vk0E47hLE97LxN+31vCDvMbNn7nOjuUCPfgfWK0/OFqAiJWZrr2EDHLE71syc3cvhj2GZc3Zdgy/5fo2QTb6AKqUac50C6S/hZ3gxezzpOipUvzY4I=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7480.namprd10.prod.outlook.com (2603:10b6:8:165::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Thu, 2 May
 2024 00:52:34 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65%4]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 00:52:34 +0000
Message-ID: <54858443-10e0-987a-f1dd-aa7812f74659@oracle.com>
Date: Wed, 1 May 2024 20:52:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] cg: allow providers to specify a skip count for stack
 retrieval
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287B406F9AB2BBCC1949820C2192@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB6287B406F9AB2BBCC1949820C2192@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0122.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 730afd5f-9f55-4799-c3fd-08dc6a422784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UGxHZHYxVDk4T2FCYzRRU2lxcVFUbTVyNjJySk1JblVCajZWUFp6ZlNNLzBs?=
 =?utf-8?B?T0VkT3Z5TU56azFRWlJlczVXcmtYWkd6dHRmOTN2M3ROcWJETkovMWgwWTQz?=
 =?utf-8?B?UmZpaFNHbXExYUFzek8yb0VGVHFsVDdGbzVmZzhVM0ZFTXZPbTJEQmMya1pW?=
 =?utf-8?B?MVowd3VGcmc4Y0loZkc0N21OUXRSVDNvSXpiWFplRkFPQzRsbFpIdmxXa1Z6?=
 =?utf-8?B?Tmp3ME5wZ0dhRTQrRlYweTdqbkQ5ZkZ1VE1xbjNheGtRbzM1QmprT2RNTnRM?=
 =?utf-8?B?S1FMeENXN1Y3SG92b3luVDFnaXlkVVlwSUJvVjJLbzNmKzFPWnAzSmJpNWda?=
 =?utf-8?B?R2JQZUhLMTJIL3ZjMzdSTUR5VzQ0QzhHbC9YNTM1OWtibExSVEFVYXE5Q0pu?=
 =?utf-8?B?SC9tbEEyMWk2clFmMWlkaFgvQ1A1L00yMEcxNld2eGRzSytONWJqYjRpMkZZ?=
 =?utf-8?B?dHgyZndwcmZNMjFKMG1aZ0JFdVpjQklyUDF2a2V4eTdWTUkzR0lHQ0dBdWV5?=
 =?utf-8?B?RS9VR0ZpbDhaTWJsZ2NKUmhsOGdXMmhmWWN1WHRlbG44cHRhQnpNdHJ1Vno5?=
 =?utf-8?B?UUpCMXF6WVBoWFNhcHoxeW5UR21qR2ZyYWdvN2pRdGIxU2lzZkZQM01oNU8z?=
 =?utf-8?B?ZTFna3dVWnZTaDJUMnpPRGJ4K2NIOTM1RGFBM1JIVnR3R3RzalNpb0I3OVFu?=
 =?utf-8?B?YUQ3NGxqM1NneC93QkRKZVhOZVRkWXB2YjVEY0NDWDU4YUFVZU1QVXdMeGFZ?=
 =?utf-8?B?WVk3TmJ4eUZKNTdjWGpUMjdML1pROW1KUzlPM3lCa0JUNnczVWZ6eHdsdUNF?=
 =?utf-8?B?ZnJUMVZURktxZmgvSHZncldiRkFrdzZNblRERWNqN0k3cVhZSUVvN2dkQjJO?=
 =?utf-8?B?TkJGeVJITkdqZmRVdlJFTjhERUZoSGFTeUt4MWt3aThCZnRiL3I1OVdhVmxP?=
 =?utf-8?B?bVN0V2dwazRSV2NJVm9Wekd2UmJ5WEF1ZENZNW1FcmxNcy9VaW52OFIvL1Aw?=
 =?utf-8?B?VEVLTXdqMDJCdDc4blgyUCt3cTVBM0YrTDFLSldzSGtiMU1BMk1aT2hsZ1FT?=
 =?utf-8?B?Ym1JalE0ZWhYaXVHNWhrMUZ5R3lEMXBtaUlUdGk0Q01zQTZ4VjgwZU1VVUpV?=
 =?utf-8?B?ZmQ4dHYrMkFvdURuVHVyTi9EQ2doMTRWT252U3lRZThtTjBndk94OS9mOWlv?=
 =?utf-8?B?M0VHVEZuamJOUkErR0thTDdtYUVkZzVOaFRKcVJxZklIOXQrVDQ1QkZ6RFgv?=
 =?utf-8?B?eU9tQ2tMS1BmUVFjdUlLeUtqWVk5VlpHM3JTSlRESm9JQW40SFJ4WHJUMHNZ?=
 =?utf-8?B?cEErU2o2VHBzbFVFdHdnTFgySXRaVjBaNXlacE9Wb004dmFlVWlYRFB0NHN6?=
 =?utf-8?B?WWRWQjlWRURoVXZPRzBKMjRpYzZ5SHBnaFMvUVNkM3hWVnRQL1NCRDJJTi9X?=
 =?utf-8?B?YW8wNVo0V3lQZituZE9Xdms5enhjVi9IQ2swdXdRb3k1OU93K0pFcXpxaFFu?=
 =?utf-8?B?VE9ZaFMzekthV0t0SlZaMVNHRFJWemhBRXNJNGhscTF1K2lXczBlV0Y2bzV5?=
 =?utf-8?B?TkFsbkMrY1lJNDBCaVFTL1hvNzNybGZIcnJjUk9jdGFobnM2KzBZWmF2aEFV?=
 =?utf-8?B?a2FDWUdRdCtMcllzc1c2VGFPaTdIeTM0MXB2Zm5XYmp3d1VDRjdmVnFmZGNy?=
 =?utf-8?B?QTd0RWxvbjQ3MlJzUnZqdWoxdnZLcVJSOWw1bDJ0dEZ2ejc5czFxakV3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K3k1S2Ercm5ER05jOHBPTCtZM0ZVaC8yRndnRW91SnZlaVp3bGd5Q0tpV29P?=
 =?utf-8?B?T3c0d3BRQlNIcWM0VmhvMSsyUlMra3JuVkdHcXB3eU9lRHZRZDFUZUNhUkpP?=
 =?utf-8?B?cllXNHZVNnlNeG9DVUN3WkxMVDdWSUlRNy9ucTJsUHAraFlxNUxmdlAvU3Fh?=
 =?utf-8?B?NVBOWncrWERUMFNKNkNEaTBrK0JKN3dBSlhONmw3RElvNGwrc2tPQndHYzNY?=
 =?utf-8?B?aGR4SDFURjM2Z2hxQmZpeUZQMXdhbjRubVZWbFU4azhFWUtoRy9uZjRoYS9v?=
 =?utf-8?B?OXRVMlEvNkVJT29GSDNqN2JmUEFvY3N6dEJ2MkxnaW1HeXl1SUNORTRpZG1a?=
 =?utf-8?B?RnhPMjNBOWxzc2pFYzNKL3pDMjhwQWVUVUkyNzllakdGRTRoQitIc1pMSHd2?=
 =?utf-8?B?blA4cStnOWt4bGdYWVFsWlRKSnlpMC8wL0g5VUlNUithRmhockNMMVR6OEdS?=
 =?utf-8?B?UWc1UWFJemZRS1lmNDlueTg5bUlWTUJBYjhYZnJyL1ZzekFCYm5OWHV0eXdu?=
 =?utf-8?B?YlpvK2g5NU1GdWNwOVo5V0kvZW5TTmtZMXVYZldlL0tkb0JDVVBKNFFPNkNZ?=
 =?utf-8?B?OUVncmZtWEVQaVcvSkRyQk5jd2hlRTJlcjVqUk9mcXpRTWEzZGJvTXV1Mk5h?=
 =?utf-8?B?akZtaTNIS29aQzZTTm1xUEpQRmtpdjhoVDZJSDFtVTV3cEkxdnRGMkVXSGZ4?=
 =?utf-8?B?U3JOdWZTeUNNRytmSDZjUGFZRVRBUE52MTRSVk1ueFhNZFB2SG9zNE1sdkZr?=
 =?utf-8?B?VjVFcm91L1F5T1U5akVSMzM3Mzc3YVpiTGoxbzlSV1M5S202c1p2U2hmbUIy?=
 =?utf-8?B?Z2ZrSFM5Wko0Nmh1ZWszUDlSclFoTFJ4UzcyRitYT29SaU15RXlkN2N0OXBy?=
 =?utf-8?B?QTJhUldWVFltZGFxNnJRTjZ2dUNRM0ptdEZxOG5DK2JWOEl4R1NQQ2Q4VFV1?=
 =?utf-8?B?UlJwcE4rTjZQYUlQUVg1ZVJIWmxUMGgxU3NQNXY2U1hYcStKTGhONGplZWVJ?=
 =?utf-8?B?UFhjMEp3eThLV3JaV29YQjZCdFE1QXJlM0Nhc2lhOEpCN0lXbG5wN2swZjB1?=
 =?utf-8?B?ZTJ2aEtkbzJtUDhOZVIyWFNLR1pxWVZmcjJZY1ZIZ29Ud3plTXJFbkpTYWw4?=
 =?utf-8?B?YllCMUhsVlNyN0ZEQ0Jkc1ZnMndiWjJVTUVyTlB2S2ZxQzUzcWdid1RUMGpK?=
 =?utf-8?B?STM4QUFJSVkwc2NIakRReXRjTlpJVmRYdWJoazBNTXd6d0FyUTNMY0wrMGlO?=
 =?utf-8?B?SmYzRm1iL2ZsWGxKY1Z0VHY2dmg4RXJVSUNMZUJFekRWYVpVUy9USEdod0NC?=
 =?utf-8?B?V2QzZVVqV3QrMFRqYWI1MVhVOVpGOXViMENBWXpIRXJYODN1cGdVWU12dkJK?=
 =?utf-8?B?WDhKb0V6MklvUml0bnhMZWxvdEdqMWVmYUVEcWRQRmV4V295UVpJV0hmeHlU?=
 =?utf-8?B?a0hUTU9aTjBBTEpPdnUrME4yTzRJRTl0bUsybjdNUFJKc0daYTQrdUU0aklz?=
 =?utf-8?B?VXVaU0RkY1FNZjdObmswSERYSnZiNmxlZEovd3lmMTF2dW5XcFpHRnJPTDJS?=
 =?utf-8?B?K3d1bU9qSkNNby9mcytDZUN2aGZRTzBiNEhhblY3djhOS1JZdVJXakg0KzVu?=
 =?utf-8?B?UDRGYkxwUWkxeWJZVGw5eXpyRkJqaER1Z3djcUVSbFdmSE5RMllOdmZaRldI?=
 =?utf-8?B?dG92ZGxBWHNpRS9VNkVHQkp0a0dSVmpXMHgvRW1rdEp6STRHMTFOK2trS3pV?=
 =?utf-8?B?ZG1pcHVLZ1RZNk5GQjdSUk1WSFpDZm8wOEhKMlVrQ0s4WHRvb3JIbDQ0dGtL?=
 =?utf-8?B?alhLL3Ivbm5NMmtqQ3FXNm91VE0ycWtodWw2cEZuZ3VOMXJkK2g4ZlNxeTBy?=
 =?utf-8?B?Tk5RSWlGR0dwSUdtQ2RhejJKQUdKTkQ5NnRBRWJEMkJzQ2YzNG5DMmllS05X?=
 =?utf-8?B?Y1R3RUFEeTY1K0tpNm5hU1NQeWtxS1N2b0cwNndjOXBkdGN0SzNqUk02amo2?=
 =?utf-8?B?ZnByOVByN1ZXcmw0TXQwazBDcFRCbGVHcnBBLys5Yi9XRmE2NndXRDlVK1hD?=
 =?utf-8?B?bzk5czhQOHU0NXZJUEsxL2NzbnBPeDZCcUZQWVRPS3dFQVFRTFViSGtmM0Rm?=
 =?utf-8?Q?LW9PNNGTKkDWD3g90ljjhNboh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	9RkGb7UMwVzyw5Cr1fUgFY4Lhks+cdbQzNLzQm6gE3qBVfjePdl1omrZQf1b44xITioKZeO8yCRe3/lbg+u+u2e8Qncly7ZVq/TMJShOf2GSqo94DopB34NB3btMrMTWWq2u+VbSJhEOt2hqeboff9NgJxZm9DmYKlGpCLftAbA7YMpcfGglQFT1Zebl4pzdUaCgpcPuNBfT+Sc15R2rJt4twrz3FUUPC5K2lOd/Tg5H5YNw+HptAfDGPQBTh+nQpjlWhBh0qkaX+nwGTPN8CTqZpscpHyBp7ybSBF1fwwZs+ocMOSnRG30h7uXiPSfqnPwsYqZS4NOqDWTHzkWQw+BNGfeZZ6ccaLRdzFdFhdT/Hj0BtqHBPvItYhqEBFp66StfeRO0TIqWkx+qZ4TedBaU2zKV9isRoItes92/38Z7K41q2koUzEwmjtkWbUpyGsZdqTQRUzXnPyHmTB6TAAIP5Jf7PM+cytSdBQrbW4XRnx/5TXLTjtTEoV9bMXSlqm8NBJDdH4ABiHNktw8tM0gbHeoyXY99yu1amCm5SMkJ36HM2OuOtdTxy3IgoTSFfqkZTOVI1Tc5VzkOMsqUU4caQRCgWrtKJjN0jQYf+l8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730afd5f-9f55-4799-c3fd-08dc6a422784
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 00:52:34.5399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCGBmAmcQzzwWXoGgUHR+36H5RyxUsWfr0TmdcKb/wyiQq3fcTUokOKnnkdnvNso9V5lW9SgCs9EvRbAiNM1DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7480
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405020002
X-Proofpoint-ORIG-GUID: 7l-c87pXu99xnvi9est4dSaKsU78f_5Z
X-Proofpoint-GUID: 7l-c87pXu99xnvi9est4dSaKsU78f_5Z

Looks good to me (famous last words), though I confess I do not know:  
what tests show the problem/fix?
Assuming there is test coverage of the problem/fix... ideally 
stack/ustack, fbt/non-fbt, caller, stackdepth:
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 5/1/24 16:52, Kris Van Hees wrote:
> Some probes cause extra frames to be reported with bpf_get_stack() that
> need to be skipped to ensure we report the correct stack trace to the
> consumer.  FBT probes based on fentry/fexit probes need this.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   bpf/get_bvar.c          | 13 +++++++++----
>   libdtrace/dt_bpf.h      |  1 +
>   libdtrace/dt_cc.c       |  3 +++
>   libdtrace/dt_cg.c       | 11 +++++++++--
>   libdtrace/dt_dlibs.c    |  1 +
>   libdtrace/dt_prov_fbt.c |  1 +
>   libdtrace/dt_provider.h |  1 +
>   7 files changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> index 71eef277..ea5dc6b1 100644
> --- a/bpf/get_bvar.c
> +++ b/bpf/get_bvar.c
> @@ -28,6 +28,7 @@ extern uint64_t STBSZ;
>   extern uint64_t STKSIZ;
>   extern uint64_t BOOTTM;
>   extern uint64_t STACK_OFF;
> +extern uint64_t STACK_SKIP;
>   
>   #define error(dctx, fault, illval) \
>   	({ \
> @@ -64,12 +65,14 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
>   	case DIF_VAR_STACKDEPTH:
>   	case DIF_VAR_USTACKDEPTH: {
>   		uint32_t bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
> -		uint64_t flags = 0 & BPF_F_SKIP_FIELD_MASK;
> +		uint64_t flags;
>   		char *buf = dctx->mem + (uint64_t)(&STACK_OFF);
>   		uint64_t stacksize;
>   
>   		if (id == DIF_VAR_USTACKDEPTH)
> -			flags |= BPF_F_USER_STACK;
> +			flags = BPF_F_USER_STACK;
> +		else
> +			flags = (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK;
>   
>   		stacksize = bpf_get_stack(dctx->ctx, buf, bufsiz, flags);
>   		if (stacksize < 0)
> @@ -89,11 +92,13 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
>   	}
>   	case DIF_VAR_CALLER:
>   	case DIF_VAR_UCALLER: {
> -		uint64_t flags = 0 & BPF_F_SKIP_FIELD_MASK;
> +		uint64_t flags;
>   		uint64_t buf[2] = { 0, };
>   
>   		if (id == DIF_VAR_UCALLER)
> -			flags |= BPF_F_USER_STACK;
> +			flags = BPF_F_USER_STACK;
> +		else
> +			flags = (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK;
>   
>   		if (bpf_get_stack(dctx->ctx, buf, sizeof(buf), flags) < 0)
>   			return 0;
> diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
> index 3b9fc633..5b2df264 100644
> --- a/libdtrace/dt_bpf.h
> +++ b/libdtrace/dt_bpf.h
> @@ -55,6 +55,7 @@ extern "C" {
>   #define DT_CONST_RODATA_SIZE		21
>   #define DT_CONST_ZERO_OFF		22
>   #define DT_CONST_STACK_OFF		23
> +#define DT_CONST_STACK_SKIP		24
>   
>   #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
>   #define DT_BPF_LOG_SIZE_SMALL	4096
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index cb07b8d6..d1ee3843 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -1193,6 +1193,9 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>   			case DT_CONST_STACK_OFF:
>   				nrp->dofr_data = DMEM_STACK(dtp);
>   				continue;
> +			case DT_CONST_STACK_SKIP:
> +				nrp->dofr_data = prp->prov->impl->stack_skip;
> +				continue;
>   			default:
>   				/* probe name -> value is probe id */
>   				if (strchr(idp->di_name, ':') != NULL)
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 27246a40..a1c24e37 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -2597,6 +2597,9 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   	uint64_t	arg;
>   	int		nframes, stacksize, prefsz, align = sizeof(uint64_t);
>   	uint_t		lbl_valid = dt_irlist_label(dlp);
> +	dt_ident_t	*skip = dt_dlib_get_var(dtp, "STACK_SKIP");
> +
> +	assert(skip != NULL);
>   
>   	/* Get sizing information from dnp->dn_arg. */
>   	arg = dt_cg_stack_arg(dtp, dnp, kind);
> @@ -2644,8 +2647,12 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
>   	}
>   	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, stacksize));
> -	emit(dlp,  BPF_MOV_IMM(BPF_REG_4, (0 & BPF_F_SKIP_FIELD_MASK)
> -					  | (kind == DTRACEACT_USTACK ? BPF_F_USER_STACK : 0)));
> +	if (kind == DTRACEACT_USTACK)
> +		emit(dlp,  BPF_MOV_IMM(BPF_REG_4, BPF_F_USER_STACK));
> +	else {
> +		emite(dlp, BPF_MOV_IMM(BPF_REG_4, -1), skip);
> +		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_4, BPF_F_SKIP_FIELD_MASK));
> +	}
>   	dt_regset_xalloc(drp, BPF_REG_0);
>   	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_stack));
>   	dt_regset_free_args(drp);
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index fe22616a..bc883e11 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -96,6 +96,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>   	DT_BPF_SYMBOL_ID(RODATA_SIZE, DT_IDENT_SCALAR, DT_CONST_RODATA_SIZE),
>   	DT_BPF_SYMBOL_ID(ZERO_OFF, DT_IDENT_SCALAR, DT_CONST_ZERO_OFF),
>   	DT_BPF_SYMBOL_ID(STACK_OFF, DT_IDENT_SCALAR, DT_CONST_STACK_OFF),
> +	DT_BPF_SYMBOL_ID(STACK_SKIP, DT_IDENT_SCALAR, DT_CONST_STACK_SKIP),
>   
>   	/* End-of-list marker */
>   	{ NULL, }
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 0ddffa20..fa888ed8 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -431,6 +431,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>   dt_provimpl_t	dt_fbt_fprobe = {
>   	.name		= prvname,
>   	.prog_type	= BPF_PROG_TYPE_TRACING,
> +	.stack_skip	= 4,
>   	.populate	= &populate,
>   	.load_prog	= &fprobe_prog_load,
>   	.trampoline	= &fprobe_trampoline,
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index a24b1d00..17b1844c 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -44,6 +44,7 @@ typedef struct dt_argdesc {
>   typedef struct dt_provimpl {
>   	const char *name;			/* provider generic name */
>   	int prog_type;				/* BPF program type */
> +	uint32_t stack_skip;			/* # of stack frames to skip */
>   	int (*populate)(dtrace_hdl_t *dtp);	/* register probes */
>   	int (*provide)(dtrace_hdl_t *dtp,	/* provide probes */
>   		       const dtrace_probedesc_t *pdp);
