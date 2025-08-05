Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B06AD21
	for <dtrace@lists.linux.dev>; Tue,  5 Aug 2025 00:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754352428; cv=fail; b=UiA/yQqUNBtst+ib/vTto9QaZCa9A+EZB+Wfg8gdKfMdl08TANhvHKYlWShPLCmKvcXrrzQolq5oTH6vssLTmDwOwrhL9Col+FeQQOo6BsLEbyaJ6WOKUf/DEfwVF3GvUpyDSfR6OWe8SjKPpn8n75+SEhFZbJ0OlmeLRHlZe7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754352428; c=relaxed/simple;
	bh=/1ZnR5jogk8/uuntxkk5k5aIAHLvSk0zYK8bXQVrnpU=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p4o19C08Cy+ai2KwP1367su0HCLxNVSwOQDSETYMbkVwmIlV5DcFWeMtjk6eBTg5OaGjqk1yz+CukpUylIjKiKgoZ+DXNE0hGxame48V52JxyCD70M95z055f9PutXYArbXiER7BiYQFH1yoJLPYfivOUMBLjDXu4373zu04mZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OyhYZPzq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FaCfWJxO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OyhYZPzq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FaCfWJxO"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574NgEGM004919
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 00:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KOvwr4xzq1ObL/66n6NWZW08XihNPuNIj2KjfT7TZ/8=; b=
	OyhYZPzqGCBX4Q4e2svLqhJpJ/TT+K275cClSiKkUpwgxsyhKpqrk/eAJ4o+02Ng
	o2Afd0XWeeTpUiVu+au+JLQmy4SIEA8v1/mOBp4xIzf17c58dnmEpyG/UUZnfEEg
	Fei0gnhaif0rWcvzOBxS0kPNGjZgRpzGzWs8IYL+hWUVpdJRHXNI0Bz2dKm+UO54
	cjAc/5N0AsDMGtRafnSrLvMDvHgoG6Ao47z72+Sc0Uaxr0/J08AMmBf2hij0ujcg
	ixrCf+qmrzAWVTIz+vTwBd/MFw1DpKUW9+iFSwqv/oTrdZKb17xzNWpbsjtLjYcI
	qubxP90MDYMoVBp7xyIjRQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 489b7xknt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 00:07:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 574N1ApR013603
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 00:07:03 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011027.outbound.protection.outlook.com [52.101.62.27])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48a7ms27hb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 00:07:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dayBANQ6Lx/2/wxGiPhQEnDqtNb+TMk1fCXrQEBUm/dquzPaNseEpIGbXVtYNlO5J5YOyUx+Ee3mclmX5YY1vmoJYe1SPTh6b2ES6O9SrVDIXpICrHoOkYbFn+7uZoFkW8TI5GSm1Ax4BzHz7ne8Yb7MALCZSU1FiJiwit6+w57gPgun53h2U0qh6VWlmiiDFVgkmZrnGwFai57ZIDwcP2dWWSwq0RHr1tUgPawqX/pNDCjhHgKaxbIlH/VjOkwUP9bIBgq0KFQBUXFYJk7Hobh5emb/oQqTfGntqEF+RakfO8tV2TzUhoktJb4d9L89kNQU2RHWLGD8QwpIMnqlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOvwr4xzq1ObL/66n6NWZW08XihNPuNIj2KjfT7TZ/8=;
 b=MBtDIq46Wl9JQfzYOyXC+cEB2ZBOhzUB58OKR8iPFY1S/nJ/X2XGto+oqrfDXlnAlsFAegh+guEBXswxf0leotub41aftNDTabDTLWQyp3KChnPQx4WcXKMSdOUQVgZDzP+1AVm7a27b+Phhq13XMCZZqOrKcGEL88qB1B4lqSRQhRva8AlMkJ/HZfNxXOWnEQYdIRFze6bar0Z4+m5ZShrsLyRPZyh1+HXZ2t6lf0SexnEelQO1whAXQKVfRyYl4Vnl1LF+UhvUpDxe7tuelS4K2E8TS5bLxWh7Tdaunv8okUetoqf4ewQpgwGX4YJ5OBHWo8JgzgmwLn1IeEJKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOvwr4xzq1ObL/66n6NWZW08XihNPuNIj2KjfT7TZ/8=;
 b=FaCfWJxOkf4RKXfgxlX4hXcJKsgdovlZTYyLk8WNvfMfcjVmy+aMwgIS9AWC5t1p8JONhgmZO9ksqAQKLz20Kv/jQh2fzB4vyW75EC/7DfwhF/Uk0t0cLYF3AOYR4mMAcFKO78BuS/qaa3Y/ADYm1GfqklEvANvQuU53m4EdxvU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4761.namprd10.prod.outlook.com (2603:10b6:806:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 00:07:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Tue, 5 Aug 2025
 00:07:01 +0000
Message-ID: <0e81db02-c723-d34a-2ca4-58b2ad2727bd@oracle.com>
Date: Mon, 4 Aug 2025 20:06:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] examples: add script fcalls.d
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250804234243.6470-1-eugene.loh@oracle.com>
In-Reply-To: <20250804234243.6470-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4761:EE_
X-MS-Office365-Filtering-Correlation-Id: a768b557-145a-4b48-e34a-08ddd3b40038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QU5ORldtM2prRi8yOVYyNEVXZEpTeGFIYnovRS9YL05XOWFEcnlNZ0xOVGV2?=
 =?utf-8?B?R2lhMU90OFJtQW9Rc3hFMllXdGh4SFdCcVFmU3NzOXpiY21SNVNpMFVEUFVH?=
 =?utf-8?B?THlxUUtnZnVja2hYdEZxR1JwT3NVZjZ4bUtSaVBaVk03R0FxMUdEUTV3OEl1?=
 =?utf-8?B?akMwdGF1bDRnVXNMOFlQNzJvMCtaSDBuSm5ManR2Ukx0RG5hV3lYYmprdDE2?=
 =?utf-8?B?aXk0TVE2SUt1Q3RFYjFCdkxCdHpDcVdDWXpkdFpNV0E3NTFZYm9CemtHL3k3?=
 =?utf-8?B?WDFYNHZNSFc0YVZvVzFncExQaFB2REVYSWd5SVBCVVhiaFh0RTI3b2dNQnE4?=
 =?utf-8?B?YmVzaVNycFVJSTRSNENvN3VsbHJaMll5UlJKMkJqZW5UZHVGcnpYNlRjRzF1?=
 =?utf-8?B?bkpBckNjaHZRN3k2aTlzcm5BbVdybzdTdDBPQ20zWHlYU05yeFBRY2ducC9Z?=
 =?utf-8?B?WEliUkNLMmZhRGNzYnRKWHN0dGgycVBwRFNvSjBPUFNDVWE3bVJvbSsvK1pQ?=
 =?utf-8?B?TWU1ZzZWNjJTdU5pbVVvVFlLYzY5L0N1SnlWcU9EZ21yYmRXaVNlQmRQWGhy?=
 =?utf-8?B?YjY5NnVoNlF0UWtmMzJJRkhCWncxOWxueGk5N3ZlenNsV0wwc2RaQ016UVFu?=
 =?utf-8?B?Wk9wR3VsdGZFbm03US8yS2xKbUh2Rkt1K0lXaTNsc2VRNXZReTFnMzkvRERa?=
 =?utf-8?B?dEVzK25FV1VqTlI5OHBhSGJYSVBQNDRpaXNNdXFkaTJXdmVDMTB3dHIzbUhH?=
 =?utf-8?B?Njc1UzltclNSdE5mTzR4ZlBtMUhQbVVzT3NWUWJYbE1PMlNuWVVOS1ZRVCs4?=
 =?utf-8?B?UkNhcHB3MmlGQUlXWVVHb2lsQ2tBN0xDcTUzV25TOE1oVVdnSlgzUjl6SlQ2?=
 =?utf-8?B?K3I1UTZVTmFkWCtVMUJLWU85c2N0VGdDc0Q5RjEzeUhxMFNGc0FnK2lxU1Ft?=
 =?utf-8?B?NEtRK3pZVXB0MzFjWTVWU1l4ZDd1WmhoVWxMMDhEU3hVSzBYRVd5NTRrcFhx?=
 =?utf-8?B?Ui9UbmNac01vL2ViNzdPbWNsbmxDV3k5Um9YS1diOU14MzZBWUF3YWJibXJS?=
 =?utf-8?B?dkRIS2ErYXozZm5KNFA3Z0dLMGlUbktVbG9ETUZ4NjdSNU01YmY1OVBodmlm?=
 =?utf-8?B?VXprRVBOWldBUE1wQUVTTTVmMjU3STdxRnJGVkR3M08zdW1uMVQ1a3lCMXl5?=
 =?utf-8?B?K0RsR1dWMVZUZUJsYUg3ZWsyc0pkUVMxWUlNWnhLWlhDenRhd3Y1YktmMFk5?=
 =?utf-8?B?U1FhNDlPVkhiZmxYd2hiZkRIVGQrQ2tZRXlKUExlRWNhaHQ1anhpeFlKSEFU?=
 =?utf-8?B?WXlBZmo1YWVUeENEeGhBSWQ0ME9kSXBkVzBRRHRjSXVmeFNRd1ZFVVRCdmtI?=
 =?utf-8?B?WGdsUG9SMU5XWC9aSnBSWGxoOTZCOHE4Z3d3Q3Zycjg3THhuMDVQRWZRZk55?=
 =?utf-8?B?cmhCWlRRQmp5b2F0UlBzUXNXdDdHU3BTOE01M3BwOXoxTUxQdFdnZmxDZlhF?=
 =?utf-8?B?bXo5akJVSHFnbVh3TEFiSld6S1ZrbUdsdXdDYm54ek9VODhnUFc5M21Cb3d5?=
 =?utf-8?B?aHppTURHdjZCTTBIblZTaHFuTzl1TlZOUDRYdjZKNGZMNEtnUzkyQWw3QW52?=
 =?utf-8?B?S0x4MmN3NUhNVGhhU1hDVFFQYndVU3dGSXNjL0ppbnl5RHhhSm00bXF2a2gv?=
 =?utf-8?B?Q3RuNGxyNVhnMU4rRHFqSW53cmZWdDZHMG96MEVxNkMyWWpiZmEyNXROUmRh?=
 =?utf-8?B?ek9qUm16ZUhRcFVGcmFQN3hJUkVuT0Rka05yUENONmd3cjZ6MmJmWG8xdzh3?=
 =?utf-8?B?RjhFVFFRdFVSaVFHYm9DdWZBOFlkUERFV3NTUXVRd283dHV5VG92N28rUmFQ?=
 =?utf-8?B?VG5rOXN4dmtFRUo2ZjJlbDk0d00vbmo3MVdXTlpoMVV5L2g1ZTM4ZSsvTEp0?=
 =?utf-8?Q?W34RY3gKkvg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2RGVnlwMjhSMDdLL01FTm1BS0RzUENma1pvTTVIVUtqQ2xVb1hyTHJhOGFS?=
 =?utf-8?B?UjhrRmdtd2REUkhoZGNEbEh1b1NlWnlCSCtFdTBscmxGN3J4ZkhMTk54SE5G?=
 =?utf-8?B?ZkpNbkZuK090YjJVQkVtZHoyNkk1QXBsZnBaWFV0Qm9qTFZpdjFOYTlrNWpV?=
 =?utf-8?B?Wmg3RXJmRXhXMWppRzYzUVZmWnJDcVFWalYybmpDU2lsV0l4T0UyREdZOHFQ?=
 =?utf-8?B?eGZrWHBIQ3FwM2ppMXJzT0duVFAzYXNENFVzY01jM0J6Y21pZEtrdCtxRzFZ?=
 =?utf-8?B?cUxxVytTQSswQ0NmL0FaNHV1OEtEaTQ3SnU3alVFZEd3clZHQXZrQmdDd0d2?=
 =?utf-8?B?ZW4ycHpsVnhEQ1FWeTRRUzRSdHJRRmVad24wcW9YdlV3U1ZYUGpHQXhGZlNJ?=
 =?utf-8?B?b1YwTFpSNjJId1ZiQjd2NXhOd2pJUmZXU0Z5eXlLeTNJMXczclJVQllaYUpv?=
 =?utf-8?B?NVVMajFXUWhHeTluL2x3ZVF4K3dKSFd6c212bTVlMU9nTVE1bGZWQWdVR0Ro?=
 =?utf-8?B?dlJNN3N0L1Y1UFNDN1F5WjZaOUxqZHpIbzFHdjBpWU0yaTVwWDVaWFdxa0E0?=
 =?utf-8?B?b0tHYlRJbWkyMldnUFRwbXlZcUdQTmJmS2FCcWdtTFRaSmQyM0dqOU9OREpa?=
 =?utf-8?B?OVZPREw0Nmc0eVc5RDlPZXg4T09rQnVLQTRFQllwZ0U2azQ2cys1dkgrVHhP?=
 =?utf-8?B?b0Q3aXdTTWdxVm5lNzF5SHVBdU1ra3BaSFhrQitMMSsxZnNDdVM3R01xZThI?=
 =?utf-8?B?ZC9UOWJidXFYTnQ1T3V5QmlnTlFoTGM1bWE0cG1OWGthQTA2YjBzeFdpSzBj?=
 =?utf-8?B?bzRzWkJuKzN3eW5lL3J0UmpKR2ZxQmRkaDY3S0R4cUtTYkVGeDBYK011UFMz?=
 =?utf-8?B?NzRObkN4YVYzMmd5aEpnZFk0eU5pZkx2UkFoUHRPZDlrV3dKUjNPQ29QU2Vh?=
 =?utf-8?B?MHZCVUIxbERJd1diTnU0SkZNRUNDQUhJTktaTnNaRzBhUWQ2NEV0YWhHSFhM?=
 =?utf-8?B?ZVFLVE14NnppeUN6K2hYVlMzcko0SVA2OWNyZGZEWGVMN2xCZTBPaExsbEl4?=
 =?utf-8?B?UjZXSk9XdXJEV0Q2aUgrUlY3TU1ocGU5WkxxVzdsQjFlRUY2dDZOaXpVUXk4?=
 =?utf-8?B?T0FpSVY3UTlzOHRWVXkrQ04yTDluY2FvRkNBb05ackNvQ3ZGUFFiQU1WWlFN?=
 =?utf-8?B?K2pXckNaQjRWaFRxdkpQVEJKUVRMWlhscFFidW9iejJjMkNkaU5QZk4xZzdL?=
 =?utf-8?B?b3pqSlJ5TXFseHprcFZ4ZngwdW8yTUdEbU15Z29ZTkZRTTY1K3lCRmgyZVcx?=
 =?utf-8?B?UVU2V3E3bGh6VXVaVGpHMlU3WXNJZnQybmxDek11VTRpK3A0Tis1bVp6QWJn?=
 =?utf-8?B?Vm9IUFBMcklZaEFIbGQxRi9BamxhejlNMFFGZlpETE1yOVdVMHJBR2xXVlA5?=
 =?utf-8?B?NHFLUGVtbmg5MmlaVHY2VmVYUDdLSDk0SFU5SElDR08xRnkzczlab3FOaVBk?=
 =?utf-8?B?bDZycVdHTUVoQW9YcThhRlpoZVJ5TzEyVURrT1ZLRFlHcTZ2R0lHY3BaWHJ6?=
 =?utf-8?B?dTZ5NjNJUk12bjJNRHZ6OU1xeWlWeXgrM1NQSE5nOVFYdFp3Sm9sRDMwaHJK?=
 =?utf-8?B?cTdrRVpzaHlCeE83d1pRUVl1T0dLV05oaFVUQW15QjNCUWRGR3ZUTmxZbVUy?=
 =?utf-8?B?ZDNyK3Y1T1M3aGV0WS9zNTc5ci81R0hxWVRnOWVjNzNzeGozc3ZaZm1xckRB?=
 =?utf-8?B?MU5DWHFxcWh6Zjk3aHBoUUZIa1Z2YnNNS1RCRDhaZlpaVG04M2dDTHBiUEFs?=
 =?utf-8?B?OEZpYTk2Q1B6cGNUVzdJVUlxUzdVdDhXVlVXZWxUaDJIY3N4Ykk0bEt5enV2?=
 =?utf-8?B?T3Bnb2pXekQ0U1Rxb0VpODN1UHk4YkEwdzhBamJaWnNKMks3aFIxd0loc0dm?=
 =?utf-8?B?eEpGQTd5NURZei9OZEt0VUZKZyt2eXhWQ2g2azFmNkMrbWpzTnJCMkJaZlQ3?=
 =?utf-8?B?Tk9GZXluckJUWHZSNTB4T0tBMlRZUHBSTW9PaVpFNS93NENqYUI2TWx2KzBw?=
 =?utf-8?B?WXZqZ3A5bHo2ZjZXdjFLalphQ0lXQ1pCbW9iUzBkZ2pIb08yYkJvd01ZOUVv?=
 =?utf-8?Q?kPFZ+SjyWNeoda5ch3AqCHIlR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kqjL4IUBLyAaJMAWh9P3OkQHBt6e7y+THHJzohus1A1PJOKJXMzNLy7BVi0lZi5xPFlS7LT/P9/Y9FIOkOc93aoL04LEJrQ7iJuPR2wO4aBr4qv2hGLL2BfhJs1N67IiiHfydJR6wSwJKaGqXNEzujyMmToGf+An/QxdOqfvKPen+ujXNKSUWib2RtgQFU+gwCuktYahFJvr3W81X9APH9GSPuml9lx+OtCW8UW7AmozxIEcniS9/hJ7AizlKoD+LOn6YN0ACvZGOQNNxkob0Iqj2aeEmyiuaiH3RMfprhjSez6K9UjQh8/xSaIA2oz+OBpFxDQuxmV7u4bdUqLyOeqMLGC2Xg4HPP+CEOwazx1smR92k/rYjzwPKUEEEBD0yFCPRg00LZKhlYhUQ6flwvhbLBtIF5VLnTj23WwFd9A+ixtYzgD6+MKnxA8NZ33waeAo1ZfQEmrTjgVjUSyp9w9myXM+s7DAXUUun5vTsx/iEyTkq/7/0C9liOUZHJZRUZbUVQmOZdVsl022uwxzUYDzuDc5xnC5VvnLf7/grIH8J8ml7igKj4Tf9Htu8RLvO0ZnUgKN4j0/Lr1Nd7UiZSMxvlK4AQKeTAVD1O0hypE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a768b557-145a-4b48-e34a-08ddd3b40038
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 00:07:00.9529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZkahgLTMj8yDn2Oepy9+bPEvxcCffFLtv5sKazaiuUzUeZYTIvefbPQFAXnimP0OraBA14V5IPUUch2Gcyzxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4761
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_10,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2508040147
X-Authority-Analysis: v=2.4 cv=MdNsu4/f c=1 sm=1 tr=0 ts=68914b29 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=6FrhCs4hBz52UvS9umIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13596
X-Proofpoint-ORIG-GUID: bDr_1utwAH9R90w2dLQYJ9qTzKFscn9j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDE0OCBTYWx0ZWRfXwOFZ0xCBt0X5
 s4aENMRh90PyxQchV2N6vskzlARGAg+r+8DXPu8NY3uJWhn0qtcvsRoSIUzIBLZPXEmDYFDbo/u
 p3hYBgJLwQSwiVtcxY7uh1GUyag84WzdzOo0bwsF0PxpdKLnls2WfjZvj81XJsaKkAKzm1I4Xu7
 yNOjfDQ/pEhGzgHblpJAiiljRpSVrpcSHFfvzph11leAAxfIHiMbWJQJFSkMuL27a/Xi0cLp9AG
 3voJb7n+ziRgCOTOuyUlZ1nBPKu+OpndTNMbUO7FzNDSF7dFjvPLwMWbx+EBGIwzGLWgHbPUACh
 WfWo+OzjYvM/dHWkiTTR//sefiwgr1bPQuFOUf/00DgM2qP6lqzO9qpIZP8P/sCd4o+POWPFxMF
 VOohj4nxTCWucgvof3yK2Vk1x0P5W2wE9X60FDugwxhPfvmb0IuZ7PD9AAnu1i0ub+pgeyyW
X-Proofpoint-GUID: bDr_1utwAH9R90w2dLQYJ9qTzKFscn9j

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

I wouldn't mind a blank line separating each clause from the comment 
block that follows it.

Incidentally, when git applies a patch with "git am", it squeaks when 
there is trailing white space.  In this case, "both" (at the end of a 
line) was followed by a space.  (That trailing space was removed for 
this patch, but might still be in the original.)

Depending on where we want to go with this, it'd be nice to have tests 
for examples, so that if an example is going to break that we'll know 
about it.  There is currently a test/demo directory with a similar 
purpose but antiquated tests.  Maybe there could be a test/examples 
directory.  The trigger code could possibly be something we already 
have.  E.g., in test/triggers/* -- something that terminates by itself 
(or not) and has nontrivial call stack (for this example) or even 
multithreaded!  And predictable (checkable) behavior.  Possibilities 
include:
     test/triggers/futex
     test/triggers/libproc-dlmadopen (multithreaded)
     test/triggers/ustack-tst-basic
but one could argue that's beyond the scope of this patch.

On 8/4/25 19:42, eugene.loh@oracle.com wrote:
> From: Ruud van der Pas <ruud.vanderpas@oracle.com>
>
> This is a script to list and count function calls.
>
> dtrace/ChangeLog
> 2025-08-01  Ruud van der Pas  <ruud.vanderpas@oracle.com>
>
> 	* examples/fcalls.d: List and count function calls.
>
> Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> ---
>   examples/fcalls.d | 88 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 88 insertions(+)
>   create mode 100755 examples/fcalls.d
>
> diff --git a/examples/fcalls.d b/examples/fcalls.d
> new file mode 100755
> index 000000000..8116ecc6f
> --- /dev/null
> +++ b/examples/fcalls.d
> @@ -0,0 +1,88 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  NAME
> + *    fcalls.d - list the functions executed by an application
> + *
> + *  SYNOPSIS
> + *    sudo ./fcalls.d -c "<name-of-application> [app options]"
> + *
> + *  DESCRIPTION
> + *    This program lists the functions executed by the target
> + *    application.  In addition to this, the number of calls to
> + *    each function is printed.  This information is given on a
> + *    per-thread basis, as well as aggregated over all threads.
> + *
> + *  NOTES
> + *    - Since a.out is used in the probe definitions, library calls
> + *    are excluded.  If a library like libc should be included,
> + *    duplicate the probe definitions and in the copied lines
> + *    replace a.out by libc.so.
> + *    For example:
> + *    pid$target:a.out::entry,pid$target:libc.so::entry
> + *      { ... }
> + *    - It is assumed that a function called main is executed.
> + *    If this is not the case, this is not a critical error.
> + *    The first probe is used to capture the name of the executable,
> + *    but this is not critical.  The probe and printf statement
> + *    can safely be removed, or replaced by a suitable alternative.
> + */
> +
> +/*
> + *  Suppress the default output from the dtrace command and
> + *  have printa() print the data sorted by the first field.
> + */
> +#pragma D option quiet
> +#pragma D option aggsortkey=1
> +#pragma D option aggsortkeypos=0
> +
> +/*
> + *  Store the name of the target application.  The probe
> + *  is restricted to main only, because the exec name needs
> + *  to be captured only once.
> + */
> +pid$target:a.out:main:entry
> +{
> +  executable_name = execname;
> +}
> +/*
> + *  Use 4 aggregations to store the total number of function
> + *  calls, the counts per function and per thread, both
> + *  seperately and differentiated by thread and function.
> + */
> +pid$target:a.out::entry
> +{
> +  @total_call_counts                          = count();
> +  @call_counts_per_function[probefunc]        = count();
> +  @call_counts_per_thr[tid]                   = count();
> +  @counts_per_thr_and_function[tid,probefunc] = count();
> +}
> +/*
> + *  Print the results.  Use format strings to create a
> + *  table lay-out.
> + */
> +END {
> +  printf("===========================================\n");
> +  printf("      Function Call Count Statistics\n");
> +  printf("===========================================\n");
> +  printf("Name of the executable: %s\n" ,executable_name);
> +  printa("Total function calls  : %@d\n",@total_call_counts);
> +
> +  printf("\n===========================================\n");
> +  printf("      Aggregated Function Call Counts\n");
> +  printf("===========================================\n");
> +  printf("%-25s %12s\n\n","Function name","Count");
> +  printa("%-25s %@12d\n",@call_counts_per_function);
> +
> +  printf("\n===========================================\n");
> +  printf("      Function Call Counts Per Thread\n");
> +  printf("===========================================\n");
> +  printf("%-7s %12s\n\n", "TID","Count");
> +  printa("%-7d %@12d\n",@call_counts_per_thr);
> +
> +  printf("\n===========================================\n");
> +  printf("      Thread Level Function Call Counts\n");
> +  printf("===========================================\n");
> +  printf("%-7s  %-25s %8s\n\n","TID","Function name","Count");
> +  printa("%-7d  %-25s %@8d\n",@counts_per_thr_and_function);
> +}
