Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA813B297
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 19:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725044774; cv=fail; b=qbPiIoTL73oetGVh/3ZKZdXadBJLpegWzfb0FaaqLculuE28jJoTcAi8E5jFDfrU+g34t2zPyhmY+D0p7SgWLnABlQW5PP32+110qOKvIsIgGuCPbjqUIoqUNyMZCLunCZCxqpE6+Dby9CXZA2jkaYZf6FqtKVmejQ5CxC9aysU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725044774; c=relaxed/simple;
	bh=6n7drUvSpJcpu/m/RdRl2AQxUYzEuu26+DnGbQKXlGU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G1qb6pQJC+lEwqsr9+u3jZw3qpDF5M1EFj6dAeJd9U2jfrsIDdQu75xff/KrRmG955LFPW4JvZyQPPGfNATYAtOx6KT1V+qV8sbYS9EZsXrQcB+fZ+rQrTI4hsPu4j8Yy+Gtg+m4gzunUGuMJRiKjistd0CQFzgnRZyVQL/38yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LdRG340R; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MpUUBJYK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LdRG340R";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MpUUBJYK"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UInOwm007930
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 19:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=aCpjkS7CWkhwrYS88sN0hHOmQ302OIcqKG0DiWr3Pts=; b=
	LdRG340RbTfKlEOFUXqkYBghivgVLhu+386bqch404sVPNiBf57a8eJmKcCEbxVv
	8z1w+6Z0GTX8Rzorfcp+mTJskgXypeEVaqaznDp+mOxMp51zTi+PCPLPihKkds0s
	IOqEnIbGZJhHetZOQzYHc8wBMyB7Xb/NxioSs2SLbddCS6AgRqkY3Ta5RqtuBS9P
	kX3gQk5TZ+ulw9osd7q/uVx6PCAH0yHCwuNlDXw8bOzQjDCu9c3F5zcTJh5EzdKe
	X/slQ+We95pUtS6XeZUl3FHBIwFVuNfpL2jLzXDRXR3UKZoNDUOgQX59WOL7x0en
	BFLQ3u++2u1PU85G9RXByg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41bkcr81t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 19:06:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47UHeDGp036530
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 19:06:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jpxrmw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 19:06:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGXbSpmtMQTbUc26Fe8TsONZddGNURSsixqitLUkyGS1xInYlp3Hh5QogAYqZv8wTbiltLEC2aXQoxKXPmzzIO+kMnDzgEarDUHbI4cS066WBaEUA2H/jvXMiDnQ0VfOGaKBRqnuOED6axuKjUMB3gzX9R8YbcJk/g9lU7yhLGnMyh05IO4XJIOl2MC0JrNLz9Nf+4h1pu7IiDSd1DgiFjjdbOPZmyUmjqHWx7lGfYnZe8RZd1QoeyXfCHP8F+fMcIiva9Gme1Bcb8LJ5Qge9xoTulZROkAoj+ej7Cr2w+N6ISYKRuxMX1c+K7AoE+CgVCPQKFIlVnYkor3aPpGI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCpjkS7CWkhwrYS88sN0hHOmQ302OIcqKG0DiWr3Pts=;
 b=MBdaTBcoGMRlhk3Va9tXRDWOvy+vSTXGaUWfse7VsARmbjsOBauiEfGAx+yvEf1GkWiCYqB7E3TS+hJ3E75DSyt7hSSpALNUIq2KWCHpZLsf5tXPFL15rUFGlqIEYfeg9iZKU0qcgzhvzsSIebIwKJ6vOvftidjE2trKtA4zQyDxmoGtA4wc0Omh4bWfB9x/fwEDKhHOdjk+Vq3/yYx8hctQfu0Z4qPz6DgQjTq3wGqA18ET5qFN+cGD4D1F1Sjf1zyO7KiVYPUz+t3ugDGt2WT1JfiS3Nozx+2hYgDIfZxwKLm0X+npnoZEuWxQhaqQkLgZkeFf9fukmSg4wZHBdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCpjkS7CWkhwrYS88sN0hHOmQ302OIcqKG0DiWr3Pts=;
 b=MpUUBJYKFzSqy7NPM6p7OEFdyBBhA6Bn8iBLBBL5QrKPcFsxlR6D/4vnubEsag03Dx8VTJFC74L7m/CZVFJoaieKf7XDujTRg65zXOhcPdLdPMPoumnhcBOkDsjbIpojxtJlwkp9yo1EoXqaFc5VaXPDqJLFxk27IC4l3uqh0Z0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB7443.namprd10.prod.outlook.com (2603:10b6:208:46f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 19:06:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 19:06:05 +0000
Message-ID: <4e45d037-d902-826e-e43f-71772f04941c@oracle.com>
Date: Fri, 30 Aug 2024 15:06:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 31/38] Fix dt_pebs_init() call
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-12-eugene.loh@oracle.com> <ZsyRbgnYtFelMhM8@oracle.com>
 <9ddcccb0-6ab3-c1ec-5394-4793ac187273@oracle.com>
 <ZsyrTYUHihmORaU5@oracle.com>
 <9a232070-92da-3d5c-8337-52286fe66c4c@oracle.com>
 <Zs+Tm8LO6naCCQz3@oracle.com>
 <01996fde-0909-57a0-3178-2158b377f53a@oracle.com>
 <ZtEtwnkc2gWT3zwD@oracle.com>
 <10a8f685-b3e6-bf99-0579-c47408dd39ec@oracle.com>
 <ZtH5F7Y9xZ8yykFM@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZtH5F7Y9xZ8yykFM@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:408:ac::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: aa01e339-b74a-458b-0a0f-08dcc926cc8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2NsRFpVT2pxTkJzVVY1amdBRy91aGJtcWxpSUdTcXRaa1BmVU5obGxQSk1I?=
 =?utf-8?B?cktjZTZKaXNneDNDRkRMMEFsVFRNaUJlK09ZQThXNElNcXVvb2tHNFFwNmxi?=
 =?utf-8?B?cWdoZTZXdGxoSzF1SWE1Um9vNm9GOUR6NGZtTEV1R2ZiNnhOVGN0bzJld2lV?=
 =?utf-8?B?MU1xckdQaFpXMFdFMnFLWkdBMkZ1TjNXQXNLWHF2aTN2K2N4aTNOQnFuVzRI?=
 =?utf-8?B?NDRhNmx2aFloaVFuSjdjbjNvenhmYWZxY2NzajJGdjlkbEdWWVQ4VC9JbUty?=
 =?utf-8?B?cjdrQmZjT2cxTnJjeUU5dzBRSmsrYlh6cWJ6ZWFMSFFqWkRLMm1pYXFybDBa?=
 =?utf-8?B?Q3dtaXRmWDNrOVNRUWRqY3dqVGxDMTgxVVF5TEQ4REtwT0Y0aVJKN0JzRzdy?=
 =?utf-8?B?b1kxQzNkSWJBMnRaWm9VeXpJc1psMWpyYWU5eEo5QXFXVTE0bDUvM2k0Wjdh?=
 =?utf-8?B?WmxRYXBEU0N5eVkrWVRnWWUyMTlUNHN0RWRIYTFZa0dTejRtTmlSc3doTHE5?=
 =?utf-8?B?YkFXSE9BL2ZqU0dFWXVZTnNPalRvSXVSeGU5OWhCVncyZGtCU1UxNEFFelFK?=
 =?utf-8?B?OGVCdkcxMGRTU0xreTZPb3B0K3VReEdjckJzNzk3dUtwWHArc2k1K1FUQVNC?=
 =?utf-8?B?b3UzR29ZczJ4Z3VDMStod3dsKzgwbmYwc25BeG5GaHJybUoxZXVpK0x4aE0w?=
 =?utf-8?B?QjlmUDdZaGc4SHZrTU1Zc0F1Wkt2dE1aRktTTHVzWjE1WXkzZTM1T01ucDVC?=
 =?utf-8?B?ZFlPTzI3a0VCdWplemNQOExSWU5qZXRDSzdEYU1MNnVzZDUxQ3A2bFdWdHJi?=
 =?utf-8?B?UUZ0S0tDdjJMdjdnZkhReDFkN1IxdFVpb2s3R2Iya2VSU1FYd1lHNW12V3px?=
 =?utf-8?B?dDA1Vm5RR1M3TUg0YjRhdWtHMFU0clZoSy9zOWNPeS9ERkpVeGZwaFArSm15?=
 =?utf-8?B?WTBCOUxtUi9NMzZseG9vU3hPSVRQVGNGTVpzRDU4N1B5ZUJTTG5tZktrUUFu?=
 =?utf-8?B?bFl4YTN6amd6WlR2T2JBUmxsWnBLcWhmNFgwWXR6N1lIU3p0cWdHMmkvOTNN?=
 =?utf-8?B?ZXlQem05a3N6UmwvcERDTDBSM3ZINC9YSFJIdkgvaTVldzgyUFcrWk91clIr?=
 =?utf-8?B?S2VjTUJyaE01Z3Z1ZDg2RWd5a082N05TRkVtWFNwbUFYdGM1ZjY5bjRDVUor?=
 =?utf-8?B?VjN3eTF5ZTJoeFhDb09CZmRPbjV4UEV0VUU0cU0rdFMvdjArWlVwUG0vNWs1?=
 =?utf-8?B?VVJBZWQzcFhTK01xd21YcXhDakFqKytJSTlIM0J0UGliQVl5NHlCUkpHcVpx?=
 =?utf-8?B?WkY1RlFxcHF2VGMvYU1oU20zbmMxY2ZLNjBmaXFSODZQU3YyVGZvSGpXRW1D?=
 =?utf-8?B?OGZEeWZSQkJTblFnOXR6NXIxWGpQRlBYNlFRUmxlQ2pKd2tFbkdJNDlBRlVG?=
 =?utf-8?B?NWprMnl4dDRYTS9NTldEQVE3R3FQdXduVk0xV1g0RUNDc0ViN0dSTi9WQVEr?=
 =?utf-8?B?M0J3N3dxZ285cWpqNGtxOXFoQjEvYllEM29pRG5abEg5R3NqTW9WQUFuTW91?=
 =?utf-8?B?OHJuWnBBQXZWaXQrYnQrM016S0tZeGZ3aUZReldqN0ZiVjBjd3JoWnhQRXV3?=
 =?utf-8?B?ZmdvWnMrMlNmNG1raWlYWGllcDF2QkoxaStsZkp0aGRnOVdqYmlpWVJmODQr?=
 =?utf-8?B?dEdTWG1WWVRnNVNWdTVNWVlBNXRoYkhnTnJVVHo4RWpqNDZvRGxrV3dLNG1p?=
 =?utf-8?B?R2oyb2lGL0tGNzA4eURWZlpZeFc1SHJ5T2lMa3NKcGx2UkVHdmJaRFJpQXAv?=
 =?utf-8?Q?Yafo5Bc7dXMgokuBueNE21A+gCNrtB8B1RRYo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azBkRDcycEJ6VGh3WXpQck01bit4aXdaYytxaVFlVEpZUHQ0Ti8xZXNJaGhw?=
 =?utf-8?B?cnRwejZ0V1ptK2ZmMHhzdVVrK0FGNzZRTFhOb1lXSzlhSDRsSmk3VlBqS3JW?=
 =?utf-8?B?b0p6eXRUdGxMNElMeGRCcVFKNGZidlBGMWRWN1hXWG9XOUxnTXkzN2hEL1Q3?=
 =?utf-8?B?N1gyYmpqRWh3WG9CUytNK2M4d2R5Zzd2S3djTkxkem5lZUdjSWtqQnB6L3Mw?=
 =?utf-8?B?dmFUOVp4ek92TnNSRkRqcTU5endlcnJpNWw2a3B6MUVNazlVYVhKZWl2VUlI?=
 =?utf-8?B?RVVTQzF0TFM5ckI1VHFFMHI5Ly9WdTQ1bXNjNzZZTC92S04yN1F0WC82QjNa?=
 =?utf-8?B?YjJ4a3ZDQnU0UC9VRzhpaE82aEJDVE8wOXJZTFdDR0xuRkVqZUhhOVQ4S2V3?=
 =?utf-8?B?OXNiK2NXTnpES0JMUytmME55MXcvZmpOS1ZLM1MrSjBvR1BUUjREY0VpZGhI?=
 =?utf-8?B?b3VHdTBrVGc0VlBrZCtWYVVmaGVJUGFaRWhOR21WUkF0ZURlb1lvREN4TnNZ?=
 =?utf-8?B?MmZPT2JmUDFONm9XbzFFVjFwSXZBWnNpcTMyeGF0d3lPRjF0cTFxaTllNkRF?=
 =?utf-8?B?R2pRZGRsekJIdS9jdTRtcnBkeldrM1JqUnFhYmxrVjIzWGhqNFN0RmI3N2NO?=
 =?utf-8?B?WkQ5UjVYK2VEMEsxZ0ZPZ2drZGhzOTZPa2JpWXBRRlJJTitTT3oybGpMbmFp?=
 =?utf-8?B?N1ltRXQ4VWlOT054OVlOZ2p3ZjFqWGFZUlNkeXFCdDgzeGpHRjNQRGZpQWgw?=
 =?utf-8?B?Z1Z0eUU0VFRkMWx4bFR6Vzd4VU40L2VSa0pjYjcxcU5MUTRIMG00eXYxYTVU?=
 =?utf-8?B?QnZ1VmdrclZsUmZ3c0hMUjRhQmVUc0xZS3V2Z1BDcjNhU3NkUVp1WVFqNWNk?=
 =?utf-8?B?cGl0TmZaZjd3RVJhdnNMNjR5VHBMSEhjMVJHKzc4THVsNWVEQkYvQkRPL3g0?=
 =?utf-8?B?RVRKMWFyVEVRQ3dGQjFCV0svSU9RaWozSzZtNU0zS24zUElnRjQ2VVpKTXJU?=
 =?utf-8?B?ZjA1OWUxTFpuOEdjcnlKbkVQazAweTlDcDhLelhuM0VHeml4dTZPS0luaHY4?=
 =?utf-8?B?WHhHT1cyYVVKOTk5bTR0Q055bzYza1BJUVJlOGlpbVQ2bEZqUW9INWRLUUZo?=
 =?utf-8?B?YldrWm11NUJSNEFtYi9WL05sZGh6a2hGYkc1ZmNGZjJSR0d0dkRTRkhhQTZh?=
 =?utf-8?B?UEF2QlhjQTk3N1MxTERGZFZGTnVYcGM4RlN3SlUwMkw2eTcvZi9ONnQrTGwv?=
 =?utf-8?B?T2xqMU9YS1BVU3VFVkxUM2pvOENqSlNMeWNZQ0VDRFpDSzdRMzh5eHZweWJu?=
 =?utf-8?B?OWVzd1pYZS9SNi9xaWdheVlOa0NHMVo1ckIyNlBMN2FOYWs1aUc3VDMzNTA4?=
 =?utf-8?B?Tm5CWkdqTWhKcWFiRmRjakpVYS9rd09QME1UVWJlY3BML2tJTEs1UjQzNVBL?=
 =?utf-8?B?N3NPajhIamFmS28wZDZVb2Y3UEI3VEc2OFNnUDBBc2ozMms0Y09RRloxTVYy?=
 =?utf-8?B?TStmT2N6N3hja2pjL3pGeFQ1MGw0K1pmL05lalRjbzVCTGtBVHFkVUtueW9P?=
 =?utf-8?B?QnhLYXFPMzE2d0JDMXBDMUYxcE9NZjMwa2kxK284b1hocHJQem16Y1ZEZk0v?=
 =?utf-8?B?elRmaG9XTVN5WjZaU2FZR2h2VE1CcnhRdDRGTkZLb3c1L2M5WVhobWtrYlVn?=
 =?utf-8?B?cEYycTBCRXdiWlZhVndBUWtQWERYTGlzaUJqN1BCbTNSUGNSMVFuc3N5VXhP?=
 =?utf-8?B?WlJHNFV4UVE3aTU2SUZWaWM0VW9aejA5b0pIRUZObUttOHRuUU1FcGhvelIy?=
 =?utf-8?B?Wjh5QUJxYVJNUTloYzU3eDVWcmwwTDF5Z20yY1dsaHhsdmpsUmM3WFpIM3RU?=
 =?utf-8?B?NXdzUElSMG5WR0NQNUZNWDh3aG5pcU1HS2JRVFdISWFSS2xjbFZLU3hhNEpZ?=
 =?utf-8?B?cHExZHZXeFowRCtZK3VMSzBKU3FSdkM0T1VWQVE5ZVlUNVUrbDFBUVZzV0VH?=
 =?utf-8?B?R2VoMXArTXBqMlZFSERuQURrVHExNE5Bd2U5ZXpndWUyYUxIcWhLQUg5bDR5?=
 =?utf-8?B?TlJaY3o2L3Nyd040WXI0czh0d1BvTVRBUy9YR2dYUDBWaTR3UHYyZGp5QWlK?=
 =?utf-8?Q?/VdT9oPy03uQCsdgVx0UDO3mT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QPh+arjnX3D7jy20ptnu9XjwDgxyBfrXdPInWNr67JkMz/vRCXr8Ttj+GddtHBsijJLbAh90stOFhPmUh66/ekUtjyZf5I7m0YXPkw0leBKNR9ZLorDH6gpktANdfDciSpN4HHktprqSdZ7E5xVcheKZa4DLw9XBMFGUssSeeMJun01ckrObxE+tmvYnNeCwz0aeHeyVbK3BcFbNso+jMo+NoOs0XIlhxs+9YUXYh3I8XGsdwYyQ1ZYHcYjkPOGwCl6/DHJa1hFmWxAsiOv9CpU60q+w5dsJqS2Ly4PHUuoHoBAbPhkvt16Bz+l/zwNesfukd2mZ4rn+SXtQTCzOsFAItrBKB9w8qChp3eKNRmNwP3pcPmROYU4AAmqF/HVbx6i/sp7QjzKymWZSFiZ5jwZlERMiZGlw6eV/a7bs/2MIwtHP+9Do2YeodX0sOolnRQ9/qhvHvvZiwQzFbnPqcvOFje/o/PwkP4dOymBCzYBiDFcNmqXkNC7dWSv/I5qCYbp0fz6DFv3uUJmVHdx2HSycOj5YcbNOjXVY4uXOEMkUkUYlWI5xLblyJ2Okncl/QSQdj6FOVUvKjzAmvoJ6E5mC5Iu5jw9bFARNLgQ75DY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa01e339-b74a-458b-0a0f-08dcc926cc8e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 19:06:05.8684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQURXU8A4+PdnwVBqVJcIWCkS5ZukqSQIXjbAWao6gj3G7HMF3IfhrXIEB8jKDarO+II6o013Ff4dUXc/ad7jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7443
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408300146
X-Proofpoint-GUID: ErRV5Q2oeqrilN_66tqoyR_0F11UN93K
X-Proofpoint-ORIG-GUID: ErRV5Q2oeqrilN_66tqoyR_0F11UN93K

On 8/30/24 12:53, Kris Van Hees wrote:

> On Fri, Aug 30, 2024 at 01:42:38AM -0400, Eugene Loh wrote:
>> So do you have a proposal for what the new semantics for bufsize should be?
> I believe the semantics of a user-specified bufsize should be as follows:
>
>   - If the bufsize specified by the user is less than the minimum buffer size
>     required to store the largest trace record, an error should be reported.
>   - If the bufsize satisfies the minimum requirement, the implementation must
>     ensure that it is round up (if needed) to satisfy the perf ring buffer
>     size requirement (size needs to be 2^n * pagesize, for n = 0, 1, 2, ...)
>
> Point 1 is clearly debatable but follows the principle that you cannot put
> something bigger into something that is too small to hold it.

Thanks.  It helps to see a specific proposal.  It just strikes me as odd 
that we would say a user specified too low when we're not going to use 
that size anyhow -- we're going to increase it.  Why should we complain 
about a request we're going to ignore?

What do you think about not automatically resizing?  Resizing in legacy 
I think was by default and rounded down.  You autosize up. How about we 
don't resize?  If they ask for less than min, we complain and tell them 
what the min size.  If they're not 2^n pages, we tell them so.  The 
default right now is 4m.  So if someone is playing with bufsize we might 
as well honor their request (and give them guidance if what they're 
trying to do doesn't work).

>> (And, why not simply ignore bufsize?)
> Because we want users to be able to tune the size of the tracing buffer, which
> can affect performance in terms of how quickly trace data is generated versus
> how quiickly it is consumed.  It interacts with things like switchrate.
>
>> On 8/29/24 22:26, Kris Van Hees wrote:
>>> On Thu, Aug 29, 2024 at 08:54:46PM -0400, Eugene Loh via DTrace-devel wrote:
>>>> On 8/28/24 17:16, Kris Van Hees wrote:
>>>>> On Wed, Aug 28, 2024 at 04:57:43PM -0400, Eugene Loh wrote:
>>>>>> On 8/26/24 12:20, Kris Van Hees wrote:
>>>>>>> On Mon, Aug 26, 2024 at 11:42:25AM -0400, Eugene Loh wrote:
>>>>>>>> On 8/26/24 10:30, Kris Van Hees wrote:
>>>>>>>>> This patch goes against the intent of the code, as far as I can see.  The
>>>>>>>>> point of performing the size check prior to increasing the buffer size was
>>>>>>>>> to enforce the limit on the size that was explicit set by the user.  Then,
>>>>>>>>> if that size was sufficient, then DTrace is at liberty to increase that
>>>>>>>>> size to a whole multiple of the page size.
>>>>>>>>>
>>>>>>>>> But if I were to insist that a buffer can only be 24 bytes, and 24 bytes are
>>>>>>>>> not enough to store a single trace record, DTrace should report an error
>>>>>>>>> rather than increasing my bufsize setting on its own.
>>>>>>>> The point is that DTrace *does* increase my bufsize setting on its own.  Why
>>>>>>>> should DTrace complain about my setting when it's going to ignore my setting
>>>>>>>> anyhow?  What value does the pre-existing behavior offer to DTrace users?
>>>>>>>> Are you saying that DTrace should not resize?  That it should honor the
>>>>>>>> user's bufsize?  No more resizing (to page size or whatever it wants)?
>>>>>>> The main point of this code was to retain the bevhaviour that DTrace provided,
>>>>>> As far as adhering to legacy behavior... quite simply, we do not. We do not
>>>>>> set the "principal buffer size" to bufsize.  Further, any legacy resizing
>>>>>> behavior is, if I understand correctly, to go smaller than the user
>>>>>> requested;  we do the opposite.  Looking to the legacy behavior for
>>>>>> precedent is pointless.  The situation is that we are unlike legacy behavior
>>>>>> in fundamental respects, opposite in another respect (automatic resizing),
>>>>>> but consistent in some impractical and useless respect.  That consistency
>>>>>> strikes me as small consolation.
>>>>> You can look at this from different angles, yes.
>>>>>
>>>>>> There is no documentation to change;  the documentation is already wrong.
>>>>>> This patch was intended as a step to making the behavior something that was
>>>>>> describable.  Clearly, trying to hold on to a legacy buffering model has
>>>>>> produced a byzantine situation in the current port, which treats buffering
>>>>>> very differently.
>>>>> Yes, but if you want to go that route we ought to go all the way, and not some
>>>>> interim solution (see below).
>>>>>
>>>>>> Perhaps we simply disagree on those points, and this patch is DOA. But the
>>>>>> patch points out other problems as well.  E.g., the min computation wasn't
>>>>>> even right and error checking was wrong.
>>>>> Let's do this as two patches:
>>>>>     - one that ensures that the computation is updated to the current
>>>>>       implementation changes and is correct
>>>>>     - one that provides for increasing the bufsize to be the smallest multiple of
>>>>>       pagesize to fit the largest trace record needed for the tracing session
>>>>>
>>>>> I don't think that checking the rounded up bufsize against the minimum size
>>>>> makes any sense if you are going to increase the specified bufsize anyway.
>>>>> Might as well increase it to fit the minimum size altogether.
>>>> I'd like to understand this proposal.  Are you saying:
>>>>
>>>> *)  Determine the min size (correctly).
>>> Correct.
>>>
>>>> *)  Round that up per perf_event requirements (2^n + 1 pages).
>>> No, round up to nearest 2^n.  The extra page is allocated automatically by
>>> dt_peb_open().
>>>
>>>> *)  Ignore the user's bufsize setting.
>>> Well, no.  The bufsize setting is not ignored.  We just change the semantics
>>> a little (in view of the new implementation) to be a mechanism to allow the
>>> user to tune the buffer size, but within certain limitations.
>>>
>>>> I'm fine with that (given that we do buffering so unlike the legacy
>>>> implementation and will not be honoring the user's bufsize value anyhow),
>>>> but I just wanted to be explicit about ignoring the user's bufsize.
>>> We do not ignore the bufsize as such.  But the extent to which the bugsize
>>> can be tuned is limited by the implementation.  The bufsizw setting cannot be
>>> less than the minimum requirement (and you prefer to not complain about that
>>> and instead just increase the buffer size).  And its value must be a 2^n
>>> multiple of the page size, so it will be rounded up to the nearest acceptable
>>> value.  But that is therefore still controlled by the user's bufsize setting.
>>>
>>>>>>> which is that if a user explicitly requests a bufsize that is less than the
>>>>>>> minimum required for the given trace programs, an error is reported.  That is
>>>>>>> a mater of being consistent (even if it has no practical application that I
>>>>>>> can see).  Tests from the existing version failed because this was not being
>>>>>>> done right.
>>>>>>>
>>>>>>> As far as functionality, as long as the bufsize is large enough to hold the
>>>>>>> largest trace record, DTrace can (and needs to) ensure that the buffer size
>>>>>>> is a whole multiple of the page size because that is required by the perf
>>>>>>> ring buffer imlementation.
>>>>>>>
>>>>>>> So, DTrace only increases the buffer size to the required multiple of page size
>>>>>>> if the user supplied bufsize is at least large enough to hold the largest trace
>>>>>>> record (or if no bufsize was explicitly specified).
>>>>>>>
>>>>>>> We could opt to change the behaviour of the bufsize opton to always round up to
>>>>>>> a whole multiple of page size, but that is a deviation from the original
>>>>>>> implementation and thus is something that would need to be documented, etc...
>>>>>>>
>>>>>>> Aside from the computation of the minimum required size needing updating when
>>>>>>> patches (e.g. the USDT changes) modify the layout and size of the trace records,
>>>>>>> I do not think that the existing code is wrong.
>>>>>>>
>>>>>>> I am certainly open to a feature change to make bufsize always be rounded up as
>>>>>>> needed, but that is not a bug fix and I think that ought to be its own patch
>>>>>>> (along with documentation changes etc).  And it might need some more discussion
>>>>>>> because it brings up the question why we wouldn't just simply always increase
>>>>>>> bufsize to be the smallest multiple of the page size to accomodate the largest
>>>>>>> trace record.
>>>>>>>
>>>>>>>>> On Thu, Jun 27, 2024 at 01:38:57AM -0400, eugene.loh@oracle.com wrote:
>>>>>>>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>>>>>>>
>>>>>>>>>> The function had a few issues, mainly with its comments,
>>>>>>>>>> ranging from typos to incorrect descriptions of behavior.
>>>>>>>>>>
>>>>>>>>>> The function has only one caller.  The enforcement of a
>>>>>>>>>> size minimum was problematic in a number of respects:
>>>>>>>>>> - it was missing 4 bytes
>>>>>>>>>> - it was enforcing the minimum before the size was
>>>>>>>>>>          increased by the caller
>>>>>>>>>> - it was checking dt_pebs_init()==-1,
>>>>>>>>>>          missing errors with other negative return values
>>>>>>>>>>
>>>>>>>>>> So change the function to accept a minimum and change its
>>>>>>>>>> return values.
>>>> _______________________________________________
>>>> DTrace-devel mailing list
>>>> DTrace-devel@oss.oracle.com
>>>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
