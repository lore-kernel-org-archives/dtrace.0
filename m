Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17523A8F7
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722536129; cv=fail; b=WU9msq/vlWrMbzbfgxuFQebk/S3cX0isljcsRadMENNtZXhLxHDXrtFdkBxVqyOp0euodA3kOR1GqYH7SnrLvSD1EJrCmZsu+RGvrW53M/V1d8qucUmwk1+173oLnN+lfwxpFTde5/AmiPBMYF0urjhihrBMNBgUQs48aglviQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722536129; c=relaxed/simple;
	bh=WQt0adKDyfxdLu60pyWZtCfai355kZR0VEY0fR7W8RE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xqieey0yWNVdLDPgvahEtH943L8LhPdQ8wLZE9jrmaFuEeMuAIvDhrrZSwNlS1ZGQi4iMDolxVMrd4AtQwelyVgE9tH1DqXyYGJAp8tgrqjpzY1TiYNJ9QZC08kfwn+PtyDTaz/j4P/1jS1T4AFi8Z2XwEAMWPbtEXZmxCIVD70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a7p606x0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GlGCYaxp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a7p606x0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GlGCYaxp"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471H0VxJ004207
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 18:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=IK3YE+Z2OKS/oxf17vVW6S2HrEqKo9Fj0tCq5/eRwJY=; b=
	a7p606x0iqmqFJi929XY9P5yHPsGTFAgj0hmWWlSoRh5kA/LmUNigsdP4vJfM06j
	1mdTQF1rIB1liCKm8nP3fuZ+sHdwynQ7iOSupwX/dKrKkRNFDjs4ii9j5uY+IzT+
	usg/GLWjvKQhpj0fUX/t9svs4+6cxN2IqxigNYtdWah8KE0sSu4YIoDIyaWCpv02
	K9JIkH/EHFzTm+HzQ6fEGkiiMPP5hWMy7YU/A1NCL6EUFXrikmph6S4f5ei0fflP
	4FzYAKISrK/KvvfsWTa8arHD42IRr/s0Kho6Bws9daZYTHqbntURFqdG1vVUzcMF
	wE5hC/BTaZLK5s7HcSM89w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqfyje66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 18:15:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471HMRdB035608
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 18:15:24 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvp0jwgc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 18:15:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmLSXTnCrR29wSuZU2IwC3Wap1ZNwQrhZWKAiPkjCvAimKBQZaKjXvnp0Am6tBUabBiIb0eKVCh8NoSKVZy+/fLHxRXfDlxAD9C6TxrlAztyeiMMXO2WePIzzDGPAmZ94rBLqvpj8ci1VbA2Zq8TtLgUXNxa1o1o3oMpdmwD9ZmZp6LXbCbFW40Rl94617/HIyXc+IWg8VjxEI7YXeFrSrOR9czDrHq8ui7zL3ebiSghFrSF9XDJghKRTXzfwljMuZpnLUvaSbGHe+6wJM7dQBfdaxHc51bsd5q0kPiNy715m6jJfZurNFrE/kBIIFhUuUyNfTN/ZtCXwUl/gnnYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IK3YE+Z2OKS/oxf17vVW6S2HrEqKo9Fj0tCq5/eRwJY=;
 b=R4wiqm3lOiHzJABUhoWwyYZdDdGW8GMK1H1fNsIAKDy6jtrCImy4FqSQ9/+9DejgACxG+I4Y07EYnb7icv01m9i8d7iN06M6296TnkrMMIe2Xga+ZQVqCXnt+8GNDnc/1g47YIBHbqaCrYo5UZrI+Ea7TdSIlYh9YWCGw14r6LNEp7uX9d63HQbHdRrmZUezSZvBV7G7u2LsO4e1OolDaKz+OGuUI0vgp5YX/jsk0jNNGHBQFqrd2UWmXkeOvrMWV4xsmHa3jIHOkObFKbjJWazSWQHAEA+O7r5VeLIUih6Q8Vt2jHim974k+mPR8OqUWHt5zdYghjnsMaz2t5+s8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IK3YE+Z2OKS/oxf17vVW6S2HrEqKo9Fj0tCq5/eRwJY=;
 b=GlGCYaxpKj1xs2OisXTcTe9Nlr2W1CJquTOSgYebmK+YnGf65EbC/sLT6+9FVmvqTHlYmao1dDJEslUOdYRTnzEFPpwBD6jOYoIy44lmnDYgemEhtmGbt6+vB5xL6jWqNNcI0cTLu2B5HWWK7k9xh0E/8f06m2ElYIZji6kXbs4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB7515.namprd10.prod.outlook.com (2603:10b6:208:450::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 18:15:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 18:15:21 +0000
Message-ID: <606808dc-172f-5518-7734-739dfed0a781@oracle.com>
Date: Thu, 1 Aug 2024 14:15:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] fbt: implement return value support for fexit-based FBT
 return probes
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287AD841705B5857204F3BEC2B22@SN7PR10MB6287.namprd10.prod.outlook.com>
 <b5514f26-dd94-f055-509f-b766313287ed@oracle.com>
 <ZquajuExsHKfBC6B@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZquajuExsHKfBC6B@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2c0b8b-35d4-4a22-584c-08dcb255e825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2kvMjI5ZmlQOWUwb0hiWFI4a2R3UTFaUWRTdU00WFVFSTJXc3JTNFFEZGll?=
 =?utf-8?B?bUtaRHFUWVQ0MENwZG9yYlM2dzg2emNBM2JxTzgvUUpsSmxLMUpTSWs3WWlE?=
 =?utf-8?B?cG9FWkRHZ3VYaStZektoblRReis5YitEYlA5c1VUVVNodzFXMDRiYW1vdHRp?=
 =?utf-8?B?YWVNSXNCcmVFMjk4eUdZM0xFMkhaeTc2U1FNM2FJaW5DZU4ydTI4T2VhcXph?=
 =?utf-8?B?Y2JLYWF6MUM1V3FXZ3lTQU5hZ1NSa253bVNpTTRkZWhsTmFlMDFQYzlQd2E0?=
 =?utf-8?B?L2FZV2xtTVJwZko1THVrZGxOaWhpcG0xdDlXTFh4QWxTa2xOY1JOUlBvWEEy?=
 =?utf-8?B?N0hiVENQendsNytpa3FKUWF1WkwyOUkzdzhVRWE2N3U5SHQ4bjUzUURtd3Y1?=
 =?utf-8?B?Ni9TNlkwR2JhUVpJNTNQcVpPYWU0YWlCRjNXQ0ZtL3pDYzk2RFB6VHhzWGpB?=
 =?utf-8?B?WVlwQkVoV1loMVR1Yi82STY2ZnpCb0VkZWdsVU5TcUhEU3oxV1dVVi9LZHpV?=
 =?utf-8?B?aytVckIrR0xSYnhwVWdGMlJNMFRrTUZ5bjdScnZMRCtvaCtScXZ4cWJIRnM3?=
 =?utf-8?B?OFB5djkveGJUT3ZmT21ZR21tWXNxSnNwQS9jbG02a2pBT3NmdFZtcWpZYkc1?=
 =?utf-8?B?aW9yR3NiVE5CNmZoT25vN0c4SXJIM1dscjMwb1JWeEp1NlFTQUFvYjFCMG5o?=
 =?utf-8?B?Wjg3Q2JteDRSZ2N1SXIxdHNjNUp6SkdQc2oyMEl1cWllU2NhS0sxUFhtelFS?=
 =?utf-8?B?RkRTNXB1c1NYUFpGV1IvOHRmQVREbUFGVDdJcTNFa2pEOCtOZmpTa3lFd0lu?=
 =?utf-8?B?VVdaYmpGd0hoTjVJS3J6bEpjS2FJamhRYUp0VXZUY1J1UFI5NlFZdWlDM1Bv?=
 =?utf-8?B?cmpvM1pRZUxncWdzOERmRlFMMllwUzNTN2NGMmFETDFvUDlFblNHN3BzZkF2?=
 =?utf-8?B?WjB6TVlxMjNtVTlvVXpLOHBHY0FLZXR6ZS9vVm1pR09ZRDRlZXozandpNFQy?=
 =?utf-8?B?Z2VuWWVvVlJMaWptdTN2emVrS2VjRnh6TWRlbVpLcmsvSGJnd3lVeU9BZmJi?=
 =?utf-8?B?R2VmYUpFT1U4UW5USU5nWVMrT3dkdW9DWjNRREpZSmdMNWdKR2o2LzZKWnBM?=
 =?utf-8?B?Um5GLzNHR1o3WnFYYXJ2SlJnemQzc29lS3RTcC9NM1o3QldXbU0yVS9Oa3h6?=
 =?utf-8?B?NGpIbkFWWVlPaUlXTUNkQVlGc3VFaXgvSkpUK3ZxSWo4MlJUOFJySzBmdWt1?=
 =?utf-8?B?TVQvQ0xRbEtMMStkRWpya1hUQ2IyNmx2TWpiQWFiZkhCY25WQ3gzNi9VMy9I?=
 =?utf-8?B?L0hsUG50dmdSTDF4R0kwelRoVDd4OW1PQVRVcjBYY0ovSDhrMDNTWGY1ZWtx?=
 =?utf-8?B?OHJoZ3FTQ3dnZTBoUXd0UE5wSWZOM3V1ckVROWRkR1ViRjVGVnR2aWk0cTJo?=
 =?utf-8?B?dVlvRXFRaTFDZWdTMUh0WGp5TVVRRG05cCtjamhteTN5MnVnVVh3NERENW83?=
 =?utf-8?B?UlNmcGNXUUZtUnY4WjFIRG1aMGRLNFh0U1oxbTZyc1k4OEF1TEkyZjdHTlRt?=
 =?utf-8?B?bW1kUkVjTElpamx1R1NvbUJwZ09Fa3pkbmNEeDJFY1BoSmdMNEdZQ3Q1Ny9q?=
 =?utf-8?B?RFpQZ3hoUm9qYlZsTlVXRmwzZzI5ZDJ1dkh2dy9uVDdTbjRBOG4wYVdXU0VE?=
 =?utf-8?B?MjFwZ1grOU1za0gwUENHVlByMG5FYnJldzVUc1dZS1EwNXdCR3RiTE1rangx?=
 =?utf-8?B?cGlmSSttdTlVb3JBMXRkTEV3Y1hFd1g4bmVKUllkbmJGQWhBRDd3Y09oWDdq?=
 =?utf-8?B?ZUM3Q0licWV5TldIME9BQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmQxZHMrZkNVTy94Zi9VZkZ5Y2hjK0pEOHp1Uy9ZYVJoblp5Mm82Y25vOTFM?=
 =?utf-8?B?TU9rci9TVW1KNTFHcVRFcXVtNW95R3NGL3FueDYrNmpJYXpocUtRbGZaclBG?=
 =?utf-8?B?ZEhFd2lGSURrUkJsdHJ6N1Y5WW1FUThGbHNsM2ZFc0JrZEJvYzg5TGNIWHJ2?=
 =?utf-8?B?WE10VDFmckRVdTVtTDdGbVJBdEdhdWxiOW5sSTVUMDg0VjRESFRINFppelU4?=
 =?utf-8?B?ZVJhMnhxZVd0RzZ0VUhuNEpYbUxrY1kzenIwSWpNVzNRbFM1UVF6empPK256?=
 =?utf-8?B?NlNwKzlHMUw0N0ZuUWhCQVNTRndBZFA3Z1hOTHIvM2dMa0puS3hndmx1eEhr?=
 =?utf-8?B?ZE1SOU5ldWVkRUZVajJlSk9pbjg4VDBhMjRDZHRQYzdUTVZhQmt3ZG5tNm1a?=
 =?utf-8?B?a25yQjZ4QmpVZWNzRm1WTXo5OWZrMzdIQURUVldiSndjKzF1S2F4UGdHZVM0?=
 =?utf-8?B?NFFJeHZXb3ZsZ2p3RHRhbFFFcms2VmJVcW4zb0VMa0xiQ3pxQ01VUjhwKzF2?=
 =?utf-8?B?TzE5a1gvQ0tvc0p2aEZVNkpyR0FjNDc5Tmh3aUZiUG80Z3ZlQU9ZbWRSWVZ2?=
 =?utf-8?B?bFpyZSszaXRoTmptS2MrZXJnT1UyKy9sUndHdlg1NWtsQ2tzRUNYWDJ2V0N1?=
 =?utf-8?B?UmVOTnFtZHBBdU1IQ1BYSldIMkk2dDZDaytnMlozWnZ1a0xFTXRtdlJ3TitJ?=
 =?utf-8?B?YzlnejNrMEk5WWRKT3lXZXQwQm9oL2p2T3R1ZWYzR1BEZXBpSGxRUjdTQkFG?=
 =?utf-8?B?Y3pybXNTUUMzNjBydlhCOHM5TVdKSFhCQllZRTc3aEdGSzNjdTZDUFJkOFN4?=
 =?utf-8?B?eVZJNEJhTmJtbVNiaW81Y2UvcTVyNXJ4a1o1MkRjUmlKRm9EcFNMOUlIbHk5?=
 =?utf-8?B?ZklHRHY1a0I4U25FRXpvdFRyYWNCTHQ4Uy9LaVF4dkR4QTE0aUk3QTQ1dmRD?=
 =?utf-8?B?d25yQ0pSQVlxSzRkb1orcFFaL05vYXpaNGdScWpOVFZTZGgvNVBKWWlVTWJV?=
 =?utf-8?B?amRWeC9jckJxSW5UM1NqcmgyNngrRHUwTmxZOC9KdDJTSmlsU2VVdG45R1R6?=
 =?utf-8?B?ZmY0QXVGU0MvQ21uZFMzYzNBQUNvZkhpdXNiSTVBbCsva3dZZUwzeVBEN2Ez?=
 =?utf-8?B?N2VDdHlVcUx5cTA2aFB0eUo3eFBUUEJsNFlrU0R2WGt5WlYyYXhsRk9XOWZC?=
 =?utf-8?B?dzhHVE82Y1I3R2RGUFdQdDM0STlWVHl5aC9QMG9nN0xBOFZFRTg0c2dha28v?=
 =?utf-8?B?cEJhUXZySnpXcUwxeW5jS3lvcGVJMG1MdGJxSWlkY3dzZjVMcW0vbnBQNEox?=
 =?utf-8?B?M2hhUzltd1owVTI2MjA0S2ZzMjNyejFFaHFocVYzUVVpWXl6aDF6QitSQmNN?=
 =?utf-8?B?SlhnU0t2UG00Zk14TUhCQmQySzlWSC9VOWp4T1hMS0RwRlNEeS9LNi9nTFJX?=
 =?utf-8?B?UzN6UG9wbEswY1ByQmxueG1oNDJmbHduWDBpRjEyVUZRV3hXWjFCdFRJdWZx?=
 =?utf-8?B?WGZhaG1zajN2R2U4TGhaNkNuVk9tem9KRjdacXJSekJLYS9XY0ZublpydHFr?=
 =?utf-8?B?YS9VNHN6VHFONVF3ZHhMRjM0YnVkdzd1NmtKZDk5UzgyTnQ1VjQxdXRuMjd6?=
 =?utf-8?B?KytpQkFKMjI3ZkROT2cvUDd6bU1JeUM4Z0NXaVNVczlRWTFqRUR0NFQwRFJw?=
 =?utf-8?B?MWV1ZlhyVEtSWW5XOUtrVWFObG1sd3gwTkxqanphTVUrb3hoN2g4S1M3VmpR?=
 =?utf-8?B?NnN2N2VhVXpQZ0x0QlZqNzltNlNCWkF3Tk1oTGVUNU5ZNUF6YkVaZEk1Y3pl?=
 =?utf-8?B?SzlQUjQ0R1NGa09ldXRqVTB3YUlVRFFmZWlkVmU1MERkSGk2SkhWemlJNk9t?=
 =?utf-8?B?Vkl5RjBjMEo2cGt5eW5mdllWT3YxVzdJUEpua04zcGErMUphS3NhYXRtNkhZ?=
 =?utf-8?B?ay9rUW1PZzJJcXJHY3k1TnBodDM0aEdHMTB5emJPOGtiWTM2UlprejA1RGk3?=
 =?utf-8?B?aDl5bUVnaGlYUnJjR1BJRGg5TVVLUzNqZTJRdEpxS2pDeEk1Tk5YcnZEOUc2?=
 =?utf-8?B?bDVVN3pOZUd6U2dRUU1IK3BhSmhNZGVGSjZGODh2dnJmeVRwMW1NYmE4RW1u?=
 =?utf-8?Q?qz/rzZNUW44BE6/3sKjUCe5dd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LrxVYmEt+JrgyWeLuEwrRSrtAhz6ioAmGjPbkwgje0evtCRJ7NmlknAtgxzMj7DMD5JnAf6/qjTV7IKfITSzXZH3lOJerYf7FiqF+F/64JcWP1OCZsOtRZ7b9myuM2sSIAxPtyOhgCbqbTdi0ba5gXXQOcovavym8gOuYsFvaWLJGksLLYLFko0GoURqKdXOThz0c7MXJT7nZMrtZgPRnRA3g9Hb64I3xgauNRbeDmS5AYr3W+uX4tgbHAASomt17R1D/78ep2sxiaqH0lqGusgH8R4Ntn8duHCqnYEqt76MgefGa9SShWuNpsQr/0PzFIHlT9OArxS2t0K0z2gwYpy/Xr5G1mhe6mWtT+9Skni1g3oJoKf+JU7InxdFpjSrKOsvGx1pNFoXXVChsoBhZTnOBNTfbKK6Tk3qcmU0eJZRVaYflxeGBXi+OsxnzOKC7i1G4u7AYzW4jEfPgTtIzcFNUn11aW6aKAqYSKgwkjy5tnMaVydKG1G7LJ3xcnzNvhhbpxz5OiWeNahTfoT108k6I2Cw+Mqp787tHzhJXoFzfBXXLbtc09hofX39ykHtf3nQCEqERj0exvrQmj5mzuzpcwqUtI70SUK6cwvdOD4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2c0b8b-35d4-4a22-584c-08dcb255e825
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 18:15:21.8112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSH/gFoRN/0b9fQQ7n6CxAUN0gAV32XNCYBnnaDgHGIxVlUv/w5HD7/UbAP3DGzrzi6Zk9UdlPwpix3whOSzpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7515
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_16,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010121
X-Proofpoint-GUID: QQUie5Sj1ZJxmSJpniT04MqynraDR1GF
X-Proofpoint-ORIG-GUID: QQUie5Sj1ZJxmSJpniT04MqynraDR1GF

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
with a few nits...

On 8/1/24 10:24, Kris Van Hees wrote:
> On Thu, Aug 01, 2024 at 01:49:35AM -0400, Eugene Loh wrote:
>> Is there a test?
> Yes, the testsuite already contains a test (tst.return1.d) whose failure
> prompted the need for this patch.  And with the patch, it passes.

Thanks.  So the earlier culprit/insufficient patch (fe2101e5) went out 
in the last release with this test... failing?  Not tested (on fentry 
systems, where it makes a difference)?  A known failure in the last 
release?  (I forget.)

>> On 8/1/24 01:19, Kris Van Hees wrote:
>>> Commit fe2101e5 ("fbt: implement based on fentry/fexit probes") failed
>>> to provide a proper implementation to pass the function return value as
>>> arg1 for FBT return probes based on fexit probes.
>>>
>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>> ---
>>>    libdtrace/dt_prov_fbt.c | 20 +++++++++++++++++++-
>>>    1 file changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
>>> index fa888ed8..99b42586 100644
>>> --- a/libdtrace/dt_prov_fbt.c
>>> +++ b/libdtrace/dt_prov_fbt.c
>>> @@ -172,6 +172,7 @@ static int populate(dtrace_hdl_t *dtp)
>>>     */
>>>    static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>>    {
>>> +	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>>>    	dt_irlist_t	*dlp = &pcb->pcb_ir;
>>>    	dt_probe_t	*prp = pcb->pcb_probe;
>>> @@ -185,6 +186,8 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>>    			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
>>>    		}
>>>    	} else {
>>> +		dt_module_t	*dmp;
>>> +
>>>    		/*
>>>    		 * fbt:::return arg0 should be the function offset for the
>>>    		 * return instruction.  The fexit prpbe fires at a point where

Might as well s/prpbe/probe/ while we're here.

>>> @@ -194,6 +197,21 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>>    		 */
>>>    		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
>>>    		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
>>> +
>>> +		/*
>>> +		 * The return value is provided by the fexit probe as an
>>> +		 * argument slot past the last function argument.  We can get
>>> +		 * the number of function arguments using the BTF id that has
>>> +		 * been stored as the tracepoint event id.
>>> +		 */
>>> +		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
>>> +		if (dmp != NULL) {
>>> +			int32_t	btf_id = dt_tp_get_event_id(prp);
>>> +			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
>>> +
>>> +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
>>> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
>>> +		}

I assume we don't worry about the handling of dmp==NULL because it's 
"unlikely" (already been checked) and there's nothing more sensible to 
do anyhow?  Or load arg1 with 0xdeadbeef or something?

>>>    	}
>>>    	dt_cg_tramp_epilogue(pcb);
>>> @@ -274,7 +292,7 @@ static int fprobe_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>>>    	dt_module_t			*dmp;
>>>    	atype = strcmp(desc->prb, "entry") == 0 ? BPF_TRACE_FENTRY
>>> -						     : BPF_TRACE_FEXIT;
>>> +						: BPF_TRACE_FEXIT;
>>>    	dmp = dt_module_lookup_by_name(dtp, desc->mod);
>>>    	if (dmp == NULL)
