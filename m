Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D001FA8FB
	for <dtrace@lists.linux.dev>; Thu,  9 Jan 2025 20:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455956; cv=fail; b=bL3qsYZvIDQPofebdVlhYFMHe1SdbRNSmgc9zaJ38/LryTXhwKXzyurxnMHm9eUrZ7oLBUAWkjSunooN687VL9YgdpXESYcL3jPK/SuprItKIVQSj4XGSzCnUhke7v80w17oaJrT5h7gXJXuyDApKq80QAIRylX5dke/1+ilmDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455956; c=relaxed/simple;
	bh=tsYLT1R6t+tM3mNOwmEJigiwA2/9g8N6Zbi8nAF/mXA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C0aAlIQ9w7hc4aO/ZJ+QgqIZAVBksJdLwFCWD0fMvr9PU9p/NOic0/uScZu2L3oYXJPfHW2l65egWQKExjA68/Nj0XK2qQMbN1eyqDrWMAE5FSWIWgCPNW4SP0OHSxsV8sl1CuttGjsPDNEiDJQZkLlnwElimhMZhW1xkNWOnfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z2gpToGJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=o610ILRM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z2gpToGJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="o610ILRM"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509GXmJe019609
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 20:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=fZaUq3nLzyfn98GSg3qVoQeHirB5253V5SIz2iebwss=; b=
	Z2gpToGJFmm0O1w1z+2Q6Gx0ysX1rh4TCTjimMNvyXTHtkNlGZGrz2rff1z5DgTb
	fymppU+v4C4QRbIdG/Aeg9eq6WCg8Ho3YfH+RKio1GZA08utPZwL2pExWGxSuZu4
	PnFMBXctpRaCiN7d92FGZbnUZRIGSnfHz8vyNfJEDlEYSHGhueZGZK8ZlGYqYZJH
	IGF4s9oByid449sgtQCq6rCk3kqkH098OHWJDpmFWbsvZCl1F1Fl10A/bnTARTgD
	yLWXZ2czPL4pfEfwGfLOTagGT5BViaKrU6VBBAQ4sHcfU8lsdifQDQHm5q03wrnM
	94S4gJXta0scLA+qhfhw3w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xw1c1p1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 20:52:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 509KKVYc027555
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 20:52:32 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xueburma-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 20:52:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfiMlPHEWs1//xB2/2wmDAIVj1EbQz09y2ZGtoVj4POUZLytndcEn6lscBH5VZZvYOFUdjGmLXjXPFKs5TGUaSw9PZVXNfM6Vk6dzNrCdr/16F/cfwE0I69q37hDkfQIMWbuqEcZbeXdLs8el1B8mceeTW7Zslw/UBAnUt1aK98h9Mqf5OWkLq5RippyjLHMfPHI47RqY27xz9IgkE09aULGn5NJCl64rfFTBOYkty9QKaL4AzKXgzqAL3JvsbYfVcD1muiwq59ZX34bVGKABw5nozgBuwAmmiLs4D1Ur+Pe4cn9dBCLdz2JibeIaskoeoq39rLp1NzWowdQ0ftagA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZaUq3nLzyfn98GSg3qVoQeHirB5253V5SIz2iebwss=;
 b=lI5ME6HP5JPDA5PhPXLamhvbnCPhLQJybTZptorCaAX0jnHuYoR2cTJUf3LOvIGMbOFGKNr7STuif+TnLPfBtDy6H65/qHedFkNfAacdtHe6Uu3KBbmF0ZvlOVAkcCtMWNz29iNVSenxKSuiHQ0RLHu1hjTeLUIn6GW41TtwpSMMAAvl4iYx6Xg5Oj7J0ufMfwp1uTKiq3MHen+9RNlCxsuM0U6gb+ZzdNb/qLRFkDxU1LxzQZYM0WIo8GzQmn9UUPvVj3lXEbzLOTIIyfNx6neOtVyZufYNyKy7rVR9J6oNmATNJspH37iggR3xv9El0KMluymlVovya6QirAt6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZaUq3nLzyfn98GSg3qVoQeHirB5253V5SIz2iebwss=;
 b=o610ILRMV3G0psH4/pf57dofDWwN/7HLXx6nfX0wOrR7D+QRtyy8dkqBB6U1GuXmPUJqE4hW06sq8cMp/qQSNQgS0dnnVgw5AKAZH2NfC6I8mpMNqs3H1iZ2npGqSU8uEffvTmpmg1NntzVHhclIGKsFQRe2ocCaAffZqz0mc4c=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7669.namprd10.prod.outlook.com (2603:10b6:a03:542::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 20:52:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8335.012; Thu, 9 Jan 2025
 20:52:30 +0000
Message-ID: <68af528d-8dbd-f081-835a-d92b42e3045e@oracle.com>
Date: Thu, 9 Jan 2025 15:52:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 6/6] Add support for pid function "-" with
 absolute offset
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241220222716.18511-1-eugene.loh@oracle.com>
 <20241220222716.18511-6-eugene.loh@oracle.com> <Z4Afgp96zlq1g5Jf@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z4Afgp96zlq1g5Jf@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: e5127e5f-4254-4130-fa95-08dd30ef8851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHpFalBUbktYZDhNM3l6R1BZL0FSWDBuemhGNUhiamRhQ3YwbjBZRk4rdmgy?=
 =?utf-8?B?bjhMelVuamN5Q1l2RzU2TUE0dkt3Y3RlRzhYc2FqRFBKVFZIa3VocUR4SFVy?=
 =?utf-8?B?WDltOXh4RDVUSjBscmhDeEFhMTJYVWw3QWZlWTFQaDMvYUpjUUhZcGlySWo0?=
 =?utf-8?B?V2FLZThERHZXNlRQT3JFZGd1VE8zeU9PV3RmMVVNbWN0YzlSN2RpQ1Q3bWVH?=
 =?utf-8?B?V05BK0JhbUFzTFFZbTRYWE5ETDA2STBtZEE2V2E4eGxRbGhPdUF5ZWdkQTlV?=
 =?utf-8?B?K1B0YzVLZW1HMUxYK3pVREp6N0VRTEFNd1ZOei85V3JpUjloZ0FNU2w0WWMw?=
 =?utf-8?B?V3hBOGEybGxiQ1RFeFpyeUtnVFl1bHkzVStIODh2UnVCUkFRTUtFcnBhV2d0?=
 =?utf-8?B?MDYzUGZLVHF2Q1VzajRabjNBMDU0U0V0L3pmaW1jcjdON3ZpbGt3MHVNMXRr?=
 =?utf-8?B?cjZFU2U2N2JqWW5XUDZNTWw3eGp4alA1OER3cy9PK0NibzJ2enUzME9KcnBM?=
 =?utf-8?B?OFpEakFCVjVISFlubk11RkNBV3pka1RnY1lTZTU5Nk1GeDZHMEhsSFNZYU5O?=
 =?utf-8?B?LzVaakhwNVZ0UkhMdVcvWFBmNVcyTnZpRnRydjBoNUo0QnVOYkhkdlVEMVFa?=
 =?utf-8?B?KzFWVnFwc0tVTlpSM3FkNEdWVVJNRkxHeXNVdDhoMkdnNHlyamk1Rzh6Zk5i?=
 =?utf-8?B?ckRVWkFlQTJXcXN2d2pWZmMyK290QXdkcGlrRFk2UVh0VmF3dTA3bUlJYm5p?=
 =?utf-8?B?Tk5wZ0FyQ3lyQXA5WXJUcmJOOGF5ZHJWbi9oVnp5cGhQMWRCRWZoU1IwR0tD?=
 =?utf-8?B?NnBETkJQUVpiVitvT3BTKzhHem9KRlBuL1ZwekRIMWdwbmVPbFNVbjR0eDJC?=
 =?utf-8?B?ZkNTUEJlTGZObnA0ZmUyRlNyOFRmQ2VnWlRBejlrMTZSOGd3ZTloa2JzSUR4?=
 =?utf-8?B?MG1NeE1tNlBpb1BEYW5RMTFxbHB3WnUwbDFhVzVlckJPVE1IcFROS1dnSjNr?=
 =?utf-8?B?YkpvdjBYaFgvcmNoSmJNQzAvRTlPQ0xKTWRQdFRkVGhwY3h1VGhWSndrbHFF?=
 =?utf-8?B?eFV1TUVVWUZKcG9xVElNbXBKT3FpbXpsa09KNUZReHFzU2FnSklZcE13ZWsz?=
 =?utf-8?B?Z1phYmNyQlNURzRTb1RXVitaRStPeENWZzJYMmFubG5kSnpsSFh0UjI1dVJI?=
 =?utf-8?B?enJMaXJxNjNlMUYzYlRmSUhzaHZJNDk5S0ZjbEtDLytyRTBwbnVKRDZ1eENL?=
 =?utf-8?B?K0JGeWRHWlZneXNhU0J2dHoxWHV5VWFROXQrKysrZE5va3poKzFvdGt0cEdQ?=
 =?utf-8?B?aXFHOTcyYWx5TDhKeWpHbUVJOFkrVEM1WDA4S0E5UWlkODFDUGxicGtuWW5y?=
 =?utf-8?B?Tzg0ekErTlZnNVBrU3pWRmZtUkZGbEZoSGorSXhjZ2FVLy9HYnVWbElKZWhs?=
 =?utf-8?B?ZDVNYkRnMzkrVkQ2by9hMjVJUGNtYXNaaFgwZUJIbWVZQlJTcnZYWVpqTWxy?=
 =?utf-8?B?MG0rVVhIQklxMkRGeXFXNGtPL3o2LzBRU3M5bE5CTUJKaGR2dW5RMVZWVlNo?=
 =?utf-8?B?UnQ5OVlxaUpMRDBHS1plYU5MVituWk5LQUJieFQ2UUFOdG5aMnJ5R2IrdTk5?=
 =?utf-8?B?VzJUaG5TdjNGempOQ2lYZkQvd0J0bnhzdXlWekhmUFZ2RTlNVmxZcVNRTVFX?=
 =?utf-8?B?VU9ka0o4YStvRlBJUXFyNFQ0NW1WTnYwdDBSOFM1MzhISndDYWtYWkVwQ05G?=
 =?utf-8?B?VWV3dWt6ek9YRnlVVjIrRXhUc0k2ckYzZWV5djRoSDkyOUQxRDgyVDBibXl6?=
 =?utf-8?B?dU0xNmlVQzBJQ00yckFuZm92a0JUbXZtbnZZdlpsdUdIWjJ6MVNwSG1SeFJQ?=
 =?utf-8?Q?5ygaJfLaa5CjI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1VhakVZTzNlT1p2eTJzbE0yZkNuWkdhY0MxYis5Nk1UbmFoVldHaVk5ZkVj?=
 =?utf-8?B?V2I4eEtxNXdhT1Bic2laUVV1MUVrU3BSaUNuQnNhRUFBeVBoSjVPbFg0eWtT?=
 =?utf-8?B?VlVubkQ5RGl0aGlYTUREdmU3anJKa1pQM3lYZEVKeGdVakJCTUM0emViV1dn?=
 =?utf-8?B?RGpqV3BqTWVxRzlWR0kzQURkdERGRGc3N1o2dlg0UlZXMEtwN1JVZ0xzSnBh?=
 =?utf-8?B?VzJRdUVHTlllYnI2VnRrdTBxdnJ4Z3lrZUhFZVRHVlQ5WlBDa1VNUnAwYk9Q?=
 =?utf-8?B?Mm5CQ09ZeERGUHdNSFlkZU5TUEw2NXNmcHlsSmRBNTJseUdmazlGZTdCb3JU?=
 =?utf-8?B?N281Z1JUSTBVeGNDQ3JUcGR3eDI5cm1Mc1djV0dibFlPdGVCTjNJMy9wYWg3?=
 =?utf-8?B?anNHRmIyS1JuRWVHc3hGZlJYS1IrMDllMm1CY3RXbXNHZFd4Y2xaNHQ5ck5Q?=
 =?utf-8?B?OHB4a2twQko4RzVwRU41WGhOY0FiQUlOWXVkY2xNSFRlKzhXMDhTa01wbjI3?=
 =?utf-8?B?QWRNczVrUTMvYmZZQ05nSmFZdUZmTC9vYlo4dDk5bGFFOXJFclhHNkd6ak83?=
 =?utf-8?B?a0R2K0ZITkRCbklSYmtPOWRvelFvZE0zaXhvaFZ5TjdEbHJUaVRXQmplbTFN?=
 =?utf-8?B?bnBwODhVTTJWdkdIbm5KYktIUjFLTldYTncxdWZUUS9lcG1lbGluZnF6bVo1?=
 =?utf-8?B?akJCOUUrWVVpR0RLdWZoQWdDTjM1Y0o3Y3lFazZQZWo4Ym1Jekh2SWVFcXZ4?=
 =?utf-8?B?blBCN09XNGd0RGFXdlljQTFnQkY5U0YxZUUzSWhrbGFCWVZaeFdSdzVPTG5a?=
 =?utf-8?B?bHFTNmQ1T1ZWZ2IreGE5RFA3VXdHeFpNK28vR3J5WThYb0RqcWpIYml2ZGYr?=
 =?utf-8?B?aTFaVUJqR0FnSkpyRHFoanZkYzVwTjFMdVg2bEpHYlJrbEFBRUxHa1gzUFl5?=
 =?utf-8?B?YTAzREtDZ1RvUmYrTlFuY2ZxclRTSHJCVW1sM2ZjS0lnL2YxVWdZNnJqTTE5?=
 =?utf-8?B?Mk0yT1hxMlZFZlIyZnV1Q1BLOHY3eVdyN1BOb0VtUlFTMnhIa2hqZ0JXSThw?=
 =?utf-8?B?RTZZU2hsRGVaSW10dVlxeEM3U0w5OFBybzdnWGQ4SHY1Sm1mTEJiWDI0UHV1?=
 =?utf-8?B?dU91cTBhYjJ1Z2ppNW0reTh1Tkg3VjdkTWc3MFFyUzNtTjhLYm1RVmF4S1F0?=
 =?utf-8?B?Qi8wTWVCdUdtSmVNSEczck5OTlJxUlY4L1VmQVpxcXc0WWtMRjA0bVhJR0o2?=
 =?utf-8?B?OTYvNkpVZTREd0xlQkMydE9HZ3ZyV0Z5aGdmSjBESFRqT2tQK0VLMDgycHJZ?=
 =?utf-8?B?QTJHR3JabytxZld0cERESlJ3WW00Q2lzb1g4UlR0bEJoU0lEL3FhV1VEbEdM?=
 =?utf-8?B?TVl4S0t1SjhHc2xSY3JRdmE0M0ttSGQyUk5sMzFZQnBFYlUrNjRqMFNQYXlx?=
 =?utf-8?B?UzlETDdOSU5sWHF6ZHROSXRZV2ZpSE1adEtOcE80N2VrZEtZTHV1aVhhcG5F?=
 =?utf-8?B?RFNHNDhmRXdvZFFxV3RzWDBYNEpDc1h1VU1wTURSMnVqdFh4TnpYbVZBMFdq?=
 =?utf-8?B?bllTa1JLMVZ3SjhFTjBsR3cxSWJTM0RuWVltZFM4Z3B6clhXWk1VbFc5Ulhp?=
 =?utf-8?B?VElwTmx1RmZybk9jNEF0VUJmVFJkejJ0OUZuMnZPN0JiZDFkNmFGUUcyUkZO?=
 =?utf-8?B?ZURSRm8yUGRKM0NrTDg1UDE1THV5VmJaeU5RTEVxTFIzUTNselJpazFJNm9U?=
 =?utf-8?B?YVF2OFFKcUhzZHllQnFtT3hGSkZEQjk2dGZ2VHU2MEtRTGVETkRta3R0M0Ew?=
 =?utf-8?B?QytCc3BnR2s3cGxSdHNVNS9TU0hYNjNlS1BPMzFSeFMwaTZXcFFSZlpSYU1p?=
 =?utf-8?B?ZVNWMTMwWWFuVFNUM3p2bkVxemJjS0ozL0pBZVlQRzZRVWQydk1XY1pGekha?=
 =?utf-8?B?VlNrMDEybmRNcWFDbmZiclhOUkRzVEhZaDJJNlNwTm9waVl3VGdvdlhoTUN3?=
 =?utf-8?B?WTBwTzRLT1VsUkkzQlVZaEJiSXFvaEpzNDdCcFdzOVp3NFltQlM4OVZJdDgr?=
 =?utf-8?B?ZEdFMCs1Q3JScGtNakVQQW94VkpUWVN0c2xsSzdZb1hCTUlzayt4ZG4vVUx0?=
 =?utf-8?Q?R25B9A7lkslVhSvBPv1M58eop?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FZKcX7ImxiLVMdyR669qxVKmevuPW7oqLaINupUmEViuLcR6CvQhcvc7ZDfEyC0GxezZ5g7lxNZijHdBXPYAWQx/wNFWuG+7OIqvhVf1Oj5FxsCklyC18XnSrHMzka4qn7V4wDetM/kljjPIC3Iu2O0BUun1z3oN8DPDiB1HC89u0nSVNVn9KUH1r8dZBnnE73ZYFAcwdBc4ZYO7hMfg5TZC733Q3lFdZAZyDgItVcw4RgX2aXglYHM0zrna6Z29BQFECzde3A2Pf2+LH6Jnfjq+4lRtdw6xrcchsArM5XgSjF+7Kw159SRcHQ1lhfiBjqo5YR4zgYHTzElbpKcs2eDvD2bB3iqLX0o+ijX+yfzWw8ebh7ef1XbTor7x9xdv0oKK0zSkeuUG3CNuRwF4iwcTUdAdRIwRtjsl1LayuODLjASYm1HtTAfX3ZQusaQc9c8aWOWQh5c6cJrZ75/sMsmhQCo6P4p4fDi1Xh75oafQz2e88n/+RKCz8CsdJv8bgw7lQV63EVVJ+DKO4k6tYHPWWtudDUICof4ez0O7+OZVwnSgH7AYWndJpdDfOGkzi8FGd9G4wWMe/cl7cy9eKd1XQQU3jea61QXTP5ZaKyE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5127e5f-4254-4130-fa95-08dd30ef8851
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 20:52:30.0477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWon88727siXcJcJt1ycZLPYW2dSNHQMNK3Ftq4oxtik+Lr+Hr1E0WV3Izd23J6+XSaXU09WwMQ5auDkpAORPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7669
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_09,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090164
X-Proofpoint-ORIG-GUID: 1P456ffaXfzXeuwen00P1kspdaKvma0_
X-Proofpoint-GUID: 1P456ffaXfzXeuwen00P1kspdaKvma0_

On 1/9/25 14:12, Kris Van Hees wrote:

> On Fri, Dec 20, 2024 at 05:27:16PM -0500, eugene.loh--- via DTrace-devel wrote:
>> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
>> @@ -47,6 +47,7 @@ typedef struct pid_probespec {
>>   	/*
>>   	 * Fields below this point do not apply to underlying probes.
>>   	 */
>> +	int pps_absoff;				/* use "-" for overlying probe function */
> Why use this?  All you do with it is record that func is "-", and then later
> in the pid provider, you actually use that to force the function name in the
> probe description to be "-".  But that function name in the probe desc is (in
> the pid provider) already coming from pps_fun, and the code was already
> assigning func to pps_fun, so it would be "-" anyway.  So the pps_absoff seems
> to serve no purpose, and you could just rely on pps_fun being "-" when needed.

Yeah, good point.  Let me see if I can remember/understand/explain 
what's going on here.

In essence, the problem is we have to pass two function names:  "-" (for 
the overlying probe) and the actual function name (for the underlying 
probe);  up until now, they were both the same.  I tossed around 
different ideas for this.  E.g., pass two function names in. Or, get the 
actual function name inside dt_prov_uprobe.  It seemed to make most 
sense (given the alternatives) to pass in the actual function name and 
add this flag to say when the overlying probe's function name should be 
"-".  Does that make sense?

Note that pps_fun is not "-".  Although we set it to func ("-"), the 
code that processes this case then fills pps_fun in with the actual 
function name.  Again, one option is not to do this until 
dt_prov_uprobe.c, but that introduces some other hassles.

>>   	pid_t pps_pid;				/* task PID */
>>   	uint64_t pps_nameoff;			/* offset to use for name */
>>   } pid_probespec_t;
>> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
>> @@ -182,8 +181,50 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>>   	psp->pps_fun = (char *) func;
>>   	psp->pps_nameoff = 0;
>>   	psp->pps_off = symp->st_value - pp->dpp_vaddr;
>> +	psp->pps_absoff = 0;
>>   
>> -	if (!isdash && gmatch("return", pp->dpp_name)) {
>> +	/*
>> +	 * The special function "-" means the probe name is an absolute
>> +	 * virtual address.
>> +	 */
>> +	if (strcmp("-", func) == 0) {
>> +		char *end;
>> +		GElf_Sym sym;
>> +
>> +		off = strtoull(pp->dpp_name, &end, 16);
>> +
>> +		psp->pps_absoff = 1;
>> +		psp->pps_nameoff = off;
>> +
>> +		if (dt_Plookup_by_addr(dtp, pid, off, (const char **)&psp->pps_fun, &sym)) {
>> +			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
>> +			     "failed to lookup 0x%lx in module '%s'", off, pp->dpp_mod);
>> +			if (psp->pps_fun != func && psp->pps_fun != NULL)
>> +				free(psp->pps_fun);
>> +			goto out;
>> +		}
>> +
>> +		psp->pps_prb = (char*)pp->dpp_name;  // make sure dt_prov_uprobe uses it
>> +		psp->pps_off = off - sym.st_value;   // make sure dt_prov_uprobe uses it // dump this
>> +		psp->pps_off = off - pp->dpp_vaddr;  // make sure dt_prov_uprobe uses it
>> +
>> +		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_OFFSETS) < 0)
>> +			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_CREATEFAIL,
>> +			    "failed to create probes at '%s+0x%llx': %s",
>> +			    func, (unsigned long long)off, dtrace_errmsg(dtp, dtrace_errno(dtp)));
>> +		else
>> +			pp->dpp_nmatches++;
>> +		free(psp->pps_fun);
>> +		goto out;
>> +	}
>> +
>> +	if (gmatch("return", pp->dpp_name)) {
>>   		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_RETURN) < 0) {
>>   			rc = dt_pid_error(
>>   				dtp, pcb, dpr, D_PROC_CREATEFAIL,
>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> index acf1c914f..ae4b262ac 100644
>> --- a/libdtrace/dt_prov_uprobe.c
>> +++ b/libdtrace/dt_prov_uprobe.c
>> @@ -735,7 +735,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>>   	pd.id = DTRACE_IDNONE;
>>   	pd.prv = prv;
>>   	pd.mod = psp->pps_mod;
>> -	pd.fun = psp->pps_fun;
>> +	pd.fun = psp->pps_absoff ? "-" : psp->pps_fun;
>>   	pd.prb = prb;
>>   
>>   	/* Get (or create) the provider for the PID of the probe. */
