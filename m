Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305A02253FB
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755238429; cv=fail; b=CBe/UNWNW2aNEiZgzyPGUya5WbCmLf1Tkse43rH8bHpCAx11ZlhUTYFMqf6H+qbFi8TWvhm66OYlNyuCMKM3Y0OcIYyoppH/XFJuroA5s+KUBGRF8qW1nyvuC5kY24hUKero20H2wFTBmY5ZIBt3wTli7IpbHzUvdNS2c+2abAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755238429; c=relaxed/simple;
	bh=T+nGiyST0N90/mEKMDqfCvTmn25QKbzLOzEqBtwNWBA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vFgTHbrOG6HsAD1sD8NUVdZ4kn6vM5D7z2Ky0bOEX8YvauE+6dNhPTfTzQpNnC9VGlKOLMXJnGPA4DTUSPv27tBGH6d2rcM0bDhqpOaf0tpWhMc/cDdWm7/nhqP0haiOzO4z6+vyzJIhAoJBSChXx2+CYyss4JtLNMHa6oo4WTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dvd/U+Z/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oQNm4o4D; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dvd/U+Z/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oQNm4o4D"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfquQ011976
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 06:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=TnUChG14KeWCKoEsBRWBieK9NoAQg8rQ60DVmxoGisU=; b=
	Dvd/U+Z/SfKLc3zGoLQwa21HDyo7cnuJkhJn/pAQ66hElLkIYKUtygCls2RfIiwd
	fpitPC/DObFHb9jFJsMF5lOQF5KwdvN32lpsgDZbVIgKS9LWjqlAJavioLIoSZI1
	wq9EhODIwoOyBuB+Dolfn1hfeGoJB4Ah1wfgcg3YkU5LjpA7Q2oU7JlXdKrleMZT
	qUm+0ctTkUCJ22xQMMu96Vl1rf3crmwhTKmYDK3eMRdZfnVYq41/bGYC9U//bu23
	x8CPLBwf8ovBUOlAe5SW2zanrzF/MMWLtRumge6n1paRWYzqeNaarau/480Jq0oD
	Vyvf22+fg13Ut22v3+rFZg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4kfdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 06:13:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57F5VCFN006368
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 06:13:44 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsdg28j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 06:13:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFplURio2Jtk1jgyTH3ZFMa8l0u73+FGgDQjgxTRY2/iymgh+8TvHVTTU0A+tyGINMLroRWBipUkaQDMe0xYwSwKK3X5AK2S51X/tFE4kB8kHeLMCxJMC1EeltgOFjJfj4YjSqNpgdacbfzavoAY1fTfCvuhvB5bhrnp346Fi+hlzdOrSzj1O9Qs8M+1KyHCvPGzq1Dw7EH5gc+dTNxkF2B+a3YiS76cuSyhInMg3qUK5Q9mLjtP2ZieTcjdqYEYZWdMvezgctnC6Ij+4of8wi/d99HdxvyxhM2TGSrs8hLT1d96aN/hmLuPtYCaSvTW81D79Jp2wTEXPFTHwXnFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnUChG14KeWCKoEsBRWBieK9NoAQg8rQ60DVmxoGisU=;
 b=l3l8jGxxCCWzjNqck8VqKEECro0Afma2BBs2FRD1TLwDXnAOQwxlc+Jmcq93/Zzk9n0aCJHq3JN8alCgwlxGEBP1q756UkuGaz/EVosXCbGBr/cRyhpldNncZfI3o0Tun990yP6J2ktidkmcy3OPbcI7wNp0clp9leyymvAw8VR9A9NFh7HDhKyD/DhjUzPGHD8KfjsgwlHhIRVrfmfc+HUFaGHICjCQG9SA8vH0722iRv9vG7EjTU7ZSMFpd/P7PLPxQMQorxhRJzZmq2j/Nhmjkk7JsZPpNBAY30iUpZwkAFyG++unf2Dkh6bj75eo1Erh8+OhilPTtrQqrzuQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnUChG14KeWCKoEsBRWBieK9NoAQg8rQ60DVmxoGisU=;
 b=oQNm4o4D718pdOavu+3+fsyPJODlnruGmTdintbVrD7OkmmDiWjDLap/nkwA6FWqtC4HUk1Z7RwG/XWLc+1plHjFeA91TBdqb/f/WvQsXpd14xWe931B5MLZrxxeLFhjshO4rA0cNeiaKPrjQbPF9qSl3O8RqDAh6ywR/QVJxVM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7906.namprd10.prod.outlook.com (2603:10b6:610:1cc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Fri, 15 Aug
 2025 06:13:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 06:13:41 +0000
Message-ID: <98bd1948-8866-dba8-4342-af9ade275719@oracle.com>
Date: Fri, 15 Aug 2025 02:13:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] uprobe: do not call populate_args() for
 pid probes
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56724556AE44FF193BB9207CC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <8e075b06-1d39-3d9c-3924-61e948827485@oracle.com>
 <aJ44jo+ogadLIWau@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aJ44jo+ogadLIWau@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0725.namprd03.prod.outlook.com
 (2603:10b6:408:110::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: b94fb53b-de9d-440c-6c13-08dddbc2e1de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cm1OT2RGMHB6OXYvbWZGWlVKeVVuUmxTdW1wS2FENEFiMkNrdEFsbDRGa1g5?=
 =?utf-8?B?QmhWTVVLOTFVZm9iUjk4enQxNzdGOWhMaG9OUXBBMVJEc1V5dXRkbkpra2VI?=
 =?utf-8?B?Z2pGYkN0bUZhaWozYnZlU3N3N1J2Mlo0ZVZXQVpON3NicFBRWlliMk1MNk9X?=
 =?utf-8?B?RkNEbE9GTCtjZy9SSVF6VkJKWDk1YTFlS0U1V09mLzZPc0pZMU42RzRnWWtm?=
 =?utf-8?B?RVAzb1psaFl1Y2UrYTFYNHZqYTFHRUwyNFg0d1ZHQzU2Y0Y4R1pQK2NPWFBE?=
 =?utf-8?B?aFlXNDgxQjZhby9SN2EwUWM5YnNIYTZwMGJjYXNMTUdWSCs3anpuT2ptV0t1?=
 =?utf-8?B?b0xuWVVvTTNCc2Y5WXY5UnVYaE1ocWV3T25qSGxqb1d2V2FJS0h5aTZFSHp5?=
 =?utf-8?B?dWdpRnBwY0pIZGRMcEV1L3VXRXdyT1gyc0RWbGJ5dWdlYkUxRUdOZGVpWWha?=
 =?utf-8?B?Qm0vMDA0ZSt5UTBoRzZMZVlwdW1qYmVra00zSHoyWlJLZ1RuRThQMXd1MU4z?=
 =?utf-8?B?TXN0YnpxY2hQQjV5V1pDS3p4TWdNZ21Mc2ZLNWpWMDRsZ1h3bmo5Z0ZMcjhB?=
 =?utf-8?B?cEg3YlIrbnA1RUVVVmNyb1haaTFybFZLVkNPZnl6YzJsY0JRRTRxSTlpYXU0?=
 =?utf-8?B?ODRHUTZWMU9UY3RRWVdiR3dpV0VvRGFrMWVSRG1ERkEyYi9lcGlYWUxJWjF4?=
 =?utf-8?B?SjBXUTNucFZIdFE4MjdCK1l0ZXZKcTlzWlJ4eFFGakR0eGZBaE9YR2I0K1pQ?=
 =?utf-8?B?N2xqYmEwakFQTlhoQlNhRTdHS0ZvMlJVZTgrMGhrRTFEb1ZkZWIvSUFLelVk?=
 =?utf-8?B?TTkvRnAxUzVHYWU2eU8ra1FIZ2syS05LczA5SUprdE55RVVNMHZVTVRoSlY3?=
 =?utf-8?B?R3QvSFFsaUhiSHZMTWJyL3RUa2RkOU5Ra3JQOVFVUVhBY0lBZ0ZhaVlmNEM2?=
 =?utf-8?B?dnZxUmNIeGxmS3QySURPU2ZxUWltMDIrMXJ4aW5JRjBrbVZWbml4UWM5dXVT?=
 =?utf-8?B?aGxid2ZuZmEvSlEwaUdXNldVdEQvMkNLM2xGd24yRHFhZE5nTlRlUk5BbnJz?=
 =?utf-8?B?dWNhNDJteThiZUQ3ZjhTUUg3ZTY4WEwrQW4yV1orcnNrVEhoTFgyNGNuUmds?=
 =?utf-8?B?Y0tYZHVIYnpSL3kvRTA2NUdCV2pabVBzNm8wbnNWMG9yaWppaVNGTVlWUWZj?=
 =?utf-8?B?bmNlMG5pelFXSnB6VmV1UzJTZjNLUFV5SlJTbCtRUTlXdEczT3ZBZ0pmTHUz?=
 =?utf-8?B?RUxSWjRyTHlVOWRqRUU1SmxIQVJ1Z05QZlpINzFRcWFaRFNib3pPQ2w4V0Jv?=
 =?utf-8?B?RkZuN3pqNUdHdUlvWWRhTmV3RVlWYjZvc05UbzgvVlFWcERjcjJ5a3VJam1S?=
 =?utf-8?B?aWxoS0w2dlJ0Wk1lNXZ6SytLOG42cWJVL0o4T2xheVlDemhZMElscEtlWWFt?=
 =?utf-8?B?ejd2TDdkZzVmY1EzRnZha2FWTzJtTEh6bDE2S0x1NEJYdURDTGxTZUkvZ2VS?=
 =?utf-8?B?dHBxR3MveEtIUHdvdUEzTmk0K1MyZUdBOGN4bWdURnNlSDR1WWNjbXRoS2F3?=
 =?utf-8?B?T29KYjFBQng3VXJ0TGtpb053ZnEvT2tVWmxtSmpjMEhTbGYyU3NBdUxIYU9E?=
 =?utf-8?B?eldPaVVpUWU1R0Q0WEFZWnFyYkVFKzlnWUZXRXU4ZzBYUHlkSWpJY0JFSjNx?=
 =?utf-8?B?OHhIelZYdUN4Q216bkFSVWIyNnVJMXNuelZZb1hDTStlT0FNaXpWVmJrSGZa?=
 =?utf-8?B?VkRHeGNSRjdid2Z5Vm5oUmZvRTRhc1JzeWxjdDMvQ3d6dXJzeCt1RnlsbW9K?=
 =?utf-8?B?ajJydG5GY0EyKzJrRk40QXp4c01FVHNjdW1hTVBuSEx6RmRrbDNNbHBTdDIy?=
 =?utf-8?B?b2pFVW15Znh1RnZGR1FmSGo5UGRpVC9xKzAvNVRUMFdORHpnSi9VaXI3Rk1k?=
 =?utf-8?Q?inx4EtFjVfU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE1EUVVjcndxQUlIUkpBZ0l1QjlsQ0w1VWdmVWFYbjdqcGsxVW9kRkZBVEZn?=
 =?utf-8?B?blBMTHg2QlJWSTZhaUJwRDRXV3AyTW8ySWdtSWd2bWpxWGZnUUtrZDMzK1cw?=
 =?utf-8?B?V1NpazJnb1Zwa0hjZVVZUWZZdEkzK0swRUlibit4c1pJZkQ1UDNLSFl6TExt?=
 =?utf-8?B?M083d1RFaGU5dXBURitoYk5GU1B1TElQZWJZSEIvaWdRNVFuS3hsN21wRGxS?=
 =?utf-8?B?SFhWYVJDTzluOFo2bnN4VFhsMXZLMWJkQUV0akxWN1k4b0huVXFKcnJEQklI?=
 =?utf-8?B?L0ttZnc0ZW5DSndPenN1V3FvakJFL0RtbWFIZEtTQkN2QkJ5VDVBQlFWcTBF?=
 =?utf-8?B?K21ORDRTWW0zckJlV3FITXo5UDRZWmVHUGxLbjk2VEoyTFhWUEJYbmNuWm1O?=
 =?utf-8?B?bERyRDdNQ3JzWEZvUHdDYUlUYmxzZE9pRDZ1U29TeVd2cWF3NHliSzdsc2o5?=
 =?utf-8?B?RTRDenZOa1ZER0Z4bEdJZkVjWDhORTAyRFJYVWpjVkx0Z0xDbGpBV0lwZ0NP?=
 =?utf-8?B?b04wN3dwRzlmU2lxKzJvc1Bqa0pTMmF2RFh5WXJDQjROV2p3YTE4amN0bGZZ?=
 =?utf-8?B?Y2RWaThaTjJJaXFNRkVxaFdEK1BPRWxyWHlmQ2JOWUhsQk5vU3lEUWZFb1E5?=
 =?utf-8?B?SmtGVitXSzB3dlNnLzFPZ0lBVWNEZlJJbUM4eVh1M1VWNGg1ald5U3MxQ3lD?=
 =?utf-8?B?YkdlTER5cGVUcEhTV3U1K3R1WFBCUnZXL0hXMDJZMURjRGQyR2dMTVpwL0w0?=
 =?utf-8?B?WlUyakpJWStXaHVPeUc3bUx0b2M1aSsvTlJadHNBWFFEckhySkJ5R2hnM0pa?=
 =?utf-8?B?bjZvdThGa01zSFFNMGtaTXJQVHo0ajNTaWVXdVZsaUQ0U3A5OVViYittYW1r?=
 =?utf-8?B?U2I2RlBvVGlEK0wvSmhQMDhMQXh0aHV6YTVIVjNwZjlGQ3RzV2cxZ1MxN0ht?=
 =?utf-8?B?K3AxUXMrcHZETjNweUNNVk5UMzF6VGc4ZWdlZlREdjk5dGM1Z3RmNCsxVGhX?=
 =?utf-8?B?b1NxbTlvbW5VK1FvTGRMbEtjamZGMHh1Z2poMXVib3JzTUJMKzh4Qk5zTzM1?=
 =?utf-8?B?dEl5N2NHeThrc3ZEaEFRcnNzUFlUcmhrblVJdm1QeGw5Z3lmci9DQ2VqYlhQ?=
 =?utf-8?B?U0NIdXpTeDBjNGhxYjZmN3pjNi9qb3N2V2d1SWRjOXlwZzI0R28vREp4eTRt?=
 =?utf-8?B?a0lGbnZ2RGFhdFVYcE5EZlF3Y1cyUnBrc09seHdjdjhVV0x6SWZXRkR2S0pz?=
 =?utf-8?B?alNOQXdudkZuNWJ1c0g0OUtDd1FHMjhyOXVFcXFxVXBHUi9Ea2h2M1BWZDRG?=
 =?utf-8?B?YUpDVUpyQVB2Zkpmb3NyUEtOeW1UNEJNb1l1dy9XRXljYTBoY0x6d1FDQW9P?=
 =?utf-8?B?T0xIeExUdlNxUVNHYzF3VzdmeVdscXRFRVY2dmc2TTQ4SHFWV25XaGtqUW1B?=
 =?utf-8?B?K1IzZVJSMzZFM24yTTFFcHVUbzYyNEZBMVI0WkRodGo0M29odXBKbU5sNU5i?=
 =?utf-8?B?S3RxRnQ3bEdDdVdEODdzdjJwdENzbnNMRHdidkx2eld5c3BjakxsME9uOGNN?=
 =?utf-8?B?VTd3azRQZmIxWXlOVTc1UmM0SkxTQkNqMmowYjhVdXBHemVVSXFySjlUMWg0?=
 =?utf-8?B?SWxSdG0xalZQMXVyWU5ITGh4QkZvUFIvUXVnYXhuRjlyQmNPSmh1RENCME9h?=
 =?utf-8?B?bllwNzlxK2hnQnhOZG0vWTRBbTNPa3MySjFVYTU3SjZ6dEFDaEh2cURLUERR?=
 =?utf-8?B?L2l3Vjgra0tkaXFmb2VwWk0rcHd1QmZDWjM3OUhpdWpLd1VQSVZnc1JCZmx6?=
 =?utf-8?B?ZG9ma3QrZ0x4QU5VeVhOSWNZaFIxRkxZRG11b3pvUG42YnBRKzVsZTh2TkVy?=
 =?utf-8?B?emVsNjVwOXR3Q01DTGJUSjBLWEhHeE40N3hBWGN2UFhkS2FleGZZcXpjaTgy?=
 =?utf-8?B?b25mU0V5K1pCN3FFdlhvWCsxWkt5bDVNUmlLdWFOcE43Z211eTJGNVJrRzhW?=
 =?utf-8?B?R2JBZ1lSNThGSjhWVTh6VkxpSkxnZ3FWMzFCV2hsa21OZFpqbmJBdEtvUm9a?=
 =?utf-8?B?UzBuY0g1OU1oVFZJdENxK3p5b2FtSVdFNWt6anR0eU1YNm9jRXlQT3hrMGtw?=
 =?utf-8?Q?EArifk2dJLnWyPSlu+KEbwJtC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SpKCUujx5KVjW7lGzdxu5mtWgyMROOL4gYuuGZ75KKXziXcZ52zDOBoFLAw9XVw+FCMgN6oqOprZiRYv38iTOCQyGSlt74Vj6ojRDosnM67fraISejsxcwx8susvRUFOpKbMOdgUuZHuW/wGPuZ3KQ5AKMrLlW2ySV65dhYncqoMcL3ccSlTijJOFVNUYUZIYaYR/5fX80kAVyjqo+Gxmyu5vHRn0NRtSidKpLkMMY1dFPd+Caea+IZDqJQy3vCLoMP9BVGg4DC8g3XcKQ3rNBdZCUB4z0nPzo87R/R/Xtm+YhOaYTEISCHh4sAi8tMAW6c+9GIAzrRt7JxVSL2dFoiKeKpLQgrZ08kSRm1RmgZisvkINGyA4f7PAPQA0c4gtPGpNtfslKE0+t08yY+CpIFbnGVqBM4GLEkpaUYPLns6KmVuy7nURAt1yURdL2fyR01SoD6mse92ME0o/N8mfqjPNYKEhxdGSaOjHJ0z2Lx7xQ3GlqpgsKPJGiIexB/lyAowqkwAg2kUNkIFTJYnhUeD+09/9yPpY5BXpMWsXQmWU/OsK8drhIqp8uGpMw57JyXFFkoYvwOsC21QWJHDCqEoPgL+gpbCi8GiWFaYDz4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94fb53b-de9d-440c-6c13-08dddbc2e1de
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 06:13:41.8469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OpG4u6cDHWKH8ZKKF6+oYTFc48zBUJ2hSqYqyXAaFnB2AGb/ZEfTIn209JSumPWk8kVC0Dr+cusAI+ocrktbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7906
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508150048
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE1MDA0NyBTYWx0ZWRfX9W69LhF7lQan
 EbCNBJ8igNBSgJwlUP57sQFptDSojqnqWb8Q7kWLZUN4bdVTBhWd78MnGIuVs3ROKRCf+iS6wvh
 gYNP6UCy3R9pV4m4uSe3LfvTBNc+Vf9QnRhM4VKCuM69Q6ac9GOhpiyotOWyLm6fGmbi0kyf9gM
 brHeqercZ83PdsZaBPr5eJei8+OCPRE2MWD6ezMlZAnisSY+lUEq3NJmqO+w2iY9kltRnipAr2i
 6EwrFh+XS/x26Ijft6dRFgYYOaSnqc+V3i6v4jF2vgD02haue+6ZE7aZxQlkYvME4aTd9hm+U+y
 MgqLb6aQTDXLO0WPgFMbFSxdG5FicFRsJzip5imYHBe3FcjLcX6X8rVl+6VxeOQlvfPpLK3f1AJ
 5HTooiWt4j2Kg3lVf0gJ4Hz75Cnx870taVdV1BO0D/pnzjWXZve5D2FBPxKh3NT40fekFAqc
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689ed01a b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=l67oybbbRvWON4w-kGYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13600
X-Proofpoint-GUID: TNXxWgnHkjRYI-n85ri6zwuePaNftR_1
X-Proofpoint-ORIG-GUID: TNXxWgnHkjRYI-n85ri6zwuePaNftR_1

On 8/14/25 15:27, Kris Van Hees wrote:

> On Thu, Aug 14, 2025 at 12:47:25PM -0400, Eugene Loh wrote:
>> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
>>
>> FWIW, with every patch I wonder:  "Are there any test issues?" (Like, should
>> we test something here?  Were we?  Etc.)  I assume in this particular case,
>> problems were revealed by patch "Fix various memory leaks related to stapsdt
>> and usdt probes" on tests
>>      test/unittest/usdt/tst.pidargmap.sh
>>      test/unittest/usdt/tst.pidargs.sh
>>      test/unittest/usdt/tst.pidprobes.sh
>> The present patch is simply to remediate those revealed problems. To me,
>> that sort of information is useful in a commit message.
> I can add that in the future, though personally I don't find that as valuable
> because anyone would have run a test prior to this patch and after the patch,
> would notice that anyway.
>
> But if it makes it easier to assess a patch, etc then I can add that in the
> future.

Cool, yes.  A person might run the full test suite before and after, but 
they might not.  Anyhow, it does make it easier to review the patch.

But the reason for this email is that I seem to be getting
         test/unittest/usdt/tst.stapsdt-notes-args.sh: FAIL: expected 
results differ.
         test/unittest/usdt/tst.stapsdt-notes-isenabled.sh: FAIL: 
expected results differ.
         test/unittest/usdt/tst.stapsdt-notes-lib.sh: FAIL: expected 
results differ.
         test/unittest/usdt/tst.stapsdt-notes.sh: FAIL: expected results 
differ.
with this patch.

>> On 8/13/25 23:58, Kris Van Hees via DTrace-devel wrote:
>>> Only USDT (regular and is-enabled) probes need populate_args().
>>>
>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>> ---
>>>    libdtrace/dt_prov_uprobe.c | 6 ++++--
>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>>> index c63d58383..605ae8397 100644
>>> --- a/libdtrace/dt_prov_uprobe.c
>>> +++ b/libdtrace/dt_prov_uprobe.c
>>> @@ -994,8 +994,10 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>>>    		 */
>>>    	}
>>> -	if (populate_args(dtp, psp, upp) < 0)
>>> -		goto fail;
>>> +	if (upp->flags & (PP_IS_ENABLED | PP_IS_USDT)) {
>>> +		if (populate_args(dtp, psp, upp) < 0)
>>> +			goto fail;
>>> +	}
>>>    	return uprp;
