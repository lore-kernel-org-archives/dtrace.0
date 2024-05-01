Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559131BC43
	for <dtrace@lists.linux.dev>; Wed,  1 May 2024 17:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714583732; cv=fail; b=Q3bfjM5MxqjPmEW3I81i1MW93WwvWSCT67Qv9fKSyYyeg965OWwr+MqVniTfDvMwxgjEYM83M7xkMulQu1XjB6GKdGD91c+i1OrDe5jzFdOM0YTGgxweizSzVr4eyL0owDKfYEy6Na1F8rvZJ5X3oWMsQ9xalWQW1wnkjlb14u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714583732; c=relaxed/simple;
	bh=Lji9N41G8LiXH8W1+26sjKhLOWSyH6w1rrp6ZoPcMFk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g8EMg04zPpuNp2CWyh9koWvu+aUmPk5Vl5mHF82pbZmjEE7BhLTGYN6sTdIpTnPTvSkykx8pp8B13CTedZ+mv2iFtmywPh6yEZZGI4L12SA1tC2inhAwn9SJd6nQUC1JZwML+BXNkrWmfywK4Fi4tjBGZL/vGEhlX9KS6vBDSjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DV/GlB2k; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BA8d0mgK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DV/GlB2k";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BA8d0mgK"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441ARwKp014795
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 17:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=s0B1+iy1IHUfeA6nNQ03dPBf45E5ayXOrJBdf1TaUyI=;
 b=DV/GlB2k5iLXASOP8j3DLG3u8It99HEpBUcVbW1n7Df5JI55oYwu/Ej1fIl6dwuEGAHG
 D2ogF+hDRpcdMeKstadVjZhFE6fFXaSVFFs6prPjC0eVqAaVInE8ndg4tsu8Y7hxOUfo
 0+0wAqim7+tsO3PIXdkwXKfzpnn8+QsaMotYqYBXiev1GO/bs2bh76XKhOpYMjnY4v1C
 4I23Q5t15YHnnaAK9ACV1C6UrsKF1qzKhzKhkBdydGq4lCejZD/sDsJy+QQFJtiVPtkP
 IYd6GYkff4kpcXKd+i6ZjBu158wVuckHRNLmit/zLGgMuYZCXiQO1qCcPGD7e42C/i3Z qA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrs8cqkhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 17:15:28 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 441FrIYp008656
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 17:15:27 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt9mnxy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 17:15:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBv2gLS0xuZoI4rcvthXeucKlVbyc+pHDQDZFXGQGgoC0CCyX/sYOMTUDwdpTAOHyyoOtwNSFY6hZIMTjiSArOS9dVTudsOpcF2THCm91eeKzulTtiDawg2RhAH17JSFZBMFL/WExBoG5xgHUaHWdhlBfyw8wgkHS7aSpb82+Xknqc8E1K2UfQCkwZ8eGl9lOjDyzZAdU8d3jmvHXMB5iJ6Xz5QVv6Q+OgIZ/jy6538FmV/euBmI2Cw02ug5Rv4wS6Dvx7yiOdFlkHkqOP3/AF2O+o9NEXnfiaQ9y5TxzDEa9odL8ydEMKS3A28zvfrNn+jq9Ry4BeQjsnCOtxyDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0B1+iy1IHUfeA6nNQ03dPBf45E5ayXOrJBdf1TaUyI=;
 b=F73LqN8FMX3y4uMgkNBftVpfSlgGd+lP7V/YluKUVXp8VMQFYuzQ75fa+5S4yCUZfBnJUfDndVQzsMuB8Bes7xAl0EI87nP1tBmhLKxKcIeZAzJp01+nhlbImXUwJfXW2BvtdLwy25pE8S+pzZQ44MIBotOP0sBkCLRWavB6ZhVInZ27eABFbqQee38uIg2WOZUwJegiQmqqr9XSQn/Ps6xey3v8sjMltnfg4h8FtmMFMR0G9uXVmiE0huJq7+wgiGyGg1ny331xg+FY46XPqzXwFyo4ktH2SLCf09iVxkcGqXdUPB7Goxx02QeEYBNQdgFfOQb/fPweTy+oTqRBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0B1+iy1IHUfeA6nNQ03dPBf45E5ayXOrJBdf1TaUyI=;
 b=BA8d0mgK8XYn6P5MPBCs4xZo4SO37LbYMm42tPYawRgW0QFdr9DLDVDlIl3OOXdOH/8uBb3Cw2smm6Xs26zcoDMifiGR8IUSuyx4UcOPQBGkSh/X+VUERNzD6C3zAicE8Y33zHxuBmfy82vOzz8T3xRo+RKgZMDSThaYIwmCbFg=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by MW4PR10MB6323.namprd10.prod.outlook.com (2603:10b6:303:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Wed, 1 May
 2024 17:15:21 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::372c:5fce:57c3:6a03]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::372c:5fce:57c3:6a03%4]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 17:15:17 +0000
Message-ID: <f91e88cc-8907-4f73-b7f8-016f3c168084@oracle.com>
Date: Wed, 1 May 2024 18:15:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] Issue with stack) on 6.x kernels
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev,
        DTrace development list <dtrace-devel@oss.oracle.com>
References: <ZjGfUr/Zj/2taTAW@oracle.com> <ZjJKjlD8EvNnmbhl@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <ZjJKjlD8EvNnmbhl@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::14) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|MW4PR10MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec89ed0-786b-4f51-f729-08dc6a0245ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Tzh6MmJQd1QrbXNWeTNxUU5wUHM5eERtaXUwa2ZNYlQxUTZrZkJzU3piNHI4?=
 =?utf-8?B?UHBEaDF4QTlTWVJ6N2p2S1YvVEdDbzFCS1ZPNlVmSWRkaWlOZzFVMjVhT2l5?=
 =?utf-8?B?NTRiSlJsdzVpR3dMWWg5WXpmRWNDUURQSmQxSWhqZzh5WjBLRzFiNGdtNGgy?=
 =?utf-8?B?bzVYaG43eHVFODRSNnJRTmhpY1QvUUx3M2FEaEN1U2FMZDhjc0FpV3pUaEpN?=
 =?utf-8?B?UHFYdUtiblRsRHlkcE9pZE5nRTFhcmdLc0JEUHFoVzlkb25PbFdmQXFzK0Rn?=
 =?utf-8?B?YmRNNVJpV3NacjZiM1N6TmFGaWdvSzU2WkpYczNZcTNPaDk1QlpZYUkzWVJ5?=
 =?utf-8?B?dXRYQzlBQVVDUGYzNkllN0VhVWZ1Nk9peDZqUVhndVQ0UkJtT0tqWHFWTm9E?=
 =?utf-8?B?cjlzTFFCQ01CMGswUitoclliczJFZWFkaFI3bGNaTVdyemZRWGR5S0dIVHUy?=
 =?utf-8?B?SnVrcS9ucktRMHhpSXZOMmZyUzU5cjZBd29yemlYQ3lRQTJ6d3lSd2xwQjlC?=
 =?utf-8?B?Y0syZ2U4ZjQ1NDJ1c3p3Sm1WQjBuNWFIWHRid0FtamxWMUM4SEl4STdqa1FE?=
 =?utf-8?B?YndsUDFYYnZnUE9aQ2dRZ0xhMGJ4Si8xekFVK3lONEVMRlhPQ0lsMHJseHR3?=
 =?utf-8?B?VUhCcWlwdHB5WGgrNTcwdDZyU0wrQlE3Tzl5VG9yVHRmWTVKaHhDTlN3bFNy?=
 =?utf-8?B?N1JFT1Azc3RmSURNRUx6WHVMTXhQQzJtYmQ3NmFFT2RHUkpmWC9SYU1rdk9U?=
 =?utf-8?B?YmVqcmRPeUMxMlVnOTkyQVJ4UGh3ak02WVNCNGJnYXpRbnNjSjVXOW42ZXV2?=
 =?utf-8?B?bDdkb2RpR2E3N1VFQjhuYzR3KzUwalRnZmZ2TTl5SmxiS2lCb0FUa3BvLytQ?=
 =?utf-8?B?eWdzSzBaYXVkOXNtYUpCd1VWRmlIQmlqYVR0VnRRRWNEemp5TGl4SXZTSHEx?=
 =?utf-8?B?QVo5TUFOTWlLVGRTVGdKZytXaWp4d0FmbitubmpHZzRLRHhiYzliRGt3cHc4?=
 =?utf-8?B?bzBHOXVqSk9tVGJhZ2pRWVlvQllIcmpEbisxOEdBWG9KSzJscVVmSDdrZk1v?=
 =?utf-8?B?YUF5bzZXemNVdC9wVHA3WC9UNXRxdVFpZFV3dGFkcTR2TmZ2bFowRmRPZ0hl?=
 =?utf-8?B?c1FzSEpQcWpZREJRQ2lHZWcrcGN0VXFBK3FqMGlJR1ZZQUY3QkJrZVVFM2RN?=
 =?utf-8?B?LytzbjZzUXJ0NDJlSnFqZlRYQWxtNVhuSWtNc3hyNUs4WXNDVjVOT1FGZkpT?=
 =?utf-8?B?YzI3UXVka29CYVVOdjZrRGw3aDRsUW1Mc2ZGVVRTLzBRVXhVM2V4SUFrNm8w?=
 =?utf-8?B?d1VRbGJ6YWNNVEdqYXBuQUMzT3ZmdHNjZ1FzR2llaWtUL1EzcjdZaHVJTFdO?=
 =?utf-8?B?S2c2L1BxMnJMbEZVYU9WQkQyWXdpYitTc3B1YVpoZVdMenpDRk5wN2YyajZW?=
 =?utf-8?B?QVhSNEo5RE5OUE1CMUxBSXozSGN6WFR4Z3lzQzdQUFNnajRZRDcyazFaSWFQ?=
 =?utf-8?B?U2hoRjhWNWxrMjd4dTRKT1c2bkdRd2UrcnNEZWhCRHMrY2tNdHAyRlJQYzJ2?=
 =?utf-8?B?dEE1SFh6TjR0ZkhUVDZZMi8xMm1uZ0ZPK1JoMEdyTzc2NzdZOThDMjJwMkpL?=
 =?utf-8?Q?2fCfmTQU6fCLGTW1ZcO44aAqeBfR3nqnXAxn6B48bUi8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NmRMUDRndFJjZHFvV3dqNDI2MTRNSlRtQlBEbWZGbE1JbXBSKzhWZFE2TW5q?=
 =?utf-8?B?SjMxMUtxN1NnSTFpWjk5cml0Rlgwd01BL2ZiRXlwSE5IUjNZSkRGZDVJcGVG?=
 =?utf-8?B?T05TcVo2OWpMaHZJaGcvU1Y1VVVyb2REdVl5NkdISGZzQVB1UExVY1lkUk5Q?=
 =?utf-8?B?OGlVWGNDSnFVSjNaRXNQWHB3T0RqdHlhRDZMaE9jTDkrbzBkRk16YWFFa3hK?=
 =?utf-8?B?Zm4wand5UmtPYXByK3hpWjlBMktqdU9LREVvZWtxNUROeGJRRnR1Z3NvMk84?=
 =?utf-8?B?NkN5a2tqN3gyRitxYmRYNHh2T1p6MFlEL1kwNUN0dWZzK2d3c3hrOWdzbUVW?=
 =?utf-8?B?L0JjT2NSeG9iU0lQRUdCNEExSll0OG1HMkFxZ1BlTWVWV04wMGh0amVKa1VF?=
 =?utf-8?B?QnlwdHpqYW1SNVBMK0cxcW1JOWJxVnFTcXpUWlZyMVlycHhnQXROL203QXNm?=
 =?utf-8?B?MGtVYmFpcGxDQjI4WDJ6bzRlWHFpTjRqdVpnQnpIT0RObUY2T3BpMm16ejB5?=
 =?utf-8?B?Q3EzOCs0aE5QaDhYSTlYWlVtUG1wdXM0dWVETDZTOG1MNk9aV25VZUlhbTdn?=
 =?utf-8?B?TkorcjFuTDdRalJ3Wm1OR1ZnUVg4UEt2NjF0VXExNjFteklVUzU4cHpQSm5B?=
 =?utf-8?B?Mnc1NHZIcWVaMmdKUjRrNjBTMEZ1ZVpka3VOcHN2WS81emR5OGNacXFYekdx?=
 =?utf-8?B?V29VdFI1QkZaOHUrOEs3eDBteW1nWjRLWkJxRTdia2FYekZKeWEyZ2ZHZlJN?=
 =?utf-8?B?V2tjZEZobzEva0h5anVrM05vd2U0ZktjRjkvcWV5SjRNUENsdW9iMStsWjZj?=
 =?utf-8?B?YzkrWStGcEtqUEhVYkxHbUVSRWF1MytPbkFPL1Q0OXc0ckZiYkN4WEhhdlFO?=
 =?utf-8?B?Wm1iMEFGRWlxQ1VxS2plTTVxTEdKMzM5K3ZOM0g2TlVSSERtWDlpeDg4TGdR?=
 =?utf-8?B?M1B3Q0tFSkpkSG93TW00eHVEemNFZTk4b1BKc1l0K1hNM1N5NFo3OC9oNUJX?=
 =?utf-8?B?Z3Y2UXhFaUwyaEwzaHRWcW5LM1dKZ3ppTTcrNklUV0NpcWF5eHJ3dmQ3ekpF?=
 =?utf-8?B?djMrL2VZdkZWZnVFdDg0dFpNZEtaeTBnR01mc0xOTFRSWGdvZUwxUlpXaWxi?=
 =?utf-8?B?SHBjNE1EbzJTeXQ2QTllOHI1L2NRcVBLS2cxMnRscDJ3YUxUOVd6VCtPeUJD?=
 =?utf-8?B?ZkZHZVFKcnlEZDBGSm1MVDFuaHEyQ3J1aFVYMC9FODZySVRtUzJtZXdZdlRi?=
 =?utf-8?B?M1lpVHo4Nmg1TTkzNEhzZTdyOGNjdXFaYmNBMUc3UTNhTEVob1N5QnYzSmx0?=
 =?utf-8?B?NXp1Rnd1UHdjTktTLzVKMU5VQklqb0lkdHZ0S213eU9WVG9jdEYzZEtGN2dH?=
 =?utf-8?B?bU1mNU1PTG9XVk5QeG1RKzdOc2hrbkk3R0lhSkkvREdxZ3ljUFA0TldsN2tp?=
 =?utf-8?B?T0M2cElsNEE5RWFmT3lZSnUyREY3bDFYT1hHYUFmeWJVM2F4TjZ5SWV3cWVB?=
 =?utf-8?B?bjdxTkhYbmJ6ZElxZkkwc09wdG1YaTFWdGRLc1VIQmxUZjdaa1dNS3FxRUUx?=
 =?utf-8?B?d0psYW0zeFk2QUt1QjhBT2dMbDdZQTFXR05KMXg0ck5jM0RwTS96ZUVSeDl3?=
 =?utf-8?B?S2tQeFJvZGxPbEdpSE56Uk9Wb3lDWkpnZm5hWXdtSzBUV2dvbzArc0JnbE1j?=
 =?utf-8?B?bG4vNW8zT01EWTVUUHRNVEVyaVlLcU1ySDVvc3pTbmoxK2x4Nm5sdnQ3TVpR?=
 =?utf-8?B?NnY2NFVveFovTlR0dTBOUWhCRTlJeFV3QmdRWnpMUXgxM2UxMUp6OHlTS0NG?=
 =?utf-8?B?TTF3SGcrb0t1WlIwSXhCTUg4a0I4TVN2dGVVSVVLenpxdnNSaWh4d3ZYRld1?=
 =?utf-8?B?cG1GbkVqeTJEb0VObmx2cW9rYnZSOFZOZFFrckpJRXR2WFpnZzZXakxoV0p4?=
 =?utf-8?B?Ykh4WkUzVE5zcEtrb2pDZGpUb3RwUytHalh3Ty9STWUrU2Q5VC91aVBTRGk2?=
 =?utf-8?B?V1RWZEo5Y2p5MUpiWEVvK1lHYW5acW1qd0V3dGNkL0VuK05sR2hnQ0tpR2tJ?=
 =?utf-8?B?aC9kamJCcmVwRG1TQkFYcnpVeVVVb3ZvaEVuV1E0R0l0R2pFdWpENXgwQlU0?=
 =?utf-8?B?L29ORjc4bUlmU2pEMXFmb2Z0S2U2Vmo1cFp1bTVqUGxDL3didXk5dUEyeHFo?=
 =?utf-8?Q?YxcfYyep+mXXbQhNbqd+0wI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	tjuGFRxnTIIkVIGu7IjerNP5jjG3LnEBHo1HOF+TKpQVgNW8PuRR+H94GcYM43Io5P0f864PARJ0Jq9B5nYgg3w865ulhEPHw/ptorFO099TYLUjBApnoi6dH/1SgUombNjUPq9g7yeZQLPKRk+omBtdHNX8tyXPpVA3hXiflSHtClJHfOjTZ0OrXhy2aVsvcDxWD3ksAyJw1pW8X7kX+uarJqcoJYU3cAuU7tcbbGlCL8ncAcGteppQhmwQJtobHNXU0Sfk38LO241eAIZVt9oXo62I+/2bRDKvDjRHsAyBI8TR+rlkA9wmOULRi+7/DTKJyfrXdlvSKxCy6M+vpxsdy5INEQ2cRTHTOOdccLyvusR/l3FYBi3xjEIlSoWE5h2brF2SNl1xDlVczSD1yZVlJchn29Lm2jCNBhfdEb8i94WYEPezoUd7/ALxQvXe5AgeDBdyHMHdyOH99TKO20uHG2teXCh1dmfvlZyTDYrAYb5IsDbiRjxYY/T76E9x0cnmwWW6YvZxcduWLqvRoWr2Fz8v8juufPyYMlA4fuvVEJYe6/SignRwAjSYx/DpadTF7F/dmMVYdAx7oPrL39DLWp2a4b58QnfHM2EtLXs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec89ed0-786b-4f51-f729-08dc6a0245ae
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 17:15:17.3341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcm6TEbKZB9z6eVE8tG1uo+dxYZ/ubA1BL3MSroqNeLtI3F6FthcIZ4Mmo1z0A1K0uHTEghi5bPJG0S46rW/VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6323
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405010121
X-Proofpoint-GUID: imPnXmrRLxSIiA1_6W8IfEsfd7r6AZop
X-Proofpoint-ORIG-GUID: imPnXmrRLxSIiA1_6W8IfEsfd7r6AZop

On 01/05/2024 14:58, Kris Van Hees via DTrace-devel wrote:
> On Tue, Apr 30, 2024 at 09:48:02PM -0400, Kris Van Hees wrote:
>> Newer 6.x kernels (I tried 6.5.0 and 6.8.0) seem to behave differently for
>> stack() than e.g. 5,15,0,  Test test/unittest/aggs/tst.stack.d FAILs on those
>> 6.x kernels whereas it passes on 5.15.0.  I am not sure yet why there is a
>> difference, but Eugene, perhaps you can take a look into this?
>>
>> 	Kris
> 
> Here is an example:
> 
> $ sudo ./build/run-dtrace -s test/unittest/aggs/tst.stack.d 
> [sudo] password for kvanhees: 
>   0xffffffffc0129e86                                
>   0xffffffffc0129e86                                
>   0xffffffffc0129e86                                
> 
>               0xffffffffc0130250
>               0xffffffffc0130250
>               0xffffffffc012b2bb
>               0xffffffffc012b83c
>               vmlinux`schedule+0x9
> 
> The strange thing is that it actually does give good results at times.
> 
> So I am not sure what is going on.
>

here's an upstream thread discussing stacks + fentry:

https://lore.kernel.org/bpf/49b9b6f.1279.18aadb90e05.Coremail.chang-liu22@mails.tsinghua.edu.cn/

Looks like the top few entries relate to the trampoline and fentry program..

> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
