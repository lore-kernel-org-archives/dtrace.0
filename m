Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5383C156F5F
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 05:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722491402; cv=fail; b=PP/JYxBCa2uY4ha6AkmiKIp8b9JSQqxRSP/DB1JBq/fVeF1kUdZvTwQS0lUooGz+UPn+UX6yS5b5+Jm42z8UvJdB7XDmRlOA9Af+aAJ3ZSl14MccdroB+thgakX8JFQ8c0WipptNv3UyNS2yBcDu94W0lBoho5vRGSG+g016ryo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722491402; c=relaxed/simple;
	bh=kWoxWscMWspUTQOdpJGuoQ7M/kgBL6XiT6Vi4ppjRWo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MK5gPIE7z9Cxtnsf12L5fx7sAQL17z/wc+R/SU3CMEQazq928LGJr6idJNiIFZHYvFpDphln6YM8xkAXthGgHe4yEDftVCQ1RzlcOUfwKi98yvT0+wJr3Lz4W0kO7fVVgceWZGdsKSdHYNDi03koTOZP0Ve3zLDX1XRKOUAB1IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mj/jlF0H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=grvkvcgV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mj/jlF0H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="grvkvcgV"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VLH4xg008510
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 05:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=bESmZmBugU03dd1FoWr6DRGluBklFhGLimjAAb02N4Y=; b=
	mj/jlF0HJVC4CVyU0OoD15srrsZDKmvHnGo/f+Dx1a4Ba5hHtcKxFQImd6lW6efc
	xg6nL7+CU/3ON7u5/eCTZvUbje5tduUFQpapM9rzzu5BrZO1oXu4j1MaZuySEpuB
	+wjHKu9poj37zTRadYcd0NLDch8msqanoPC0j/sBm0MurcoOOxwUZ8eQGT8CLXPu
	q9SnpbD1N2MYIzYLg/WT/BOlHVS6S4QX3Lnf7Ur03gQvA+6BjvhzdYQ2yKzC0kWj
	fFZdEg3rYbtUQq2SDnqAB9LjiTXdfux10a53/mN0alXvLytKpJfPz7N8VOAB/kKC
	f8JL5KIPtWT8JuwaA6KbgQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqfygx8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 05:49:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4715YoXd036233
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 05:49:41 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvnypsbw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 05:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxscP2FCLuhaFAVEJ1cQk16xSJ/AqDxhVBE2XrIkDGLkrGtUAq7Cv1obwbOTn4heE80D/fOWiNW2ACeU8JnTOo6UoFWyUfzdlOk8lvV3UGhgrV+F3cX8xd3qw7Y806zqMXKsYkJWxFLOkZndRJApWXL+WaNDLfupRxBhPN+gQ0Qb8L5f3hvaiT20/XAsAhGYX00QuPEUhqBgjR2Cvtj+dLd5u1V55DmckbI5eAqM1mh+6zzYNoRFCx2+X8/xJtxnjkJDJ7M2fnEOkSxZSDvteQ1qYaKAcUcrL1Ae2TGU02OOdT7H2M7Y5ffEfE2XQcFY/lcmO/bxGz1bRFFHqIc5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bESmZmBugU03dd1FoWr6DRGluBklFhGLimjAAb02N4Y=;
 b=g+Plp4x8/SOUVJg4Qc0q/6b/ToF7u7iifMw+HCoCskKgnEBWPznvuJAJXm6ZglCH9JF2JvLT8c3botfweiJHfeQIeyNNXVu0WI9TvyPrk5ZaEc0VL+zbTrxu4SC6gzgKKGU3RAqo0FM4dSFUd+ntnvtRH4ielH0rAKTVniYjheEjQgGWPsTs+bdCLWItPgrWVId2eoT+iImmS+wtzlk8ydsAt14GsmVeUR2qd+cjBwP/rzRgWmYQtdv9/jrMzL9NygiRoWXZm/lbQxG3o3mrkOTYRmIGldD/5xt8gpiVkVGpz66OL3ppdLH0W6Y7uFdQlZ6f7zHBPY/ZOnWhFJJwoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bESmZmBugU03dd1FoWr6DRGluBklFhGLimjAAb02N4Y=;
 b=grvkvcgV3Vyhr80D5CvczdIk3R44E6BrS9xV/J++OX/iIOoWTtmHdcTISgeVMqaXBK68AZlAnOgQX7Lr5Ey41Zcn5S1zBnTePYkoxdE4U7ZMkFlNulb/l8wlmMmFJKezVItsNfKXXuFzpw1/nI1PotbswAB/GG+a3BJkQ1bovKQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6527.namprd10.prod.outlook.com (2603:10b6:510:229::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 05:49:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7807.026; Thu, 1 Aug 2024
 05:49:38 +0000
Message-ID: <b5514f26-dd94-f055-509f-b766313287ed@oracle.com>
Date: Thu, 1 Aug 2024 01:49:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] fbt: implement return value support for fexit-based FBT
 return probes
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287AD841705B5857204F3BEC2B22@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB6287AD841705B5857204F3BEC2B22@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:208:32d::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dcc59b1-4f5c-4e93-855f-08dcb1edbb46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlBtbTlVT1E5K1l2cGpEYjc0dGZzZSthUnM1ZVdnTy93LzRxK2RPdWJQQ1oy?=
 =?utf-8?B?d1NYL3ExQWVlaEdSV212YUJ2Z1pYMXhKZEVBUkxORERhNlhRRjBCTE9kRU1N?=
 =?utf-8?B?UnRZNkhERXBoVlFiZTBMckZKSURXUEhrb3FVMWpNenAwVjYxWi9LYkhkRUZj?=
 =?utf-8?B?Y0d3YzBKbGJzRjhrV2RUekZXT0c2cndMWUZtKy96bS9hWkVGOHJFdWdpUDhk?=
 =?utf-8?B?dWdNd3FvVnExNFBlNnBXY2p1ampNdXRYYzcvYmpTMUJPMHdmOG1PTlNNUjRY?=
 =?utf-8?B?MENqMU90NzdWdnkrTm5LQjMvNDAyb2lDbDVjMmMvcW9EdnJaLzZzVEJ1YW1K?=
 =?utf-8?B?Y1lpTUJlMGY0Y2xNV2FHbXNJYS9KZE5ybXBuWmRycTJHL2wvWFVIN3JvVXow?=
 =?utf-8?B?RmY5aGpVNnB5VGZnZm5ZcDR4QzFvN0JhakhLUVMvUXdJeFlEckoxcGNGKy9o?=
 =?utf-8?B?UnJjdEdzMG1vVUlYY1dTclV2NVVQOGtuZWs0OEpwbzd4Rm9qc0xqRk5kbm5s?=
 =?utf-8?B?c2Iyb3Y2azlSRDdEQ2p4MmJTbSsxU1JlNGsvTk01VmRLYTNsbnFlM1VadGJ2?=
 =?utf-8?B?aHJMMGdUSCtrSW0rL1ZsaVJuMHNVdkRpRUVGSlZXQWFEZW9lUVdiWjFDY2VJ?=
 =?utf-8?B?R2RWMU1OZlZLMTE3dEYxTTFOamZkYzEvWjZKKzFxVHVnb3M0ZkQrMWd0RmtD?=
 =?utf-8?B?YWZqMlluMVV4TzhnK0VtNGlzYXBiNFdjQ2FrZU4wRHV4TmQya0ErckVDOWIr?=
 =?utf-8?B?dnR1c1hoYkFwS1E4MWhMdkhNWHM1bWQ2NWExeWlHK3RScXVpeFRYc3Jpb09v?=
 =?utf-8?B?ZS9Ndmt3cTdHYzMxVEV2bmJDTmFjQ2ZYSnRCR3JhRDU5NVBnR1FCajBkRDU5?=
 =?utf-8?B?WE50THh6VUIwQUhsNzNmN0dwbyt1Zi93WXFRMHd0dnRkTnZxZ3lVK1RPWk9P?=
 =?utf-8?B?a3d0ZHY0N241cGFJWDVrNXQxOVZLT2RvTmhiNXBwL0RrQStnUE8yZXo2bTJW?=
 =?utf-8?B?amNOUllyYURITlQ0M2hxeGx5dlIrVkN6Y1VRNVRXeGtzaThZK1R0bE1PY0Jo?=
 =?utf-8?B?RmJCQVF2WmJxUzE3MTVqWlJOUjBiQklzVmpobThxb2JVTm9JMTk2aFdYSjho?=
 =?utf-8?B?OUhhNmRFeXdYR1M1OUlwV25UUGx3VDlPTjRBRHZCcWtXOHBjV1BpZGszN0Rn?=
 =?utf-8?B?N3JjQzl2Z05vUjd2UjI3Q2hURWMxV0tMZUJIZU9rb2d1TDJYUzJhUmdVLzRn?=
 =?utf-8?B?NHdoQVR1VkNtbXhOM0JCbWs5aXVjd1BMajJnQVY5cWNPUzJXRi9hZUFHbWto?=
 =?utf-8?B?d3hMQVZiTzVkd1NZMG16emZhcDg3K1FYRVh6eEhtOE5UUUJJa21ZOFp6cUs2?=
 =?utf-8?B?TnJNTStQUVlJRWhkRVlsbXZVYWdKclBzY29mZFpnV04ySUc4TENHZ2xIZTRr?=
 =?utf-8?B?QUl5aUxLR3RBOUd3d1VHZW8yRVZwR21kQVFPTUxPNnkxZURyNnp2SlIzOWpR?=
 =?utf-8?B?OXQ1Ylc0Tmg5UXlCbG5PWXVSME5xYzVPa1FPcUJmRndjSHdQY3kzNm5hOE9l?=
 =?utf-8?B?NklsU2ovaUQ5RG9nSWd1b2pWdThTYTF6TVFxTDdFQXdIQkE1SC8rMEtHbzJ4?=
 =?utf-8?B?ZG9CTGpsTlJmR1cwSVNYTEg4NmYwdlkvOElvWk9JQTh6VklaZjhtVmlMNnFq?=
 =?utf-8?B?SFpJTW0xZ2RVdnBQUzg0anZPYVhyd3M5ejZYVnVnTUgrSUgwZ2c3RG5JLzdO?=
 =?utf-8?B?OVpkdVU3Qk0wOGVvOFA0Q2gwYkl3RS9ueHlBSjh2S2x3VzlaeU54UFc5Niti?=
 =?utf-8?B?eXdUZy9TSmorMEwwV3YvQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWpyeEVFMS9rcnRUdWNIbzhEL1B1SE1Xc0Qzcm1jV1BhQWpjZnhTdEZsUUZN?=
 =?utf-8?B?QkNEQlFpaWY1NFEwMnZ2WTBxZlprdWRHc3VHY05Ldkx0L1d4VGttWlFaZUtW?=
 =?utf-8?B?RTg5T1lacStESm5taHlUTFU4UUNxbW1nanRsYVNhNm5kQTBtVUpVT082dTZx?=
 =?utf-8?B?RGRiN20rb2tRc1JIaTFTVVBGSnJ3YS9XNGk5NUlFa01jcHpUTWZqOGYvZEpS?=
 =?utf-8?B?cHFEdUhxdk0zMGlHUms1Y3luaEwzUklnWitUUzJRVnRZTXR0emFNdGErUW9E?=
 =?utf-8?B?WXdVREdQeTlLai9oSVpwL1FqRzczUmhKcFZrdnZ6MHBLdi9vQ3QxT1U0SW1J?=
 =?utf-8?B?SHNXeFUwTmhOd0U0T1JSUDREWlFSMFFZdnUzVE9KMUc0UkNtT0ZWa3pjdkpB?=
 =?utf-8?B?NXpwNWhwUEFxb1NHRUxCYzk4RjNnWWxUZW93TUViTHB2cFI2czFrZnlhZ205?=
 =?utf-8?B?TWlSY0NhdUthWFNlUXdzWkp5ZEJKWDdlNjhMbXVmVERyeFE5dDNOdkNrRFFn?=
 =?utf-8?B?NFBtTkpFNitvS3B4b2dRQytNR21hTWJJV2VIUnZ3Z1BCQ0g3R0hXL0Y3elRX?=
 =?utf-8?B?ME8zWjJXS1RROERZTVZTejZhT29SWGF6L3hZOVhxSi9VaER4dWV4QS8rVXA2?=
 =?utf-8?B?RlJNUms3SnNydFUyVEltRzByZzBaOXhzVUtxc1djRi9NT2dVMEhDeHIvZlhx?=
 =?utf-8?B?VUk2OFRqdUdDZ3JZdGozK091MVJOT01LQ0QwRTRYaGJLaXVubUI3RkdUdW41?=
 =?utf-8?B?RWNwVjJ4Vm9mMDFsajlWbmJ3WldXaVBDaFh3T3JKYUNkbTdkVGV0YlFzRHdy?=
 =?utf-8?B?R0RSR2ZsSlhBUHFFcTMyVHdkeTNQbm52YkhobFpybXdxZUpjT2lNSXAvTGc1?=
 =?utf-8?B?Q1dPTkViR0hmeDl3ZVZCMzBZdjlzbWwrZmU2S2dtVnRCN0NYZlBBTDVZeUpQ?=
 =?utf-8?B?TUFwRkZtczNIWUJUdVl5emU5RFh4Y0dXZVYreFFpOEE2SXNIWTJtOW5ROGk2?=
 =?utf-8?B?eGRKcXRZNGxiWGxvNFVMMm84QktsUVlpWkJQZzlTQXRDN1AzRUdOVVhpUnJU?=
 =?utf-8?B?RjNOY1JmYzdqcnZZNGlxbSt6OXNCVVU0aDYremZVVHVkclp2TFhrcERqZkpO?=
 =?utf-8?B?RU4yWWxCOXRZREYwakFjaUVGYWo5SFFMYjhKeEtrb0cvVlNjL21id3hnNDJD?=
 =?utf-8?B?UHpzMTNEeitGTWc4eDgzUG82SE8zbXBMNzVEQVNQSUJwSlF6WTQ2TzJtYTN4?=
 =?utf-8?B?em9RRjlhWkdyMDA3aTFvTGpsc2NFejNWaER4cy93Nmt6eGJ3MzBwMFg0Mlho?=
 =?utf-8?B?WGZ1enpGb1p0dzVDbE9RUTRVQm50TlVEclZBdGVoZlMrRHVmdElWZXd1ME1l?=
 =?utf-8?B?azlnMTJ5SDRpeUFPbGROZ3pTZkJveGU1M1pwand5dnRpZU5HKzdmMEJvR2x0?=
 =?utf-8?B?dGxENWNRS0hYbktZeTd4TWdOVFJaUzk5enp1ZE9MLzFLb21RcGlkUVR1YWFM?=
 =?utf-8?B?dXZWNVRnL1IxOEpqV2ZQdTFvZzNKSkdVL0V4ZGY3WWg2OWVPWFlicm1RK0pB?=
 =?utf-8?B?M3pldUpGd3k4UFg3REdrSTAvdEF2OC9zcWZKZnF0ZzVjNFdzOXhpSXUrZGda?=
 =?utf-8?B?S3VUQXJVMitpZEZyM3NHeEJYUWIvUXVrMkZDdnBoQnd1WFkzVlowWUNuWlk2?=
 =?utf-8?B?bXRkdGlpQmU4RXd3UmZaRnlJblNIWkZnaHM1ak90YVY0SmZsbjc0NngrN2J6?=
 =?utf-8?B?akdneDQxeVZueXpWZUoyR25wTWdPYnUyQ3NycVFYRUp3QXh1Ty9KakhxV3Y4?=
 =?utf-8?B?V0diOC9yVmw5SGxDZ0l5K01FODR3QmlJaUNjSzlocDhZeWdwNC95bzVxSHVl?=
 =?utf-8?B?SUp0cUgxaXFCam9ESkRGcWtKYzNhSzdVblVGQit2R2tVeTZRY0pDQXpOT1lP?=
 =?utf-8?B?eGQreVd1WVBnODBWT3dDZUJUVXNiR0lEbENIQ1UyK2tMTm9OQm0ycGMwU05K?=
 =?utf-8?B?SnNDZ1NIRnFjU0hRalBiQ3p1OG1DaUhUYitFblp6TGN4RXFlYTgrQzd2UzBu?=
 =?utf-8?B?clVuZUM1bEtNTFY4Smhzd2tIQkZkSnRQanZnZ2RRRU1VdmRTYlJaLzhsajkz?=
 =?utf-8?Q?HN73SqRxke1kZnkkmA/iFB4iM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uYIpQjwcSkg2YWqgjzY0M50clzXKTZO9OJOSdeQcKCh5EJrUfcN1N0PAyHnQARxqImfHmZl4XHgOCXPtu/tCF2w+nUTFFDCPDti53TUWxrErd7m/dYf4FvYaWjuwSkwASLpbzonYUyPGW0nw57Gqx5X4XeC8h6aw18sjV3/8a9pXDPk9Yk+9dz7M67bIJHYqFsrl07gCLDoOjoVpcwRpDiMPrWhgxwrNiHeJCUf2ALQyUI9JT2SXq/8vdze6BIvToDuZl3EXTMkSaaod9VVHyWHFsvAqkzUd+sLGim4WenBt4juhasmAKc1B2CwZRE6ccnJj7piJyR2IA1pOUKt573FL93E4Qpkxau35kOa9qn04y5BT7vYCcf6YoSsRwDJ6REu4U7ma8YH0VffG5N5DdrjRQsCR2mNKEHD6ZiQhu3scuJEQ3fhRJaKFsvet9nFlnBwXS8nzdYsERIv9ybjCncI/gXrghCzm6bNqai1v1hHDyLlvXA2Alr7Tr1BUelkaXK3REC9+xicypYwL69PD8XPDg39V/ja0Pdp2r43w52nGvblFLQhpuMbg4VqIrM68NDkglYW84uk6j7eV3ie2hsVLeE7LUVRQUDCbPDi1hM8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcc59b1-4f5c-4e93-855f-08dcb1edbb46
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 05:49:38.9598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wpa1397hmbUeoGoKnozPj34YfGb0aDh8wYjBtWhocYVECXNMEA0eYPInDQXerVC8qSzaR1RIfgw7CZ5fY4VfIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6527
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_02,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010032
X-Proofpoint-GUID: YJHYhFYBseO2H1iJrMIdAND5yh_wEFQC
X-Proofpoint-ORIG-GUID: YJHYhFYBseO2H1iJrMIdAND5yh_wEFQC

Is there a test?

On 8/1/24 01:19, Kris Van Hees wrote:
> Commit fe2101e5 ("fbt: implement based on fentry/fexit probes") failed
> to provide a proper implementation to pass the function return value as
> arg1 for FBT return probes based on fexit probes.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_prov_fbt.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index fa888ed8..99b42586 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -172,6 +172,7 @@ static int populate(dtrace_hdl_t *dtp)
>    */
>   static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   {
> +	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>   	dt_irlist_t	*dlp = &pcb->pcb_ir;
>   	dt_probe_t	*prp = pcb->pcb_probe;
>   
> @@ -185,6 +186,8 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
>   		}
>   	} else {
> +		dt_module_t	*dmp;
> +
>   		/*
>   		 * fbt:::return arg0 should be the function offset for the
>   		 * return instruction.  The fexit prpbe fires at a point where
> @@ -194,6 +197,21 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   		 */
>   		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
>   		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> +
> +		/*
> +		 * The return value is provided by the fexit probe as an
> +		 * argument slot past the last function argument.  We can get
> +		 * the number of function arguments using the BTF id that has
> +		 * been stored as the tracepoint event id.
> +		 */
> +		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
> +		if (dmp != NULL) {
> +			int32_t	btf_id = dt_tp_get_event_id(prp);
> +			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
> +
> +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
> +		}
>   	}
>   
>   	dt_cg_tramp_epilogue(pcb);
> @@ -274,7 +292,7 @@ static int fprobe_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   	dt_module_t			*dmp;
>   
>   	atype = strcmp(desc->prb, "entry") == 0 ? BPF_TRACE_FENTRY
> -						     : BPF_TRACE_FEXIT;
> +						: BPF_TRACE_FEXIT;
>   
>   	dmp = dt_module_lookup_by_name(dtp, desc->mod);
>   	if (dmp == NULL)
