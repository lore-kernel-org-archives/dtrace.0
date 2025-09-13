Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04D538FB9
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 00:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757723790; cv=fail; b=B79IToMG+CVCjcwQXmgwYMFI2dgBCvWunabGCKpAKKpzYbd6OrAS+wNs8m4BFRYO3nquZGhnLcqNbrobgP7jA1wB3Tr5uT/Sz6SB5mJA6a3FWvcxoI4Rq+VzpURx5tXIQbYKBsrNEJOqIrYCzrp4yTQUT8ZZ8BKioLCaEzfsiL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757723790; c=relaxed/simple;
	bh=wJz87vxvRc7NYVOpPVwo2ASwFifjwOzUqWFZVLxfRgs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dvGIfPw29LJHUQ4V/2VuJPwhM/eZDlOWM6I6FpRpB9ZzaBgjgx0sdWHOOJFKs/M39l4NQhhbQl56l5VzfusX/I9ywudLdWoDlhellwbou+vccgEwkEFVld/liqYNYoTiS5BDLhLmefzWatCWJn+XdfZgkbs4ZLKjBJanHRCNdZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A1TA8KAa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=n+WKcSoS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A1TA8KAa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="n+WKcSoS"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58D052bQ010157
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 00:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=DrZjeT89mkzFo141FvTfz2UxPDf0Zr9nbkFz3gyW634=; b=
	A1TA8KAaFSiZU9U6PWKClBACjCuKiv48MzNB4dRfm/zMnnQlLQqbiBK3mpcNuYbR
	/xcR9hhG5YWPuw4oPL8K65tV/SDzABg0iEJsnlKKR5/sxcxpBVCbx3WibEUyNK3I
	i0OLe/4ZJmkHAnVTPx+U6E0qCShFgH1loMm8wWrtFfDnSRXgYZALC6O3WmKUi20j
	2s81AW/Xto7gNXsOaEbtMMO9LSq6bZC+rgFPgswgx3MJjXcTTUAQdupwUSIAkMcX
	9Qu74i3aOKFepPgTJKVBDITxvnSc+B+5urQxn4L9t63rbppmbMV6gtnUyoVjxcoB
	B4EfpWca6owU9/YifduFvg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4922x994cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 00:36:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58CNrGI9038750
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 00:36:25 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 490bdehpje-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 00:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jb5gomb9XVDDkmXgoNIftwTTHq1/71LQetsEu2b15jGRXC/rEr+1XovYStnhHQJgaxt8iC9Tp7PVNfIh+7JNNZ/Jz1lDlTY4JOrWlNwZiDjAWb9SrFbyAgLUtoaU40rj3aZZgMazZu6wK5yNMw67sYeCPiFGqm5nhuabL2nqXq4EV7KDWkmrx1mkOJllCJBKlXqOCRCbdcWATmMHRZcsQUlT0NWqCuBEX0BhvI1N6O7kNqIhaFt2784/vNWQOPDNZ5KpLWRskO2PAwMD87Of/FB168KD4GxZmiVANqffGlnrOqnz/hrW6xel8okD+SpJfnMnejHdtcSipdZpl0NJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrZjeT89mkzFo141FvTfz2UxPDf0Zr9nbkFz3gyW634=;
 b=EjUEY2P6gQO9nLBk90iarE+tsrIMT8xgdV+Oji9R9zcF3XCAr7CjizdMvGsLPsjUFcnb+icQf++z+lgR/jQWnlvUgqYEHNmpFzoLzTWN5CwGiO0eqZeeBkpyfrOK+M0rxezMVF0ClTb8muBYIirksBswRifewR4GBADKbsaK3op6z2VCStrAkyQJJkMdhl/n/UAU5xh5NxtOTpFi9IQJTwbLqISRQGTpHB0i+iKlZzG51ehT6qPU5qHsj7XvZZ1BFe4wplOWWrL1yYo6iWu8hds6MDiEkAU+IFBksKtDB/Kb5MIq8JZSHT6OP27ZjNl8Au1HmYUZ2vDwKHVY/9S64Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrZjeT89mkzFo141FvTfz2UxPDf0Zr9nbkFz3gyW634=;
 b=n+WKcSoSpEvO2SKupeaxNWK27FdjZhfFPUwmI7t5nm/QesEB5sILnQL7ymTKi/QosE2hLr34KYO/9J2ik9nXZh/8+K/UowDKyDGIwaTILT5MJWXAv8+DGWn0l/DKYXzh016PV6Btvp1jEgINm+jBV7daZYN0oDlMykde9qYGOHo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB5884.namprd10.prod.outlook.com (2603:10b6:303:180::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 00:36:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 00:36:22 +0000
Message-ID: <e464c8fb-2f74-a3e8-4fa9-c9074c0e661a@oracle.com>
Date: Fri, 12 Sep 2025 20:36:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] trace: print alloca pointers as actual pointer values
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56726ADFB2A8CBF47D3B8C46C208A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56726ADFB2A8CBF47D3B8C46C208A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN7PR06CA0042.namprd06.prod.outlook.com
 (2603:10b6:408:34::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 76267ee9-233c-45f0-d3aa-08ddf25d8ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OSs4L2tUZW9zVjQrVFJBMU1ET2FLTHIxQ1BOUUZwTkJLNzlBT3pqU3hlNGY1?=
 =?utf-8?B?UUZqN1p5M2RGZEw0Y09MNTFPWW50U3IxYWJLeVp2SWNOMjZBeXduOS9hMFBC?=
 =?utf-8?B?bm1IbTRWd2M2WUhCb1JUb2xTbHlLRmdUMVhxK1hySXVvNXJncWpPZE5RUkNr?=
 =?utf-8?B?cWJRSTNZSGp2dTVCZmUwNlMwN1pHM080U0VYd2trSHlaSGVwVE9PYTA2enla?=
 =?utf-8?B?TVhVcS9jdmlRS0xRNGFoYkVmZ1RuMXdzZk1aSGMwWk9YZmgwdEZleUpMNkx3?=
 =?utf-8?B?eWp0WFFzV3lGb1JZQ01TQXFQMWxGT0xrYVFackxXK0xLVHMrSkRrUWZ6UTd4?=
 =?utf-8?B?MXQ5aGpiQTBTQi9IekZKeGZGYm93RGxQekEwWmh2RDluRlBWZ0NhSjFCZktz?=
 =?utf-8?B?S0RrV2N4OEpWdk5VWUdEQ2NyTkRHaTVrK1h5ZkVqR2c3V1VhSjJWT0NURSsw?=
 =?utf-8?B?R3pJVWRpc0szVVBwMVN2TFc0L0loZFo1U1E1Mk5kQWlyT1NHRWxBTzlVa01U?=
 =?utf-8?B?K1BibTI1czZCeEZCVXBmZkxEbDA4aWtyM1l4RkxkNUtXZ3ZUYmtVekE1SWlp?=
 =?utf-8?B?SzQxcDhEaWpWU1VINERhUlcrc2FubzNxU1V6THVyQkx1OGFqdHdha0RDK1dj?=
 =?utf-8?B?eVp6bmZuWmZFc0NVUXhvbTNxbVdqa1ZxS1I5MTZSL3QvZVA0REtQNVhZZ0k2?=
 =?utf-8?B?Q0NhUG9oWEJzMmxuaHNRL1pqcUFXZmFSODkxdFBWYjhua0hjaktPWExEVncw?=
 =?utf-8?B?cjFKTkJLMkkyY3c2OGpZbGwxQXlWSjVQdWRXcDQ1b1htdG4zOXBYYWp6L0Jt?=
 =?utf-8?B?R0RDeS9yWk9SV2RNUElleFZsMUlZY1k5K2ZETzQ1REI3RDZpRDA1UHlnTWVU?=
 =?utf-8?B?Mk5URTNHMHZMNWU5UmpkT2lWY3MvZ3Z4ZVNxV3N4SlVKOVc0SUZsbjFYNVpt?=
 =?utf-8?B?cDhWb3crUVRNdDZ6MldpVS83d1MzVXd4MGtsN3pJMWlqamVYTzZEYmF5VmdF?=
 =?utf-8?B?UVM3ajVaUWV6aVhWMmhoNVZYSXFSbjVkRWs0QWtsemZmM3lWTHFXamp6K1Jz?=
 =?utf-8?B?ME0vWTIrbHBPMGtmd0ZEMW1QQUpaZWxZaXh3R0tJZTlGRVAzZlBjVW9ZTmtp?=
 =?utf-8?B?QVh0M0xzem15bEd2SkRtRDQ2ZllPTG9RTGlvem5YY1VCNm5RdW9Ob21VdTRw?=
 =?utf-8?B?TzRzZUt1Z2dITUJnTU1JTTJScC84eWpLRUs4WmlRaVpVWk1hUjVNVnNCNXRa?=
 =?utf-8?B?cmFjQnc4NG5WNVlzM0NiU1JTc2VKcW5LTFZxdExtREVuZEFhTmhrK3UvNkJQ?=
 =?utf-8?B?dUFFcVpYeEw3Y2xxTjZMQ1VYc0xHV005NFByVEhKQVRjM3VuV0ZKcklDUlNi?=
 =?utf-8?B?Nmhlc3YwMTIwaGxpQUdlaTVhdDlXYlpuV3VzWDhBUnd2YXNOV0pIcm5HNnAx?=
 =?utf-8?B?cDMwL1luQ0E1SkJ0eUs4ckFaZmVqVWhSNi9VYXdhLzQzZTBWT2NSU0Y0UW9V?=
 =?utf-8?B?aEFLQy9Hek1iSHpyZThTREFnc2Q4T0RwOElKTUEwaXJCVm1XWDZZdnVLVnlq?=
 =?utf-8?B?SDVjeXorWjJLTGxHZlpiWVpvN2ZIU3QwaXRHMndZM1h1azZkM2trUjhBN29z?=
 =?utf-8?B?VkRQZGhTTnlYZ3piU21kcmp4bnkwN0hzQjdNWStkbkhnbjRwdW1xSU13bUZT?=
 =?utf-8?B?UXRVTHhOY2c0eVJtckt3Z3Aram9UQ3NUejEvazQ5M3FEUVBzTUJKQ1FXelFS?=
 =?utf-8?B?R0lVVnRUdGF6UzBXMlIxVE9GYzhtVGNrcE9nNXk4d0xRS2V6c3BGdXMvSjRP?=
 =?utf-8?B?OUEvaGZTODJ2Nkg4N0ExWUpzL1ZXM2thUVNrYlpNQ3hhRVBWc0lKTVBuSU1L?=
 =?utf-8?B?eFRPbkc1UEp2QlJibTVpVnpUTU9Bc3hvRktWQWhwSVdOYTYyZXZFNEZRNFpY?=
 =?utf-8?Q?o3QGAiHIZdQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE82VElnSDc1MGgrMWtQa2g0WE56SndFemFYT3VFbWg3c3BZWnIvRmc5a2lq?=
 =?utf-8?B?Tzd3ZkIwRHFBZ2FYVjQ2NjdxNmNjQS9vRlEwRW5nZkVQTExjOTVFZW01TmdG?=
 =?utf-8?B?UXlUdHRtTGdnUHFCZVhoWnZpT2FVSlBsaHgwaUhQVTRlaFJjMVJ3NERkMnJP?=
 =?utf-8?B?aU1MVWJEMGZ0L2ROQkdibGFxQ1hwVWtYUmFWQWYrZVZoMVpzWFUxZ0FRVG8x?=
 =?utf-8?B?b1ZoUUNvT1RTNGJtbUNlSlpXRGcwQkdaMXFWcyt2SERsQ2hrWTNzNG5ndkpp?=
 =?utf-8?B?WDMwR3d6YjBUNGxBajFGb0NJaVNPbkFyWjkyRVhIMHJxaGFsbjNGOG5DLzhB?=
 =?utf-8?B?Mkh1RDlSYW9ZVHZXOHRVSXdES3R3OGxBOWdFTTVycTBWWmZ2WThOMUFSZVlV?=
 =?utf-8?B?YXRud2VhTGR0QWppZWJxM2NuRUJ6NXdzeGFuZjFlQ0YvZEZxV25sYWdtUkEr?=
 =?utf-8?B?dEVPdlp5V2VUNStHeHhTRlRGMjM2ZXh0cDNEYkZmejR6aFRlblVhR1hnWGhN?=
 =?utf-8?B?MjFjN252MzJKNkpNU1FYN1lwZ2Z5SlhBLzBwYm50ZmlqS2RrL2ppNUFPcVAy?=
 =?utf-8?B?cmM5VDVETzJWZXc1c1dWVUlwUThLZ1Q4dnV6T1VyQlhkNUpHalJwU29IbmNo?=
 =?utf-8?B?Rlk4V2U2R0lrRW1GMXdEUXErT2tTb0xIeG5ERFZEdTMxZlhGem5ERzFWa21I?=
 =?utf-8?B?Rm50SVV3ODlwV21NYm1vdjkzd0o0R3kyaFdZZHk1dmVvcE9ZeWdQbm1lWWhz?=
 =?utf-8?B?eldQM1UyRHY3YlBvbjNvQmpmdkZodnBqSjJpK0FSa3M1allDSnVDZ1Jha0lZ?=
 =?utf-8?B?U2dhUlRkSGtpL0hZNFNCRGNudjZ2SFJlMXVweUhSM0JNRUpjYTZERFJOWkJF?=
 =?utf-8?B?VUZNNW1LMXowcXFyMTN5Y3hZOWlBbS8wbG4vS2dKY1pWMVJsRm05d3VjeDRI?=
 =?utf-8?B?SlpUcExlWnBJMjhYVzcyRVZaa0lXeFJZWUVybXpTbVVKaHR0WWhEZzgzWmRW?=
 =?utf-8?B?ZUpZRUNaSWIzVi9LRlh1RDF4eThyT3kyZVpNZVU4YWV0dE1LdlhROE9KNW1k?=
 =?utf-8?B?eUUyNmtjc290a3JlTzAxT1VETjFwYkJyWjJ6Vk5LbmpFeGM5bUVLeTFqMDNK?=
 =?utf-8?B?Y1E0M3p4Y0NHT0xPN294NkxGUWF5ZjE5KzJYWXBUaHcwT3NSY25kL1U5SDNS?=
 =?utf-8?B?c1QwSnNkd3FVemN6NzRKUmJWOWYveGh3YTI0Z0REbGRsTE5uNUl1bHI2YlRv?=
 =?utf-8?B?d1l5MDgyTWoxd2pPWk1lb3pBdlJ0ZFFuNWNGR0EzUkFCK0dQdzZlaWNDQXBt?=
 =?utf-8?B?OXphTExtK0ZtSnp5bUVhU1JoMU1tSWtieXFocDV6R3pTbkVrUktLS1JkU1NR?=
 =?utf-8?B?c2VHV0FXYm5JeVZUazlvTEVPUExGeFF1STR2NmdaWmt1bHB2MVM1RUtPU1h4?=
 =?utf-8?B?LzEzNGQ2bTRnSEg4T29NZ3RUUzlsdnRESHVJRG5FeWR4d3k4YU5Wbzl0elN3?=
 =?utf-8?B?Nk1XSlpKckJvdEo2U1dGN0diNThEcWxvV0dMQWVxNEIweG1TOU1PU3dDOGJQ?=
 =?utf-8?B?UlRNRFZyTW5LaVZZNGZOMjlsVjhCNEZQZ3k3T3U1dnh3dVpaakpOVW5SWXJp?=
 =?utf-8?B?QWkxUnczclYvV2FWRElCZXUwcmdiS0xxYUtOSVRuMXdTaTcwbExzQ1B1WnUy?=
 =?utf-8?B?NVBHR1hIZU10Zit1WjlMTi9xdWxYaG9sT1JiWVhwYUZqckRVYkM4c1JwTUd6?=
 =?utf-8?B?cXI1bnJKZTM4QmhQSDNkY2hVcmg0WitkU01CSWUyUEZsVVZueEE5VkIzUEFv?=
 =?utf-8?B?TGNvNFBPZ003Qk03OWxsMDJQYzlMekRRL0ljcXJEbUNTVDRpaWQ5K0Z3M0xE?=
 =?utf-8?B?U0hUMmxCUDVXckdQREJELzBEdFhnWU5jdFhVdEttZGlEOWVnU1pWK0g5SXFv?=
 =?utf-8?B?a1IwTGtMbjFHWFM5WTBEZmV4V1ZPMkNWRFVsY3lCcGFDQzFaMEZ5eHYwYTdn?=
 =?utf-8?B?NWo4S1crYU1jVGNzQk5kNmdNNmR1MlBycXBRbktzZndCVWNNZFpzek54Z09O?=
 =?utf-8?B?eFZoeDE1amxMdjlqOEJ6MXBiVVhOQ205RktweHZ5WlZnNXJUdDBrT21KQ3hy?=
 =?utf-8?Q?zVPAyOAetY+gM8tHFyQrn2cXB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CPZhjSIB7s/DC6+RicmSKssfZ8V4Mikcl9ZGU/Bswk6eZ/NKQnFkfi7Qb2M8xl255fKKbO1A9xwTZuVPVothkG41v7lP8K9SX/sIPuJBP+OCWVQZ1l9/cJU7tAKaO9GB2Xpb9EEA3a4lvTMqM+IYSAfJtfSebQjclNxdM9ALxPEr1V2HpSkACocdqiK+QbzkdhhS6tq4xPiXttoasjzcOrFMmbnFzsGREv48Obw28e51kvZ9Tr4CGPghyTQ5QY79KM6YRM+X0W/3mo+jGXuVSwD3BQUB2hFjnMW5B1wPfhWAhH4cxBA3zoVhrsQYit50kIL0P2Dj559i6JpkEkSkigyByT+UtoMAOv8MQoCsHDV1+PGUndnHKQdWZSm95dzxRTZX8B8NYr+dB++lClL9Fki4UapAWqDugrhe8zg5fFfEBvr+7UZknJS3sXgtCD93TXon3+A5te77/KyHSm0S9btDVxZBcQSDG1WaOFU47Rz2lSEc+RQFn2d52o4q9peKPw9oKqedT3/tWZweIT9FdNkhroqmvAipU2vFWwe17r0RGqVwCjYFLdUF8Bmm+igxi+a5ox99Y/R9FRinZ2vF+R+Tt2ALdtpctKZVXxyEaG0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76267ee9-233c-45f0-d3aa-08ddf25d8ff3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 00:36:22.0151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JV/RFc4kSnMsMomWspbt9HWnPkbPuGbNp9xnforWE7SxLz80fO1qEFNmfn5l25piqEkSAqggNgwro9tQes8sug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5884
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_09,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509130003
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE2NiBTYWx0ZWRfX2ru9auhMqiki
 Lulgq4LJiQa0CHRxk7M3iQ915iV1y8u84s9a7VVE9ZUqKvmOzzv8hrlELI/8gOw8YrxS0yq6UdP
 Sg3mZhgA8uoYFmkUzCNIe1FcGV2rfZGnPnZk6iJxXLbWqxQ2PdlRGP2ZmdQ9mu3BXbQ2jTkZ1Lr
 jxOqD8naNMfh3m4UdlvtSbeILJMeCDm5Bjm/tiQCS14I6ws4kh1wuKn2hkRMxYQXOAxUAYG1Ovy
 85VaB/YY2Qn0CZCS6s3KSd5TW01XHHJwDd3fEhK/FGPScHreYnf55/EiR9USHZTXXxWNI3ZYhj4
 i4VySse8FF6E0ux91XA0eXiQ7dcCrQf+tGitCsXHwn1twmAA9mLss3ctWteqBE604CzIwL1EUlI
 5ELyF1T/jelmId0BbGf4DgTqDT98rg==
X-Proofpoint-GUID: _fGS57KMhi7fQ9z1V3NDdE9mA_6nUzi1
X-Proofpoint-ORIG-GUID: _fGS57KMhi7fQ9z1V3NDdE9mA_6nUzi1
X-Authority-Analysis: v=2.4 cv=LYY86ifi c=1 sm=1 tr=0 ts=68c4bc8a b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=8dQQ2hAHVZWzvdhmBO8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12083

Similar comments to v1:

On 9/12/25 00:16, Kris Van Hees wrote:
> Because alloca pointers are stored internally as ofssets into the

Again, s/ofssets/offsets/.

> scratchmem area, they were printed as small integers.  They are
> now printed as actual pointer values into kernel space.

And again test failures.  This time, not with the new test, but as you 
say, "Ah, tehe joy of fixing one problem only to uncover another."  So 
this time:

         test/unittest/funcs/alloca/tst.alloca-funcs.d: FAIL: expected 
results differ.
             Diff against expected:
              a/b
             -8b11/b/b3a/b//baba
             +18446671313727729520b11/b/b3a/b//baba

Here, "8" has become "18446671313727729520".  So, need some .r change 
(and some .r.p magic and possibly .d tweak).

         test/unittest/funcs/alloca/tst.string-alloca.d: FAIL: expected 
results differ.
             Diff against expected:
             -abc
             +

Here, simply a bug?
