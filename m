Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC6860DCF
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722455523; cv=fail; b=u1n5c+Fb9DfBT/GSW+0/miAMYcGctQEllwG61VA75CnlIqwdplcbm8oF8iyCWwtRnXTF4IzMf5Ji0r3/DJacQA6/ltMQfdLbCk6w0UA621Py8t08ZBVaj7pP736lD8NtA+AVJUeDNr2LIz35679MB+Yb+dSVaxJmRk8hJKnUI0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722455523; c=relaxed/simple;
	bh=kmk2IyDbejmrkZbkaOOu6AcerciNUb3FqX9UyUzuXx8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qeRR/iVYiekrRq4QcLlcv1YdMvkEERFp5m/TIBBHQxhhdkvgkbdMdT6rJ1EWQSFtt/728SPd7RXJa3VxIZO7wKSrMI8VwFVCZZ1T1ZolTLqxKV/l2603Ecg79cRO0TlBW98vWCAanaUCSM04WG6l7lOvMQyZf0VtfUQvlrIFtWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Jgs885If; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MQ3HdgGu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Jgs885If";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MQ3HdgGu"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHtUE7001732
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=29MmuCH3TbEU8UsqBu+T4x0g/mvuelsY5YyK8R2AxmA=; b=
	Jgs885IfybmI0i6SG4PjxuW78sd6I5dAFCdn402jmN5WfHVGahPKEgnTVWpjK5Ha
	NI0PSeQLm+noDdKk9Kqz3hvaWLhlMwaxvOeieo5Ai2EXiM++UASgUkQ++oX8WWRl
	bi9QeLoLKMA1rKehsVi9b0wIvbW9QFxOJEDe4IlNTbtN6lT5NccYQEGlaeaep6Rj
	oz3y/gHpQEw4EVAT7fS6JCCeO7mqkDLecAN4WbKLshyckTFppO7nDYXbVKDwOc+0
	QR3OikmYV/RBIFgv+qQkSdzKyMsLDJQQMxvz3C6Ew9ekD5zh+NrMdWVvF3EOcS8Q
	UcOzD39unRdmCqBsK2z8Tg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40msesr7ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:52:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VIDYfr019018
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:51:59 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmsq2yk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:51:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0hZRJCtMnNGEoLRnKkj9xCEgure9tgxY5QkryL9AUpEdzMmemM9r/IultGcohtW/KnisxcV+gxH+0OArv/S3WMUa/BjNDAnBU+ml6K65VCWSN7lJsuZxcRPBc/sUjIm8E4mXMVSdGun39Mpal6ZqVMoz0qw1ret3jcRmFDxbMLgRhRqhjwtq+Z67vM8yvMuxHVOs2U03f/K7fIHT/SWbdeOP+jST23cgOD0/zvOY81c57dPBi9Oa6gT5ZpO3pAVMciNiqN3G9RcSPBTnmjSl51ajn4SlaJ9hU8dAadRZUyNQxex1mlDFS01zpUDtGtkT93/vtsIYrbx2Sz/fkkRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29MmuCH3TbEU8UsqBu+T4x0g/mvuelsY5YyK8R2AxmA=;
 b=loFCW34L8L3YSjDXkZV1aRptb44va1p0CStMzTJv6EuZ9WZY7ilV5552GuOcbN627ehqpc1Z06XLd64m3ui7YuVxDgZn6m+FIGu1GoV9C+z04S4djhrkjRNrfVXq3aqBNdqE89+BJgMRm8jWGsm3ZF77AMy+8L0v1dOVSbO0F+mkdrRMUJjrK++j6yMY5W1kIiqzgSGmme3Nf5SFTOm6po6aQKrwYAt90R1AXrvKer3sGrCBVcQ+4ibM7TBcicQ3KFTncBq1vG70R10td9zBD+XHSdA2r6Zqtq1pPmGzMVxD7gSprf/HCh7HBr4H5Vx0PjxvRm+TuCiOPN9I3ca8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29MmuCH3TbEU8UsqBu+T4x0g/mvuelsY5YyK8R2AxmA=;
 b=MQ3HdgGuEE7XMLH4u5WLFu9d33QinFUTguC4pY2uaG7NiNbBOdgkLN4RC/UNAnuHbvOqe9GJ3oud+6zSm37aDQZDfokQKMtkfXGxE2jVY56e7zyvNoxKireAtSzqN7FUjpEjWzmNkpneW5YO6l/c3T9QlHdrwVPqYEhlj8flNbA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4440.namprd10.prod.outlook.com (2603:10b6:510:35::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 19:51:55 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 19:51:55 +0000
Message-ID: <5c65028b-a5b8-12f8-d1c1-0fceee063dc7@oracle.com>
Date: Wed, 31 Jul 2024 15:51:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: ensure casting does not affect value
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287E87D4C69887B1DC570C7C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB6287E87D4C69887B1DC570C7C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL6PEPF0001640E.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4440:EE_
X-MS-Office365-Filtering-Correlation-Id: b40c5490-6509-41e5-d9cc-08dcb19a3ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QW1tMnFKUmJkU0ZRdVBIVC9TNExSaHJDM2RnQjFJUnIyQ3MvQWhhcE9yNnBL?=
 =?utf-8?B?MjkxMlVGdzZ6ejNzTkozYVR1RWpxVkU5MXViSGptOG8rT214V3ZrWjV5aVlF?=
 =?utf-8?B?cDVzSDV5c1cvczU2allrK1hUUUkwdnl6cHhzbHVHWTlDb2J6dEg2VGJHQmFY?=
 =?utf-8?B?ZWlrSkM1YlFvM21mUG9SMldIc0Q0ZHduRkdTdnhhcmtSU1ZpQ3hxMGR5NXpk?=
 =?utf-8?B?SDlqS3crS2M4MTI2N1AvUjNMejhSM3ZYdjN6czdsRk81Ris2U1g5T3RFczV1?=
 =?utf-8?B?dkRsdWtNUm5hM0doNjgxdFFhTjJ5dm1zUVlPOVdTVWtadHRKNTRtdnhGNXF1?=
 =?utf-8?B?TzVQZWwvd2JyeVA5WC9FbFR4WEhRL0Eyanh5VTEvTFJuMXgxTFZXNTk3YzNQ?=
 =?utf-8?B?UndjUzh2M2NLQlIvZG94ZStkUFppMDNOanhUWlFyd0RqTDVhcC9CSG1YdUJH?=
 =?utf-8?B?Qm9nYUlGdGJac3VoTmRrY0NtV0FNTjUrYTJnWnBnZlZXM21jdTk4Q0R1ZjZ5?=
 =?utf-8?B?VnNTWTNPR1FJQ0FtRzdUbmhYZXdUQ3ltWmdHNmM5MUhVS0dKZHFHb3BQaU1q?=
 =?utf-8?B?Z2duRnplQklINTIzUjBNWk0vU1cxeVdaTG9TcmlHdjdpWUVoM1g1akRmeGdD?=
 =?utf-8?B?RVNhVmVYSFF0V1o3N3pWa0FuYm5PK0luWVBWai9sb2pEbStaSU91NGhYOHRv?=
 =?utf-8?B?YmxhdHM1Zzk0cWVOVkE4WUFscnNZaEtXVFR3Tk5vK3ZweWV1d3VRdTZMWlky?=
 =?utf-8?B?RlkzdU44S1luaDlodVMvUkN6UUdRNGhTSjlTbGVya2hwWWVqeUJmdDRQRGJp?=
 =?utf-8?B?dmx4R29LSkFKUnAwaUJtY1dHWVRwR3BVNGR1dlA2S09ja3ZyZjhOc1A4T3hr?=
 =?utf-8?B?N3lRdVR5TnlIRU9HalZFY0FZTzN5RTg0azZmMUFyenluUnBQSmozazVrdjQw?=
 =?utf-8?B?VnVEODkyWGYxOVlEcys4ZGIxQWZxM08wQ29OMkFvOGtQNEt1TGY4ZGtKS2g3?=
 =?utf-8?B?TjFLRW0yU1FsZUZ4VHBrTHYybkRqdWtKYXBHV2Z0TkVEaDVrMVNiWjY5bGxX?=
 =?utf-8?B?Skp6enVab1ZkME5EbEFWQlpNTWl6ai80WDc3RFdhMlplTVpwb1dqOFNLV05S?=
 =?utf-8?B?ZmxCVTNIcUg0bVBVNnJuNUNYclNmMFY2Z29FODBkbGJ6ZS9aOG5ITGhSR3NZ?=
 =?utf-8?B?S3VWOUNRMXRMdS9hM0ZsblU5M2VjMWwzWElVdDJLOXlEU2E0bmZnaUt1azFQ?=
 =?utf-8?B?YzZuQU1HY3YxU0E2M1BoQkdjQUJyMno0ZjdvbUdTSHJxRXh2VjZ6eU1za1V2?=
 =?utf-8?B?TDBPMExyQWtiVXpjamVtL0wyaFY3d3lSVVp3cmR4eitvcGhhN0dDbElvRWZK?=
 =?utf-8?B?emRib0ovRlVlOTdSVG5IMGNUaEo0aTh6V3MvSGZ2N0RLUlJFeXN6dGJmWmU3?=
 =?utf-8?B?VEYwaXBEQTJEeWtDc3VpRVBiQUFpVUwyT29uUzVtZWRiQUVjaGo1elNaYW1i?=
 =?utf-8?B?UmMvVnYxUFdlTzV6cTgzZ0p1aXlpQUV0ZE83c0hXNnBseFlDdUIzOURJTk9l?=
 =?utf-8?B?QTVNVUVCMHdSK0MyZGd1enBoWmhlc0QxWmV3ZmFJaDNJWkRRcnVFekIzelRh?=
 =?utf-8?B?RStOZWhraW5KYU1LS0FEd3JJdWRPOHhQNno5cUM4SkUvNjJPWkVZcWsxeTFO?=
 =?utf-8?B?VWJYZ01ibHIrOVdmbHBiakhXWjRnNXhHREVCT0JwT3h5Uk1QajJvNit5dHhN?=
 =?utf-8?B?SWhDb29lYnh5Yi9UTXNMa3IrRDFmQSsxL0pqeXNrYzZTZlB2NWJoZGJ5ZTR0?=
 =?utf-8?Q?wxlJ9ZMCc2pzwoC66aAyPOzxkzhpc/2HBhhpM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UERhbnZWNnR3NTVnV0x6VG1CTjhVWTZHa3pPWFdlT2thUjhjaUZJeCtBOThl?=
 =?utf-8?B?YTlvSTVVdUg1TGg0ckEzbnY1OVlQTlJyOWRHZm03MlgweEVuMTQ2UUJiMWZa?=
 =?utf-8?B?OUtwOGtaQ2JyWnhDaUZjNWJnMVVQMzV0TE5PZEhyZDcvdGhQRVRsU0dlNG15?=
 =?utf-8?B?bmxHYmtOa3F1Z2VTa2ZlMkFHSWFHL0ZkaG1uVUxHUlhYbEZQOXVBaDBLeTZx?=
 =?utf-8?B?LzdHc24zSnV2RnpyOVdPQVQ5RHB0WUtnaUxiZ050d0JUT1cyc1VaVzF6aW1q?=
 =?utf-8?B?M0pLMkxBdll6eW1aK0pleVZBUWdvWFQ4ejlpSnpwSmdUYU9wSDVXbFFhYVlS?=
 =?utf-8?B?YUpQRUh2RmMyemU2MS9XWFppS1l5ZGZPRSszQ0xnQlpzb1psWHdJZ2V5Zmha?=
 =?utf-8?B?U3EyREpWbGx5U1o2N3pDUnlyR3VKR29uVVE1QTcxdkFBT3lmU1RzN0xWc215?=
 =?utf-8?B?L0NpaGdPQ0o5VVpMN05rclRTUmxDdktMSWRVbVZaK2trZnM2MG1ZNjdRRW1a?=
 =?utf-8?B?enhTQWh1ZGYycDUzSWpDVDQrMzVCM21ENDI1Q0plM0lReUhFU1c3VlNwZUh3?=
 =?utf-8?B?Wit4VVlodVlRTGNmL0tvQmJJbUh5d2loRTVRNG9UczFjM2U1QzFDcDArQzJy?=
 =?utf-8?B?d1o0QXZFWjU3OUorU3Q0b2F1MmJpWm8xUEZTbWRjN3lFZnVSeU9QSlhwcXYv?=
 =?utf-8?B?SXl4TmlYb0MzRTdUdU5UNG8yQm9TR3ZzR3k2Qml0Y1FVQ2lvVnpxb2UydkV5?=
 =?utf-8?B?bXk1dGNmeXlTcVZRL3RtLzM4YnY3dEpEUGxRMHVTY21vWTk1YjdWM3ROS0Jv?=
 =?utf-8?B?NHBzREdrcm05TzlHdkg3OXhkOHM3YzdSQ0l1N2hTQ0VGSlFIbnQyRFE3SEdz?=
 =?utf-8?B?cWgxR0FUbCttbm1hS1liMVA0RUR2eVRmdkw5V1B6emV0anRkL0VqU0ZwcEly?=
 =?utf-8?B?RnNsaTA0bnFSeWdzSlJSaVlyYmxjWWxMSkw5RW1BSzAvcTBVTjk0UnppcDZi?=
 =?utf-8?B?TENsbllmV285SGdSVHZDeXNsVzV3UzZHQVRrVWdVUFNtVzNZWWNCWG5Jc04r?=
 =?utf-8?B?T2ZNeWd3dUNtVGlPVEZLOTc3Q3p6VHA5dFRrQ0EvNDZyMVlTKzJ1dG5KMUha?=
 =?utf-8?B?cGExQUpubU90aFVUaEZZVHRBVW1qeDFoMXZQWkdEeGFORnpiVDJXbFBTays4?=
 =?utf-8?B?bGdURUVLelc1aXV1TFVsMUxIMC9XN3UxbGVOd1Y0WU1SZEIxVmhZQ3BSZ2Z5?=
 =?utf-8?B?b0tIMjRjc3VWendqSi9hdXUxbG9xRHdNUGhWN2Vxc1MxRXB5SWk5a05QcXl4?=
 =?utf-8?B?TmE0SDRJU0Rldi9KR1czdHdQYXdqdjljSWZQNFNmaWlpcGtHZkZWc2U1d05Z?=
 =?utf-8?B?UVNQNllTOThveEtFMTI2eDZZL2hMa3JKRnpNbTRKVHJuMTQ4aVJyZWJqNHZY?=
 =?utf-8?B?dk9sN1FLQXN6MGZJYm1BT2N3R203S3RFa1RpUm9DdW1DZFJmY3ZtZ2NOb2Yv?=
 =?utf-8?B?N3M5RnBUVFpDTXk2K0pqazAvK0g4dzRhWkNEaW5Wa0RYaTRnUjR0aXJMQXV4?=
 =?utf-8?B?bDlWaEpDOVFacjZTZUtUTmkvMFVwM0o1eGF5NElPbjdqbWd1QWJSSXBzZWZ2?=
 =?utf-8?B?MnZEdEVyMmsxTXpLOVpPWUtwRVZsN0pYa3g1dFlzWFA4dW9aRTUxMldHM1J0?=
 =?utf-8?B?UlFnangxY3gwcHBPRE1nSjVuemM0dkNLejF6eVpEWE1YVmRWZXhlVUNVdFRo?=
 =?utf-8?B?KzVmMUlXZEdqcmRtSkdaTlNaMmtEV21mTlZ6aFAvMFVXa0UwaThnNnVaU1hH?=
 =?utf-8?B?elAwdGozSVhUbXdxcVJWZUg0dm1hOFd2M2t3VjkwOFVya0h3ZjRieGVCSERs?=
 =?utf-8?B?VUFHNklkMzZhckFqN2c3dXF1WUZLTU0rOXJpWE9zWTZCRUg3OG1OQm5jSHZj?=
 =?utf-8?B?cW5PcVlwS1Y1Y1FwVW5mUSt6cCtYUnZRVDMxaFJEU3NLNXhoMWtTWjJDbTQz?=
 =?utf-8?B?bURaeWlaaDNac3NMdkx4aGoraVRtRHNMWmIxYk4zalhqZU5SK3NZQ3dGRHJ5?=
 =?utf-8?B?L3JhWlpXbGhBVmp2dk1sQmd5WVN1L2tLTG1xRVFIc2V1a1VDbitpZFJpQlJY?=
 =?utf-8?Q?tRtJjV78ZuUDHsFnJsOJrpaLf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PJ22VT5RUc3TpG5Gnfambbc1XohnMehI93FIeUT/PM9p4CKiOy6LQNmukRleTFig/Rg8G8QP46n5hoW2vlPwnU+yi747FtuAzGGULklGd9EOCFLk6vZ8ZSey8dn686H15uNvBwUuzMk9vwsvIfFJSAdSbASUpd9NhFEtQ9hFeoi9XaV6VvBPN53YFvrBJINBVHddHyHT6g6U2m3Xeg3KHKFjBucpHu1Lm5+oswpSEGk+JD+I9ne1xezBozjFLvGAXV1bEejvEGgGTgNBW9qB8TK5b59fpFZ5EJ1bxN4olhMPySpNf5F8TBvo9hQ63eo1mGmq2ediJ22iQnH7BIkFKxnDvgyKEM9h6iJjR9K+si1OQ8Uc9IkujiEyECc4lGmYVBa8g6JGA5gkp+8mPKguBw5Fwr4kQuxru65tP/DNzJxQ+8PnSM8a2Q/2gPH/KIIX2Z0LJVFENllzbfUMOKmzpWqegsVlmft9iOiHSfh/AOl+SkiEJQXQyrHBCYv/70dzC2WfKRlRthvy9y5teBRlZIftjnAodAe0x55sylmkmwXfbL9RJOk3vXl2tfvhFbhtmoUSooX6+gwlAGmDSCCkahv3XUNlOiFkmGPbRP0fON8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40c5490-6509-41e5-d9cc-08dcb19a3ae5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 19:51:55.2622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjRW0XOWRrG2KA8+Li3GUlcOJIRDNwKQnv/zk6O74L23mvg5P+u4KFnOh25tv1+gm5IrvLaUhyUVbk5MZrbKEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407310139
X-Proofpoint-ORIG-GUID: qUgyaVGRqNQ9kjpLcD1Y9QSNUjAmnzhL
X-Proofpoint-GUID: qUgyaVGRqNQ9kjpLcD1Y9QSNUjAmnzhL

What is the point of this test?  If we do not know the type of the 
kernel variable, then what does "kernel_read_neg_small_scalar" mean?

On 7/31/24 15:01, Kris Van Hees wrote:
> On systems without CTF, we do not know the type of kernel variables.
> By doing an explicit cast to int64_t a negative int is converted into a
> large positive integer.  The proper cast is 'int' of course.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/codegen/tst.kernel_read_neg_small_scalar.d | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/test/unittest/codegen/tst.kernel_read_neg_small_scalar.d b/test/unittest/codegen/tst.kernel_read_neg_small_scalar.d
> index 7c585d1b..cda6649b 100644
> --- a/test/unittest/codegen/tst.kernel_read_neg_small_scalar.d
> +++ b/test/unittest/codegen/tst.kernel_read_neg_small_scalar.d
> @@ -1,6 +1,6 @@
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -11,10 +11,10 @@ BEGIN
>   {
>   	/*
>   	 * Unless we are actually crashing, the `crashing_cpu int will be -1.
> -	 * We cast it to int64_t to ensure that the value read from the kernel
> +	 * We cast it to int to ensure that the value read from the kernel
>   	 * is sign-extended.
>   	 */
> -	trace((int64_t)`crashing_cpu);
> +	trace((int)`crashing_cpu);
>   	exit(0);
>   }
>   
