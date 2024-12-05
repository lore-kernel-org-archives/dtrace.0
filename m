Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676E65028C
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 21:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733432522; cv=fail; b=urt9z+7Lh5Isrfkf85cs1R/LHOq+oU1cGGrkNbl20FbVrRMoBiyQDCOZuKDbZSUyEXiX1A3POQbOg74Q4x4ErSM/rqg1E8Eo0/J5lisYwSW0bX7wKu1iadeXK6AGY/eByt8fFjfwp1hJvazLQEfumLehIv7EtnSK7ujnoPr4IDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733432522; c=relaxed/simple;
	bh=5N9UXdxJvEtBLr/QrWC7Zns2TOfPeGw9qYi2H5BsyD4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QDn8pVyizp2RaRAhQVnVazCNeQk22YD2myCq39OtHEl3ib77qAbz9PQ56RIAUMhauByU+CYvBBunbuEbhlCEw2tbq6/UhpHOditqK5PtG8Zr2k0dSWBFlF4nbiUHRAMszclTyp+1zHdT5mzGclkv5MnNxzgdm5Cvf2a30sw1jao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bIOsu8HU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jZQDP44B; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bIOsu8HU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jZQDP44B"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5KMwDJ003693
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 21:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=J6f7T8uyswBSkDIInwHcbN3H4JgBtIEgwJeijKvedOM=; b=
	bIOsu8HU+ETqATcs82QANeqRcefZViV8AFan4c1FyXgyDtHhwz+NS+wJH31JqADy
	ggwSNeiuI6hVPI/mRijh+FELx4xXg2bS40arHTlAHxHwdFgOVn/ga4wRWho+njfu
	uFDZdFKMsJWMJaDXjDVTqauiAztAVq2xx5viZ61BvQ2dAVSPgQ/DknEHrkko9ZPR
	wZ5wvRnQ7bK+zroQgXHNab6ak1Ne+uX8jU9x04+SAGjIhpWFT5Migm5jO6Is4LWy
	R8MZayPKrWdOAxpdILlgvsu9vmDUGLmyoCygD50JnjK8RTv8KBTTd/bwUoCwzhIR
	76IHdje2AX/bMCaOGr3R9g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sg2c2rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 21:01:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5KFR6Z001449
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 21:01:57 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s5bevvb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 21:01:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+1AUcm6Dj9/dSN93GDJ7A1GYD7tMZW4UBmU0I85TUlL0Pzm/Fi5jTSaHsh9Q/AvOUX2jAOZnxhsd6p2mN61c17L8c7jk8Qs9nOe7Y3VAxZkQ/kSWgYTK61vFP5yId9UHKHsWfNoXVqR6zaqI/HZRPyhouqviqoc1gNJcHctIJH6DrthGKBKhwK+Jvw4cTXbzhspHpWY8sAo03IIUDOE1jC/pFqPYhodr0wOl93HDgtE1Iz7J59+KMJrFUXBL6Y/PIcO1KndEtJWahmUmhOlPGnVHc8UjkFNZ/4DWgZ4sNMkYDTauLcafQGJ+yEJt+85KGljwYwdPWhxHgXi6wGd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6f7T8uyswBSkDIInwHcbN3H4JgBtIEgwJeijKvedOM=;
 b=jjd9HwOTeyXMqWKgg7+s8UDOSBP9f0avBWfuX6+94KKkXa8WCexBoB2BxmzEPRbBRhc62hbb1lX7tS2Dfxwz6Go3H0teryCzMOnMkSmlIxS1iR1Pb+ztcRFglNFVYv01trDv+fStBLT1U8u8aRSqIbzVP0QzIDzp0qHiutCFv0uyKtnF5N8v6639mDz07gkLXOSqTpqtK7jtOPjnjrfA5GFiLvJ+6uyuBDtGMKxe5upo/OZtm2ik8AOKpIjvpewrQ+rhd7Wdm5EnnWraKbfShLRK3HhCBneINTMqsLjiTQYVwZM0DSCk4xomyou+xJyfsRkQni7x7/WSlWOBBK47CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6f7T8uyswBSkDIInwHcbN3H4JgBtIEgwJeijKvedOM=;
 b=jZQDP44BHJvYU3b798D0lodCj2zvCYZ2sW8RLdg9Vm+I9KwoqbUG1bEGt0nqVOks91B9x2KXnRyGJ1QlCxArS1ffo15XS/lzYxvZz1Lc/RntAw3uxh5CmAYNz42aww2C1wI3Ls0dcrr7ZJRCeUTpr9SNEi5YbGspY0ayU6c3MsM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB7346.namprd10.prod.outlook.com (2603:10b6:8:eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.23; Thu, 5 Dec
 2024 21:01:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 21:01:53 +0000
Message-ID: <e064476e-a5cd-6859-1522-71e52a2ed08a@oracle.com>
Date: Thu, 5 Dec 2024 16:01:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/4] tp: clean up the API
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8SPRMB0037BB841D92FF399CBE8877C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8SPRMB0037BB841D92FF399CBE8877C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:332::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb23d39-2f1d-43f2-efc0-08dd15700b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmQvektvOWZyZGYwMjVLU0NjT0wyeE9QQUNlY0pIZ0I2YXdDQ2ZvdENidzU5?=
 =?utf-8?B?RTJFaXhENWh3QlN1WEF3NjlhUG03bGhHcEFPT0xoL2ZTckt2amNiMVZUU3BE?=
 =?utf-8?B?MzM1b2lIUWNRell6dUY1SGFtMHdUQkc1TUhYM2tKRE9iN01PZ1dtYmpSOEJo?=
 =?utf-8?B?UTF3YjdHTXAwQk1MMVZmWFAxZ2VMK0VVdThYSFYzR2h0VGdyTnEwVlZxZURn?=
 =?utf-8?B?WUg2Wmd2bERSWmZ6Y1JVYnFTZExXQTZucVNKa1Y4OTVqVjRqS2FIRmZoR2Vl?=
 =?utf-8?B?QWhrVWtkblRaLytVaGZjdnVaQ2FsMk8vdWVKelFBaXFYZHFTR01ub2FSbkp6?=
 =?utf-8?B?NHlpeFJJV2RwQUk0MUlicm1XdkFkQ1A3dnNyZk1SaTQ1dEJNS2phRWpGaVFI?=
 =?utf-8?B?OGJ5TmtqdzcxMlZIMTZKV0E3T3k0SlppVGpkR29jQVpNT2dPVG1laTFvQWZH?=
 =?utf-8?B?YXhYYTdmdGtsaGdydkFDTTRWbkE2dmsvUjd2ZENCMXRSRUxXZmZDRThzdWxP?=
 =?utf-8?B?WHNXb2laazZrbFVMUUpNZU1lOEh1ZWtybFBrNUhlQnpYcVNUeFBwS2kwazF5?=
 =?utf-8?B?TDg0OFk1RmlCR2Ryam5XMHl1RE9mSXhrV21RKzZ5UDc5bVZsaHdtWTNUUWVL?=
 =?utf-8?B?dkFjeHJNSDI5Q2dldk1iR25FMU0zSU0wNThkRU5VSDYxQkZ6THhySXlrMmQ1?=
 =?utf-8?B?RmNqUmUvanBabkpjcVFVa0thNXRMekYzZUMyYk1YRHlJc0gxK2w4MTZlM1Ir?=
 =?utf-8?B?enNlWTJTeHdBY09LdW1mR3c3b0EyUWdsajcyN2dEdUk5dnJMNkFEL0FuY3lC?=
 =?utf-8?B?M1dJaTArc3dQOGREUFpHOWNOQUN4ZU1BZWlzNDJmQXdHQU5hdEZQc24vNU9L?=
 =?utf-8?B?ZWFHVllaUmp6S1Z5QlNJTEpzaElIRG0zMU53YkFscjhraHl3cEJQS0VKYVpl?=
 =?utf-8?B?bFRscXFUOGZpcXQ0NEpUQXd3V0owVFA5YnRab1RiYkMvSDJmajlXdWtQUkhU?=
 =?utf-8?B?RjY5NFdWbWFjLzB5OEQ5Nmg2Q1ZYUGhyRVFoUytlNzl5ZHJHNE1HbnZIcG1s?=
 =?utf-8?B?cHdONWRSSnVWWTNrbTlnaG9CQ01WSU5xZmlsNmIxS05INnJ5SVhpTlhRczAw?=
 =?utf-8?B?b0NVZVBmQ2JFamZzZmNqRnBSOGhFdUd4MXFEMTE1VVorSlY1bEJoYUdwNk1T?=
 =?utf-8?B?aGdoV3VUanM3elRwWVFmMHJmSU94YzJ1ei85VERpZndWQ3gvM0J5WGpnWnFx?=
 =?utf-8?B?S1Z5ZjNPQTRwcXpBUGlDbXRRM1p4b2lyUTNhbDNoaDh2THJwazBUeng3WW9V?=
 =?utf-8?B?V0x0T01jSWMrWmRhU2dPdnlvck0vRVBQMUptakYxMWFkU0ExY3BYU3E4UHBX?=
 =?utf-8?B?N3RsaHE0a3FIQjR1UW5mYWk3bUZ1SGlUb0IxaFZCbE9vWmJrcU5oa2ExMUM5?=
 =?utf-8?B?WFFtdFZMUGI5TTRvN1JlZW1HYUZBczlCQlJSWFlZYTh0L0dPY0xjQUdPZ1A0?=
 =?utf-8?B?M0MrNmF3aXFVaFVicXZNSW1ld3B3TVNYd1gyU0EyVEVEeDM4VFh3ZWRsaExT?=
 =?utf-8?B?WUZQRExNUWl4Z2EzNm0xU3NOVXUrL3g0QWpZaXRxUVRidWRuTXdaMytnUlZp?=
 =?utf-8?B?elQvTm5GWlBUYW81OER3Q0s2ZUNXUVpwZ3lHWmhvWVlXelIyOTJ4MlhnYjF1?=
 =?utf-8?B?MTlaRHVGY1hML01NS2xZVEY2alAzdWgxTmR5d21XemFQV1FwaFN1bTlvbFov?=
 =?utf-8?B?cjlrcHBGamd2OWpaNXlRSDlNM2dDcmVTa0JCZEVtYnVYNmdKNCtHY0NxVU9K?=
 =?utf-8?B?SWZCWlhFaG9jRTl1V080UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWJOWjliOXIxMVBhZXJjZlIyYUlIclRVcDIzSDdOd2JJbDFob3NDaE15SWZQ?=
 =?utf-8?B?dmlOYTVXRjZndUJha29EOU1PV0pteTZwcW9HbThHelE0bmc1S05Jb3c1UllJ?=
 =?utf-8?B?UzJKWVZYbTFVMW02WlllRHg4VjBKaDFRUk9KbkptQ2dMSUJXbGs2Uys2U3hw?=
 =?utf-8?B?bXlybTNsZ3ltOTBDOXlRLzU5TEsvcVJUNkJncUMwOGw4YmV6Q2NNRzVQZG1G?=
 =?utf-8?B?ZGVoTUo0NDVjbWdZWG43UkRiV0lZeXo2OXNKd3Q2Zy9nU3hwMTlMNmtOQU5P?=
 =?utf-8?B?TkRIQU9PM3J5bHNGZ0hPYUU5Nld4UWFGd3VVOW9tVmhBeklMZkJrNzJPOE5S?=
 =?utf-8?B?MEJZTU5nWEtlb0FnTjBrOHNQQVFHSUR5anF0TFFkZnU2M2ZWQytaeEdjQzhI?=
 =?utf-8?B?eXZwbXJSaE82cTdOUVhFMHdUb0l2c0Zic1lBZWVqQkJ0RWMzWkllMmNIM3Ro?=
 =?utf-8?B?SGFOaTFPOUwzUFFQZTBhVEtnc3dRNHpFMmdPNllnTmVrYWYweFFYK2IzOERo?=
 =?utf-8?B?T0Y1eU5mRURJTWtvN295eHk3dndMK3FIT29FVkNicDBNTG9jMlExeHBRTitR?=
 =?utf-8?B?SDI4OGtUTnc0aUI2RG5RMTJVcXl0bVptZzhUVEJSQWVRK3RheVk5TEFpUGwr?=
 =?utf-8?B?TmtYb0hWRmJEUmR5Vy85cm41RXRIdFFwcjN2eDJ0eFF5NXZKQnVRNDdZTmhr?=
 =?utf-8?B?ZmpXVENnU1lYWXNMSGxVUlRKL3BjTWthYnNUcXdZc3NPVkFvWUVYVzRxZGJW?=
 =?utf-8?B?ZHJHUUJnK0xUa2oybWdwc0hIejJUMlRJZDZDTWo4Ui9JSkN4c0UwT09ORTd4?=
 =?utf-8?B?NTFpd0daNG5hQkJ0S0NsSzFibjJxcWJ3dCtRa1c3N3djelJTRWFhNmJmbU1N?=
 =?utf-8?B?c1FySy9hSDYraDRiUDBIdTMrd2g5YWhGYWxIK2ozNitqanBaTjMxdXVQazNm?=
 =?utf-8?B?aTFuREl3Q2J4YzBzNXowR01qRUxnQ3JlUUh6UVlsRzc5RW5uZUowMTFiQUMy?=
 =?utf-8?B?aGNlVWFXYUpHUzZhQ015eFFPVzByQzZlWnRqL2REOHJtT0R6TExPMGJLcnFy?=
 =?utf-8?B?TDNpNnNKL0JkNDhJY3hSK1JSM2poNFNWZkdKZG9BaWRjSmxodTFZQmRyb1BB?=
 =?utf-8?B?K3pCc211TGFJdFJ6QlFiOGpOcWcrN3FWZHdBTWowZUd2cTgwWlVJNlN5b056?=
 =?utf-8?B?aFBwUDdmNEF0VzlOZjdtYkw1dnNBVzNsWDU4NUhIYVN0REJ5d0RRNmtCUDdF?=
 =?utf-8?B?cm12S3o2UEt2aUJkQ2RadjRhZWFlZ0tvSTBjR0FSRXBXWmpiSzZTYk5sK210?=
 =?utf-8?B?YUZBR29JRFhJWWxwNndRZlF3dUZOcmNKVXVES0ZaZHpJd0wxSWg1RXNWaFZt?=
 =?utf-8?B?SUJnSnZLL3JyWGVWNlpiYjB0VEM2Rjhjb2VDUXd4SnBWQWRwemp4TVFhSHAv?=
 =?utf-8?B?ZjVQS3haZ1RLVEhyek0zQjNDVVBsWjhnK0c1OVRRM040d3NiMWFUZXNKUkFr?=
 =?utf-8?B?SlEyR0twb1NlMVpydU4vdVVUUFlFY1ZPMnBlbVIzVmMzUXUwdHJzdWZmaHJn?=
 =?utf-8?B?VkI5d0llaU05SkM2dFNwaVE3bGszSWFsckhIbkZTMlAzZkJ6dEVGSW02WFBM?=
 =?utf-8?B?bUpINVcwdjNocEtWcmowNHhjMVRlejlocmZpMS8wNFMyeXcwUVdCSUMxVFdS?=
 =?utf-8?B?RDByUUxmckRQNGtMcU4rVUNQejBXT0cyTFUxSGMwaTE1MEZuT2swNXhVQjZ3?=
 =?utf-8?B?SEl3ekZqZnFjVmEyZ2ZpWnRET0F0dGp3Uk5VTXZnY1ZmOVM0WSs1UUs2N3NE?=
 =?utf-8?B?cnJlOGRYcHlnUmttSW00QzZ0M0oydGYvNkZHVnlrSzNKZDFpRXRaNzQ1SnZ5?=
 =?utf-8?B?VWRtUkxuVGxrRXhxUGNQWExIU1hXazFsTzVoTURMTy9POGhtdzU4aWhLTkNO?=
 =?utf-8?B?TjdRSFB4RW4vbUZYeEwzcFBBa2lBTnBUN3hMY0VEcnBscDFKMDJ3UDRSUThn?=
 =?utf-8?B?UzNKRktZR1paTzZBSmVzMUw5UWl6VWZUaDNuVVhIZU04WkpyMVZ3WDQvWit1?=
 =?utf-8?B?aTNhbFV1SUkxYW4wODBQN2lwZUZiRjFDVisvTTZtUUgzaGM1NnBDSEhIak1x?=
 =?utf-8?Q?POrSCraQxas/lseRGN9NFbwSL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W0fCqLpqjRDKmAwdzBQfRHzh/himnUPsVEz41PsE3m9CO0WfbBO31gYJXX1c6CBLCc/nJOC6UklJEb19yE+ZexI6WeInuBBBGgsQGJFd2rIyYCNYgxZ0GLOOsLUrGabkttO948Io1Tkdg+zfNw/C4BrIGWF3rZYZFHL+X1OWr/O8tAbb0zWrG9mqnHkYBXnBH8WJ1alawCeO55cyPpHgIi5FC0rneUe/RlbkDDXDvaeIlNAZVTsbuPKzDXVgpZKrjlNihZFwfrZJfHEdKfAz8Fn7LHFNDcYWM7AdMkqoTEnKLnrQMB/iFcnpUX3/HF38LDZtGiNzC/Dumsw0JNrvNRFxacaHok0pNRBVozkYG2kYw2UFOOHFCG9KzO0VgRBJ9rBcodv/HOvPKpfm1GewTsitueVqSPMNS3VUgQrs96v3J2doH01yXHwYJl6gzVaqZAKniKSA74mNXpsMJB4El45EahRfWjYJzwAW0ma0roiErw42ME/KZFIh1i2tj482QB38WYI2twoDCTD0c0BCEjt5ApQ08Hs/ur0WEwfqqNfU6YGKk1Y40GgcOwJcMZnWNzYDAJfnygnFx9bG9KzFbxNEdkQSWJyb5XolC/pioB4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb23d39-2f1d-43f2-efc0-08dd15700b79
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 21:01:53.1702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0lrUPhl8J651px4XtwGHX2+tzaisVppdygFxDVCp27rA8tMvd8Njnpgz0KOsP21Es9mpkMiXOSoaz6lWbJ6Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7346
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_15,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050157
X-Proofpoint-ORIG-GUID: 4pr9hHun_jin6ejldA1axNbNvfHcbLdp
X-Proofpoint-GUID: 4pr9hHun_jin6ejldA1axNbNvfHcbLdp

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 12/5/24 13:53, Kris Van Hees wrote:
> All functions that can operate on a tracepoint object had a convenience
> function for probes that are purely tracepoint-based, except the setting
> and getting of the (event of BTF) id.  We now have dt_tp_probe_* and
> dt_tp_* variants for that.
>
> Also renamed event_id/event_fd to be id/fd.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_prov_fbt.c    |   6 +-
>   libdtrace/dt_prov_rawtp.c  |   2 +-
>   libdtrace/dt_prov_sdt.c    |   2 +-
>   libdtrace/dt_provider_tp.c | 129 +++++++++++++++++++++++--------------
>   libdtrace/dt_provider_tp.h |   9 ++-
>   5 files changed, 90 insertions(+), 58 deletions(-)
>
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 21f63ddf..da288401 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -208,7 +208,7 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   		 */
>   		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
>   		if (dmp && prp->argc == 2) {
> -			int32_t	btf_id = dt_tp_get_event_id(prp);
> +			int32_t	btf_id = dt_tp_probe_get_id(prp);
>   			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
>   
>   			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
> @@ -239,7 +239,7 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   	if (btf_id <= 0)
>   		goto done;
>   
> -	dt_tp_set_event_id(prp, btf_id);
> +	dt_tp_probe_set_id(prp, btf_id);
>   
>   	if (strcmp(desc->prb, "return") == 0) {
>   		/* Void function return probes only provide 1 argument. */
> @@ -306,7 +306,7 @@ static int fprobe_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   		return fd;
>   
>   	rc = dt_bpf_prog_attach(prp->prov->impl->prog_type, atype, fd,
> -				dt_tp_get_event_id(prp), dp, lvl, buf, sz);
> +				dt_tp_probe_get_id(prp), dp, lvl, buf, sz);
>   	close(fd);
>   
>   	return rc;
> diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
> index 778a6f9c..f1d3b6bc 100644
> --- a/libdtrace/dt_prov_rawtp.c
> +++ b/libdtrace/dt_prov_rawtp.c
> @@ -221,7 +221,7 @@ done:
>   static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   		      int *argcp, dt_argdesc_t **argvp)
>   {
> -	dt_tp_set_event_id(prp, UINT32_MAX);
> +	dt_tp_probe_set_id(prp, UINT32_MAX);
>   
>   #ifdef HAVE_LIBCTF
>   	int			rc, i;
> diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> index 675e0458..74555f5b 100644
> --- a/libdtrace/dt_prov_sdt.c
> +++ b/libdtrace/dt_prov_sdt.c
> @@ -241,7 +241,7 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   	if (rc < 0 || id == 0)
>   		return dt_set_errno(dtp, EDT_ENABLING_ERR);
>   
> -	dt_tp_set_event_id(prp, id);
> +	dt_tp_probe_set_id(prp, id);
>   
>   	if (asprintf(&str, "struct trace_event_raw_%s", prp->desc->prb) == -1)
>   		return dt_set_errno(dtp, EDT_NOMEM);
> diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
> index 50df2328..3d4ec1e0 100644
> --- a/libdtrace/dt_provider_tp.c
> +++ b/libdtrace/dt_provider_tp.c
> @@ -31,8 +31,8 @@
>    * a tracepoint or BTF type exists yet.
>    */
>   struct tp_probe {
> -	uint32_t	event_id;	/* tracepoint event id or BTF id */
> -	int		event_fd;	/* tracepoint perf event fd */
> +	uint32_t	id;	/* tracepoint event id or BTF id */
> +	int		fd;	/* tracepoint perf event fd */
>   };
>   
>   /*
> @@ -47,8 +47,8 @@ dt_tp_alloc(dtrace_hdl_t *dtp)
>   	if (tpp == NULL)
>   		return NULL;
>   
> -	tpp->event_id = 0;
> -	tpp->event_fd = -1;
> +	tpp->id = 0;
> +	tpp->fd = -1;
>   
>   	return tpp;
>   }
> @@ -62,10 +62,10 @@ dt_tp_alloc(dtrace_hdl_t *dtp)
>   int
>   dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd)
>   {
> -	if (tpp->event_id == 0)
> +	if (tpp->id == 0)
>   		return 0;
>   
> -	if (tpp->event_fd == -1) {
> +	if (tpp->fd == -1) {
>   		int			fd;
>   		struct perf_event_attr	attr = { 0, };
>   
> @@ -73,21 +73,45 @@ dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd)
>   		attr.size = sizeof(attr);
>   		attr.sample_period = 1;
>   		attr.wakeup_events = 1;
> -		attr.config = tpp->event_id;
> +		attr.config = tpp->id;
>   
>   		fd = dt_perf_event_open(&attr, -1, 0, -1, 0);
>   		if (fd < 0)
>   			return fd;
>   
> -		tpp->event_fd = fd;
> +		tpp->fd = fd;
>   	}
>   
> -	if (ioctl(tpp->event_fd, PERF_EVENT_IOC_SET_BPF, bpf_fd) < 0)
> +	if (ioctl(tpp->fd, PERF_EVENT_IOC_SET_BPF, bpf_fd) < 0)
>   		return -errno;
>   
>   	return 0;
>   }
>   
> +/*
> + * Attach the given (loaded) BPF program to the given raw tracepoint.  The
> + * raw tracepoint is identified by name (tpp->id is UINT_MAX) or BTF id
> + * (tpp->id).
> + */
> +int
> +dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp, const char *name,
> +		 int bpf_fd)
> +{
> +	if (tpp->fd == -1) {
> +		int	fd;
> +
> +		fd = dt_bpf_raw_tracepoint_open(
> +			tpp->id == UINT_MAX ? name : NULL,
> +			bpf_fd);
> +		if (fd < 0)
> +			return -errno;
> +
> +		tpp->fd = fd;
> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * Parse a EVENTSFS/<group>/<event>/format file to determine the event id and
>    * the argument types.
> @@ -120,7 +144,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>   	size_t		argsz = 0;
>   	dt_argdesc_t	*argv = NULL;
>   
> -	tpp->event_id = 0;
> +	tpp->id = 0;
>   
>   	/*
>   	 * Let skip be the total number of fields to skip.
> @@ -136,7 +160,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>   	while (getline(&buf, &bufsz, f) >= 0) {
>   		char	*p = buf;
>   
> -		if (sscanf(buf, "ID: %u\n", &tpp->event_id) == 1)
> +		if (sscanf(buf, "ID: %u\n", &tpp->id) == 1)
>   			continue;
>   
>   		if (sscanf(buf, " field:%[^;]", p) <= 0)
> @@ -287,7 +311,7 @@ done:
>   int
>   dt_tp_has_info(const tp_probe_t *tpp)
>   {
> -	return tpp->event_id > 0;
> +	return tpp->id > 0;
>   }
>   
>   /*
> @@ -297,11 +321,11 @@ dt_tp_has_info(const tp_probe_t *tpp)
>   void
>   dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp)
>   {
> -	tpp->event_id = 0;
> +	tpp->id = 0;
>   
> -	if (tpp->event_fd != -1) {
> -		close(tpp->event_fd);
> -		tpp->event_fd = -1;
> +	if (tpp->fd != -1) {
> +		close(tpp->fd);
> +		tpp->fd = -1;
>   	}
>   }
>   
> @@ -316,6 +340,24 @@ dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp)
>   	dt_free(dtp, tpp);
>   }
>   
> +/*
> + * Return the (event or BTF) id for the tracepoint.
> + */
> +uint32_t
> +dt_tp_get_id(const tp_probe_t *tpp)
> +{
> +	return tpp->id;
> +}
> +
> +/*
> + * Set the (event or BTF) id for the tracepoint.
> + */
> +void
> +dt_tp_set_id(tp_probe_t *tpp, uint32_t id)
> +{
> +	tpp->id = id;
> +}
> +
>   /*
>    * Create a tracepoint-based probe.  This function is called from any provider
>    * that handles tracepoint-based probes.  It allocates tracepoint-specific data
> @@ -334,22 +376,6 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
>   	return dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
>   }
>   
> -uint32_t
> -dt_tp_get_event_id(const dt_probe_t *prp)
> -{
> -	tp_probe_t	*tpp = prp->prv_data;
> -
> -	return tpp->event_id;
> -}
> -
> -void
> -dt_tp_set_event_id(const dt_probe_t *prp, uint32_t id)
> -{
> -	tp_probe_t	*tpp = prp->prv_data;
> -
> -	tpp->event_id = id;
> -}
> -
>   /*
>    * Parse a EVENTSFS/<group>/<event>/format file to determine the event id and
>    * the argument types for a given probe.
> @@ -385,28 +411,11 @@ dt_tp_probe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   
>   /*
>    * Convenience function for raw tracepoint-based probe attach.
> - * This function is also used to attach to BPF ids, because those are also
> - * handled through the raw tracepoint interface.  These probes are identified
> - * by event_id being a value other than UINT_MAX.
>    */
>   int
>   dt_tp_probe_attach_raw(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   {
> -	tp_probe_t	*tpp = prp->prv_data;
> -
> -	if (tpp->event_fd == -1) {
> -		int	fd;
> -
> -		fd = dt_bpf_raw_tracepoint_open(
> -			tpp->event_id == UINT_MAX ? prp->desc->prb : NULL,
> -			bpf_fd);
> -		if (fd < 0)
> -			return -errno;
> -
> -		tpp->event_fd = fd;
> -	}
> -
> -	return 0;
> +	return dt_tp_attach_raw(dtp, prp->prv_data, prp->desc->prb, bpf_fd);
>   }
>   
>   /*
> @@ -426,3 +435,23 @@ dt_tp_probe_destroy(dtrace_hdl_t *dtp, void *datap)
>   {
>   	dt_tp_destroy(dtp, datap);
>   }
> +
> +/*
> + * Convenience function to get the (event or BTF) id for the tracepoint of a
> + * probe.
> + */
> +uint32_t
> +dt_tp_probe_get_id(const dt_probe_t *prp)
> +{
> +	return dt_tp_get_id(prp->prv_data);
> +}
> +
> +/*
> + * Convenience function to set the (event or BTF) id for the tracepoint of a
> + * probe.
> + */
> +void
> +dt_tp_probe_set_id(const dt_probe_t *prp, uint32_t id)
> +{
> +	dt_tp_set_id(prp->prv_data, id);
> +}
> diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
> index e7d52876..f131b1e0 100644
> --- a/libdtrace/dt_provider_tp.h
> +++ b/libdtrace/dt_provider_tp.h
> @@ -30,19 +30,20 @@ typedef struct tp_probe tp_probe_t;
>   
>   extern tp_probe_t *dt_tp_alloc(dtrace_hdl_t *dtp);
>   extern int dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd);
> -extern void dt_tp_set_event_id(const struct dt_probe *prp, uint32_t id);
> +extern int dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp,
> +			    const char *name, int bpf_fd);
>   extern int dt_tp_has_info(const tp_probe_t *tpp);
>   extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip,
>   			    tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp);
>   extern void dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp);
>   extern void dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp);
> +extern uint32_t dt_tp_get_id(const tp_probe_t *prp);
> +extern void dt_tp_set_id(tp_probe_t *prp, uint32_t id);
>   
>   extern struct dt_probe *dt_tp_probe_insert(dtrace_hdl_t *dtp,
>   					   dt_provider_t *prov,
>   					   const char *prv, const char *mod,
>   					   const char *fun, const char *prb);
> -extern uint32_t dt_tp_get_event_id(const struct dt_probe *prp);
> -extern void dt_tp_set_event_id(const struct dt_probe *prp, uint32_t id);
>   extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip,
>   			    const struct dt_probe *prp, int *argcp,
>   			    dt_argdesc_t **argvp);
> @@ -53,6 +54,8 @@ extern int dt_tp_probe_attach_raw(dtrace_hdl_t *dtp, const struct dt_probe *prp,
>   				  int bpf_fd);
>   extern void dt_tp_probe_detach(dtrace_hdl_t *dtp, const struct dt_probe *prp);
>   extern void dt_tp_probe_destroy(dtrace_hdl_t *dtp, void *datap);
> +extern uint32_t dt_tp_probe_get_id(const struct dt_probe *prp);
> +extern void dt_tp_probe_set_id(const struct dt_probe *prp, uint32_t id);
>   
>   #ifdef	__cplusplus
>   }
