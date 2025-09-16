Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46D52F5A27
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 17:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758042508; cv=fail; b=JpZ9HDqGqD4CDLyTn03oKuAOwjoXFL1GAFLCH/QhJz/Byxg9q5Zl9bf6S8kK6lPOag5hwo5SC3sNVYwEpfsI6Jy84JS1vXqX6J81YIoa+sOJDfTf9imibb53p7Y18ig6wjZ4CTqWtGXVP5rD0obqjeMUemipYKRtbIifB9W/Yxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758042508; c=relaxed/simple;
	bh=VdaSueHWDLHjku9fYB01+nsC/uK7/ZrYpkg7U+5q95Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ebi57fZGqFNdVkpHOIPgPncHeQEQSbZ2AcT/rU5qaD4WjVUg0GQ7vZebxC+k5yyT/zAV15Ayy+4K+beW/KFDLXg6+K0Id5mTrsU8QwWmjXe2XjJzRA8rXgf2jGb/uKQu0CLyqSnGG1mSGMwEX6XTKlbdonF8rsRXG3KQFtHq6IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Jpl1GyYJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YiVZROwL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Jpl1GyYJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YiVZROwL"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GGNEsd021134
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 17:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=VdaSueHWDLHjku9fYB01+nsC/uK7/ZrYpkg7U+5q95Y=; b=
	Jpl1GyYJsdWYDkf4VIuqky+MEpB5gQ1wgRVMkUJJVjHBKSZ4TC9303q9Eeeq9yWg
	3L6CsP1s0bTh7x22yU/3Km0BUgspM2gyRW0h2A+o2jbxrnjB5n9V8rZNAfvKCWg6
	v9kcGMQ/7ilsrsNDo9Bv7KYKUN/pezRRyUas8iGeTRiWCjjD3bq5v1c7iwEqy+uw
	Mhm2VeFxXgRzEQWKofqQ/vnWlqDydHAnmUoBaSXe5hyk3nnF7FyyFn5CugLDBwM0
	aBuDWUanuiNtNkNC1vm766AaIc8MheR9Jz4XNU6dYf11E4eHF9hvRykECzp68Qb4
	jf+YMn+Koe4VitFPILHUbA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494yd8n745-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 17:08:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58GGlTPk027336
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 17:08:24 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012037.outbound.protection.outlook.com [52.101.48.37])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2jy213-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 17:08:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yN3J/kbM1otknUgVyts73PVFBMINYK7twIX+v8vk28MT5gVQT3FOQv+OInwDVlW8pT7PkyEZxb4++o3/WtHfeQL4washuxjmX+swUao9y7wZRWa6L4+CCtpwrg8uG1w/1NllkvzcXpEjWKhAXEghasFXRE4h9x5vRkZkvZ+bkY3+iNtYar0roqhwmTZRkhKWMA8hGn5/XOshfUmT68AX9/Gvf5/t+CuE/MDfAzZJ6y3XiqzDnmO+w4qZ4Js8bZ9a4QQ+clgiIc3MTdGCaK4ufPuWhbVnxi52sCFV6J6xFhWRisqEhMFBDI2wD7d3jdbL51BpQRvfxx7cmSRL0EedNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdaSueHWDLHjku9fYB01+nsC/uK7/ZrYpkg7U+5q95Y=;
 b=vqSRn6KHE2v4kclJJneNMIOvtLVcsnGmv5V7hLRr2Skhj8DaBocyl+lqz02MupUeYhP+iUe3bbpDmZoUwCk3W+F3tqcMHWxXM9jACmgPV04dNutIbK3H497r9oq/8LDEvyICLEMWtmD6PnW6fvb355Lj90e3wZkY1oHGRXOcmARtnkXWEtqhi7GsmxNTM6rayZ4fiL4HpmFldGzQwGMVVWlzqMq89BRQ2X9vwRZY94JKecOnFMJTVxj/yL+3W1eYRFei68nQK14wOnmDuiuaAH8Nt96sdZqx/pKckB1pPAi6b9swTcFBvWOt4sOUm74xjByhblTcVexAv8SjYjCOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdaSueHWDLHjku9fYB01+nsC/uK7/ZrYpkg7U+5q95Y=;
 b=YiVZROwL0n1NBV7/BANOBlWcrgy2omWHBxK2ZUyAR2pxmmYBRiQ1DPRa8tGZwJTOEHRVPihE34FmiwwIF8BrozXk2DI/w2Ck7i2GcTyLA/PX6SHHX5S/goj4OSvd6nUMn+rjEJ11IQKqkqv/1DLnlwLNA9KE1hUC/ED691AkbVc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6920.namprd10.prod.outlook.com (2603:10b6:8:136::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 17:07:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 17:07:53 +0000
Message-ID: <c6466eba-5bdf-c3fc-4ba2-6509bb4787cc@oracle.com>
Date: Tue, 16 Sep 2025 13:07:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v3] trace: print alloca pointers as actual
 pointer values
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672162D698C139186ACCDACC215A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <487cd783-80c1-e037-0c28-c2ff94364a9d@oracle.com>
 <aMjA7o55OLI9cATN@oracle.com> <aMjXfFOSefOzjlQc@oracle.com>
 <aMljZhoquVQGtvRB@oracle.com> <aMmKIR8E5rdokSAr@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aMmKIR8E5rdokSAr@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:207:3d::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: f5e06aae-2905-4446-e4d9-08ddf54392ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2hYd0d2bVhSS29KSGliQm9xS1hGcS9XZkVuTVZ5NkFicE5wdkdFTW0rRnVz?=
 =?utf-8?B?V2l5QTR1cmN4N1NzaFlFbkVxYnFJZTJTUzdGYWxLeEJOVlNNQ2VLSVRSMWRj?=
 =?utf-8?B?ZFkvZll5dlhQeTgvcEVDREovVHRyUEJsOXBvakJFSDFNU0N0Z244L0Z1ZVBa?=
 =?utf-8?B?WDh1WEd2Y24rZzQ1QTFzREFDREtvamhkanAvRi9CQmRDM3JsM0xBL2ovbk52?=
 =?utf-8?B?ZEhyNVVPbzV5RG1WZkprY1Qya1pzYWUxY0w1em9JbUJ4VjdQdDZnSzRKVHdS?=
 =?utf-8?B?eWphNGpiWFQwMklYei9HY1ZUS20vWmYvUEQ2bEJEK0NvWTRVTjdYQS9IaUNk?=
 =?utf-8?B?eDg0NnVhOUd2NWxVc2tKVkJrRmJ4eTF2djdvd2NtVmdpNm9OY240R0xlcXdt?=
 =?utf-8?B?YTBTR05tRU4rak01RFZEeU52Vk9wRS9CMkd6RXY0d0hncmo4K1gvL0U2ZFcy?=
 =?utf-8?B?Z2w5bHBUU1ZvZmdyelNHampmWWMxQjlHZHo1SzdyaFBmdEgvRUxnMW5HenlU?=
 =?utf-8?B?bEh5UXZMd0pXaUp6R1FmVVpKMTNEN2FQUURaTlFnUExvRGN3SDNoS05ZNmlj?=
 =?utf-8?B?a1B2dHFYcWZhSGZubCtSN0lxU0VKTk80QncwdEZKckxJaS9uVkgwWkZ6Z1E0?=
 =?utf-8?B?RzBGSXBmSmFKT0E2S1ZlUnpVR29DZEpGekcyREtSQXBVQVZncDJuU1hQNThY?=
 =?utf-8?B?VlB3YzIzQ2VaRGFkZ3V4VXBjcDVQQ3o2WHIvcys4cmo5dStDRkNBNHJsZGRu?=
 =?utf-8?B?UE5FUGNzZjExOWdKcXhSdDAyTmFmUitqRnJoVTRZUGJwN0h5VkdzbnRrNlo4?=
 =?utf-8?B?NU5aRU9sVXkzVGRObkpMNTdmL2VuSTl0LzlzL0syVTBNMUJsMnVyL0IrdjF6?=
 =?utf-8?B?dzVISmhRa3d6SjBHaDQ1aWxwa2E5QW9uWEZCVytBQ09CRThKZ0JEMnBSdzY1?=
 =?utf-8?B?SzdQMVYxTzk5MytZSDdKcWJsQlUwaW5iUkVSZ3VaQWhOZUpKUnYrMHdTbjZN?=
 =?utf-8?B?aTUrZTdxQkJIbjVkeFpQMGRsdW9Jc1VMRnQ3MFRvV1ovcnorb2FlQklHWlls?=
 =?utf-8?B?WkwzTXB5UVFnSEJNR253d2NwM1ZGYk5haEptRFQxblIwdkp4b0M5dWppQ0h6?=
 =?utf-8?B?a1FRNjhnZEhTY0ZJVnhrTVJDZEYyMUFxbU1OYmtaNzJpY1NYSU1uaHNFeUhZ?=
 =?utf-8?B?MlNkZXRMMDBudjVIUHNpSFU2SkJJYTl3MzdzSW5hWDdrT1BlV0ZYV0lZbkVu?=
 =?utf-8?B?b0Y3U01EZ3JMRHdqWDAxQVRFRklleEtnL0ZtVlBSZEVROWtwOFJKcEI2LzVx?=
 =?utf-8?B?ZUQwN0dnQ1NhYmo0RzZZNU9xKzMzR1IvSnQ1SU84cHY1aW0vdnllR05lL1Fo?=
 =?utf-8?B?TUx6ejFHSXFmRkZneDh6ek84NkdNN2cvTXZ0eW1yaTZhZUVwc1hPbTZzZVR6?=
 =?utf-8?B?dldFSEdPaGFnWGNuV1EvS1doek1lVmNBaVZIdU4yOUIvTzVnVkYrZkZyUFlx?=
 =?utf-8?B?UDJyTklmNWZkQlJzOG5MRGdjUitudjJtRS9SWW5EdEYyWEZ1akFwNk1ybC9w?=
 =?utf-8?B?TUd1Mll4VnRTMVJ6RXpNT294ZHdsK1ZBbVIzNXpPdm0yV1ZCY1Z1b1RlMXhR?=
 =?utf-8?B?c1l1UkhvSC83UzJyME84N2UrRXVNQmlpbWZTN1NNYUhXT2ZSNGt4ekJXQzg2?=
 =?utf-8?B?VDVaR3d2MHVadWJEamFiODdZZU5HZmdxZHhMaUtJRUlnQVpwQ0pneU51djZz?=
 =?utf-8?B?ZkR6OXZtRWgyem5NcG9RMmUybkI0NGRXdElxVGY3WlhQS3VYUVZvdUtwbjd2?=
 =?utf-8?B?NlZSQVBXN00wR2ZOd21oR1dwTGpWRDQwMERDbEhpOGd3Z2ZJbXdENXdsWVNo?=
 =?utf-8?B?M0VwMk1tMHQxWVEyM1pIUzdMWGR0dlFSamE3dDNObUJzTnhCa0o3TFE4TG5G?=
 =?utf-8?Q?BTiiIEzfHl4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjM4eGYrSWVqTGxYVnZqUmhsOXJyY1l0QWJvMzl0VmNFcFZya1psZE1ac3Zx?=
 =?utf-8?B?Z2I1M2IzUkpMRjlNVFI4S1Jyd0k5Q0NZQTJLRnBDT0ZhWi90T0p5OEhhbjJ2?=
 =?utf-8?B?WEFhYklMQTVLTnJYak5HRFNJSzZqeDNoaE5nM041OWVzZ0hISXhTbFFHaVRw?=
 =?utf-8?B?VVJCL1BPUStmWjFlME9JK0dDMnJ5RkpHMHNSZWdWRlRKS1A1d0FDQ0E5MjJX?=
 =?utf-8?B?NW9pWkZrZlB1RUd4NjVhaHBxajFrNDJiT2xLc29vMlJmRnJjWEhSM0Y3bGsv?=
 =?utf-8?B?NDNjT0RHdi9nbFdrbDZKL0FWeCt4NXQ1am4vWVI0dm00Y2dINEJBQ0Uzakti?=
 =?utf-8?B?MFFhTFZnbWUwQ1p6cnYyNWlzVGlyNHpGRmY4dFlwTm9GaGsxK3JESGMwbng0?=
 =?utf-8?B?dVRKakNrNStEMVZwcHVIaWZ1WGJrYVJJRTVlTXpjQUhvRWt6TXYyajdFdk43?=
 =?utf-8?B?YTJyOXF0Mk9naFYzMDU5R0JtQXlWL1poMTJLUXpPUHBxWC9iSUE4SXRjYU9O?=
 =?utf-8?B?dXp5VHRzQmVoa1hiOElBUytnYmZkak90d1dmOFVaczRTTy8rbHExdWtPOGth?=
 =?utf-8?B?UFJURnljTlNSU1M1QjZ6YjhzaVVRd09MZzNRU0NucGZuTUZ6cHR3Ulo2TGZa?=
 =?utf-8?B?ajJlUG9Sa2EyWkxUYnlQNmpidk1LMUNObFAxb25FS09yQ0I3b2JHL1hQRHhH?=
 =?utf-8?B?Njd3aDZxblNCd05OL08rVkY3MVJqTEJHTW9aVXVNTXNydERiNjBtZG56bHg3?=
 =?utf-8?B?VkRLd0tnV3FBa2U1UnlLSEg0S29HMHRpTTU4L0FxQzFHSXlYNXpseU5rNENN?=
 =?utf-8?B?MEJMRkJhczUzMEdYNXlnaS9PaXY5K3Fhdk9pb0l3VTY0RjFnWUl4YkkyZDBO?=
 =?utf-8?B?aFY1ZENKMHFlZ0ZzTzJmcHpBLytMM0RGSGwxQVdLWmMzd3BhY3lGZ2FybE1T?=
 =?utf-8?B?VTlFMGxSalYyYkRhc3JOUkllcHBwZGozOEdqYjl4VnZTcEpxc3lJZHV6TzZL?=
 =?utf-8?B?bW1pTnYwRzJUbEZUUlkzalpTZUxLaUZZU2U1UWpLeDB5VDB5RStJLzVwV3Uv?=
 =?utf-8?B?VjVtSlB6RDlQRHZBa204VnNqUldWR0FMTXFOZ3V0OCtJaGRVTnI4K00wNGUx?=
 =?utf-8?B?cCtYZHp1MFB4T1p2bk55c1YrVVNNZlJTMXVhcjFGL1J0SW1iUUtWenhGTjg3?=
 =?utf-8?B?SGxtT1ozS1NDQ2pxUmI1aFg0WmRWc2hManZvMWJVYk1FaE9RbTY0cmgxbXIz?=
 =?utf-8?B?SjNLRGxXWjEzWlN1ZkxScFp1VzJjdjI2aHhaRmdrRUtlZTRBQ1Y3RTFkWEpB?=
 =?utf-8?B?MjN0NXloNHhUQ2EzY2pzQ0Z0L0UxUkhzbEp0VjVMTEhFWUthM1R0TFBVamNi?=
 =?utf-8?B?RWZrU0xwSzNnK1d2MERsWHNmM2plZS8xa1dqRldSVGpxUWRyTTA0YTdaaUFK?=
 =?utf-8?B?bDNEVU5kbW5DV0krOG5MeDBZQjhCUE5pQWtYTHJvZklBaGhsR24rWnJVS05F?=
 =?utf-8?B?M2NsRWRpWEtyeFVLWEg3WnBHNW55QnB5d24wbTZxQmZlRktDazBlcml0ZHJ1?=
 =?utf-8?B?MkhVWmh2c2h2WXFDT0RuazBRYml2SDlCVEhqZk5QRCtIcWxVeHBtTmM1Ri96?=
 =?utf-8?B?VTByR0xSelFyQXFyZEJ4Y1JVZEYrdnhzSHowL0Q3WHl4WGdBbjRDbCtHOXFt?=
 =?utf-8?B?Tm5odE13U1dLZUhmeWpzZld6bFFXbiswNUZzSVhSdjErVG90MnhwdmNSd1Uv?=
 =?utf-8?B?SmNiT3RiRHUvSDNiQ09MMjZNZWhMSy9IS0Q1WGhXaGFwbG9vYjF3WWgxVE1P?=
 =?utf-8?B?cm1HL0xMNTZUZ0xJS0UrY2dwZ002bnZuRzNVQjdZaDI5RHVNbjRTWkozc0Fm?=
 =?utf-8?B?ZmhZdSs0NUNtOE9ZRzBKaXZYYkltNmM1akxkUmw2YWdOOGs2MVRaUHZKREVN?=
 =?utf-8?B?UzRtN1hIcVRQUzU1RitUOUV4VzhYcTRnaERxYkZvNzhsZFdLb2VzcDdRRFFD?=
 =?utf-8?B?TlJGT3lZM1AwVVE2cHdyUmZ5ZFgxbTNOWWJnc0d4K054MlhUTEY0N2IzUjZQ?=
 =?utf-8?B?SDQxeEkxeVc0NVpCaWxQdk1TQWN0QWxNZHVybTF4bTBVSVlIeWNJY081Skk3?=
 =?utf-8?Q?tUGJVIdZav4RNcvR2lcqU5mJx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R/zQjZhr1HLFVrjIurVMjAFtW+Htw8bOMBJSLW5u5chroRSQLfpE5kAufpEDW4VW/+qe99p5oAkFwU0Sw7OuS6RqIXNVn4iW7bPDN2PUjCFxSTqqt0jXI3HZW1ZsgLkcUIC1U9zzTaPWqV+QCwnxtL06dZPUGLZqyEec4FEQlrYfCQhNpUIGGfIxo6QttxRZgdB9FAfkljjaS8O8lIQjEoBpzFJWDZ5ol/knvYcfhoR/BxU2mmCOfGc8Vc/J252CY3yA0A8/TuSyKg9h+hgQo4eLNpkBGV04mk8OpUemL1Fcj7WRtJGvY7Qb5228pUqt9dwBXsB0NSJgNO++Z39KlM4CgTC88IXa+sC8vm7ZnEDb40R35TDC+mqUp+xZnlDXHGFsVwxk58VyYuGj1XN7ZRJPAKNRpfhrTvKZ0V0ARdxrRpfENI9V+0RH/Tbbnotu7fBeZJJNSGSsn8PBzzP/Qi3qeP8RN47li6L3+WSmBTOzArQ41NlsYq5+vdS3vnrTbwW6o+sED1WrXrygcMAcDFbaoYpSBWDchqy42wKPGbPGV4hlWOB0dQZ8fT47BdLAaZ6DwClqE+0nLmHla9Gi41Lbg8pcuQpXY3i7YE4TscE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e06aae-2905-4446-e4d9-08ddf54392ed
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 17:07:53.6289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LASJDa7Mxlt6qjQcJigs22Jl+umu02IEKIHGWIBffWCl7UwyhiPRh2RaRNad0s8/MkHbMLZ+76AvwTcr98dNUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6920
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=967 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509160159
X-Proofpoint-GUID: URBlPgO0PXFqxGFHA5Ajf8HjYK_S7V8T
X-Authority-Analysis: v=2.4 cv=M5RNKzws c=1 sm=1 tr=0 ts=68c99989 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=itktdKce9L7fxZB93EEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12083
X-Proofpoint-ORIG-GUID: URBlPgO0PXFqxGFHA5Ajf8HjYK_S7V8T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNiBTYWx0ZWRfX3jBEtAVnzoSK
 2BNTPw7mM0x1WVtXO0hdraOOt6m2GjN7PewNYZ4mL8f23PdZ+csQo2ZZrg6ztWvALD0ZIhexFWl
 /KRGAYOWPCgtnZrdJ09z9caIpZYq5xm0DhLdxWk0edEkqw/m8LpAlxchqQFXzHNEO3fZlP7l1zu
 OtRjnUqH88mzGhh+Hqw7xJRdRDU9bFKRb5W/ggOu2+1PB56j+N4ziO92Civ3rhH2iDbWvG9tT4M
 MyJbTZBWuhbwoF1L1GKBlDGd+gbo76qJ60jEpw65/kDOHwZFrcSwezzSg/SDn9PXGhEsCqhGRLt
 jf7/NJR+FvDyxb6WYW0RAeR+E9OKKm2YHRDFAQlZIuRZgGl299d1LZUk8zIsBM7kAkxX7eWew/f
 79lN255ahwzGwG985K5zP1FtqSY9dg==

Just cleaning up my inbox...

On 9/16/25 12:02, Kris Van Hees wrote:

> On Tue, Sep 16, 2025 at 09:17:26AM -0400, Kris Van Hees wrote:
>> Eugene: Can you test with my kvh/2.0-branch-dev branch from ca-tools4?
Yeah.  I get the same issues.
> Ah, I just took my tree, and merged dev-queue into it, and now I am seeing the
> issue pop up with tst.tid_pid.sh at least so will look at that right now.
Cool.  Let me know if you need something else.
>> On Mon, Sep 15, 2025 at 11:20:28PM -0400, Kris Van Hees wrote:
>>> Do you have the pointer subtraction patch applied before this one?
Yes.
