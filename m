Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89CD15B10D
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730092369; cv=fail; b=YuO+Njh5E+drzGGlsLtqLRUYJY58bOigc6fsGWpZJxkHvImx/5sagiu7DgClo3jye378MwV/7dv/GWlfpAvb+VQBzpGe/gN3K5jP7kI5m7x/2a0GQK/qwcV0ilBI8TG0lMrpS4Wr1F9pig34n6ajDeU1DEV/G0sCk+GjX3g8e2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730092369; c=relaxed/simple;
	bh=tdwRnZ2eqx39u6YO242wwW2MkW8pJvv0y87mjncGgI0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tnpB7OwBLwVNVwaZwuBA40AE4hOApnsrzsi7SCFiha4p6TscXhH+ktpf1M//ntXoJvRNYRKgWtGE+vHOk9K6eujz5QIDwPj+Bfi5timfoBHLKI5y0CG+w4DSyIPf1FU2qjL0u/vyMtiYWn6xaYZR8hioawoIOFaWjOPuXxKbWT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fiZ3sc7E; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=geTqBQhp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fiZ3sc7E";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="geTqBQhp"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RBgqi9031781
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=SHH8okXUSStwNc+2aFVxsDV8oFjdahMpZ4cw/6FsUaI=; b=
	fiZ3sc7E3RGqpkweUApRqWZNL34aepGs9khyEA39tYO5AwdsjzGZriqQivfVyFrz
	tCbgSnmSn4do+aLpjvDF6oK6D3OIJNTJ/46p+7vI6ghsG/MAeD2Rqmi4+WSPSqu9
	rvhF6aaDs1SfCpUMaXAhEQsIOQ1HR/IEEuLqBtb9UOSZSAo0gj13xriXhVuyhc3i
	OowpOEzAF8qjNajXZ+tLP0Ih/zH+YBVa98BsPsxz8H3+jx/fPvU49Rmnn8m4pK9o
	18ve7aaZl8F/sEZ+TBWjiD8BQHURQ+5qYgjkoKlLa/QMgJvS/a6PkV0WBXbRcS8k
	208610Y2hRTcIwg7oNuSLw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc1swu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:12:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49S4Pl4P010182
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:12:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hn8upe4s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:12:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBx5RmcdkMFnPpWv7VcNal9UaxBiUp2xT/ZVq42VP7mS2rTOahwHLEqh/w6YDYcIziBRX67b2a9bBAyS4OVLvQLeVH/edBftaDaTcJ4utVgD7tx60L46krC5cF04g8dCb/L4T0CCoM95XD/Oh7THiUUvM9colCxTpLo7MHKb6in/pLsACuoA9zMKZ6S+L5Ov6jp05iSASH3hAnEUBigeUdoOsppEfFCB8NgrCwoABotAJsuECs1zB1Eqyb1JUwON3cJfev6M/1oMRlssMrj9I3I/ZqFKCmphOEk2lsVG32MTHeho2N+ZmP1qmlsSGd9eCXKIa6p4qZuNzf2qPm5cWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHH8okXUSStwNc+2aFVxsDV8oFjdahMpZ4cw/6FsUaI=;
 b=CG8pEPaWH8ia5wJyKE4XxetA/WpcAb/stGEDzTJcfzSLMChMhL56mrP4nQcjQJgIjnZyYkR/6UjwmkBpjmouC5NmJ8XMImuN6Cr1LVtGt1n6DLjeSUYhVDpT3qjKr4ImWqFmxrcwDqL/oP64wH6rcGmDL/1rlnGslm0+tuz217aifyWl7/mBPxjU26zhs/ZPq/kZ6+pMqsjNtV/sOIzY6Pr4VFx4KfL+r+TXdtcVTXj88g9RiktG1qa4FJjOeSk6FVvuXnaxiKVKdu10XAikviO6q5rCY5TemL2JNveOoyHKaGAhkFilVCBaRYB8XECElsIO3YZrL+gtAutUww99TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHH8okXUSStwNc+2aFVxsDV8oFjdahMpZ4cw/6FsUaI=;
 b=geTqBQhp1ONwGjaCCB68+60+d8jgNUdvZFPviUSuXB6FgX9/ae2Cya8cQNSq0SIHxLsTRPOHeZR2vF/XDrIURlh0nPAr/S3NkvaAQ7c/VQHk3XASoWpnyfgF1zH3fUwu9cfD2nyXlhlkfoGi/mG10XR+4C83I8xaYylFVLKSD44=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA3PR10MB7093.namprd10.prod.outlook.com (2603:10b6:806:304::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 05:12:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 05:12:35 +0000
Message-ID: <d8f31f59-355c-b81e-791a-f0897f77a10a@oracle.com>
Date: Mon, 28 Oct 2024 01:12:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 02/19] Add a dt_provider_discover() function
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241016160139.29589-1-eugene.loh@oracle.com>
 <Zxl3H8sMUZJwBNsi@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zxl3H8sMUZJwBNsi@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR14CA0014.namprd14.prod.outlook.com
 (2603:10b6:408:e3::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA3PR10MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 138f51d6-f0ca-48d4-b063-08dcf70f2287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjNRME5rNks2V2N0dDgrenlxTDVuRGVLR09mc24yS0FqTy96aHE0VVpkUzU3?=
 =?utf-8?B?Z24zeXNMNFJIVlRhNGlxUHdVQ1NydEIzL3lzbndXNjFzUTkwcFVCeC9udm5u?=
 =?utf-8?B?U2JMOW02MEtUUVZLZXF4Z005QVdmbHEvSkhHOUc1WU1mK3NWRmozQzcreXRv?=
 =?utf-8?B?Qm5mSzJmUm9vME54dlI2SFVaN2puUHlrdHpXcWtVS3hPYXZsbDBieWdUSVg0?=
 =?utf-8?B?d1V0L09CNXFZSW9KMnE1RVAvTUM0Q25Dc2Z5eU83NVZRSmxYditnT0JiZ0xW?=
 =?utf-8?B?ZCsyZ3YrUDVDOVY5U0EzRG1sUVFkbjFPYnA0ek0yVDY2KzJuZnlmaE5OUVFw?=
 =?utf-8?B?U2x0KzhjOGtyMndVL0ZXQmZtTXM2czRHYWRHWmZqVTBlc0VSZFh5S0RLNzM2?=
 =?utf-8?B?VVVKRVVmN0RGWldQSVIyczVVSzBkUkM3bDBPVUpUNHJYeTNNcXl6SzhGVDJF?=
 =?utf-8?B?d1AxcUdqTTlXVU9raHo0Wk1UdTZJbmIwVnFXSDJ1QTRlZ08vSFNSOWRIYnl2?=
 =?utf-8?B?SHUwSEhMSmZZNnpXVDFYZG8waEcvbnhuTjJVN2EwcEpIcmVOeDJoSVNnZ1lL?=
 =?utf-8?B?akhEOWFrTmlmOTFBMXRtTjFmc3JWRmdRcUhDT2grUytDT2JRREJNanM0TEFV?=
 =?utf-8?B?a3NoVWw4WTFDaWlaMUhTOGxOY0NicFJ2TlV0TG00R285d0RidWxYdkQ1T1dj?=
 =?utf-8?B?aHFLeE42bFJxOXdnVVNJa1U4N2dGQmdNWTFjVzhrVHNwRWJCRC9mcis0UVdX?=
 =?utf-8?B?ckVNa21xZW83Y0hQSk8xbEgrckxkTFlUTDVIaU9HTkY0QlRzNC83TmZYK282?=
 =?utf-8?B?MlpYTkVpY3ZDZ0F3V1RmM0hOWGNMTlh3OWZFQjM3bWVpYjVpc2lYSUpIUEhh?=
 =?utf-8?B?eldIRElLKzRkMUlHNGVoOFFPeFJXNWNjYlE5ZXVmcUgxa1B3Qyswcnh1Z3cx?=
 =?utf-8?B?UzFTTWlKK1VjLzlUNlh0cE9PMy9Da0pyV3o5QXFKNE9WR29Bd090K04ybHV6?=
 =?utf-8?B?U01NOWhod0N3Kzd3S3k5THZKWlZTWlBWblpKT0lMZjJ2VktEZ1l5WlVvTytN?=
 =?utf-8?B?WFlyOFJrZGdsMnlFM0UrZVRqSUpyZUJvcUY4MUhnZGdxRER6UUY2azRvejB2?=
 =?utf-8?B?L1VIb01BNGsrS1pzNEtSSUY0bE94aC9GNHJ4Q3JQdG1kVnhXRlBQMWFSb1pN?=
 =?utf-8?B?S3NsK1pDa09YNXROVDVJSUE4ZUt2eXowaUh5cURhelBndFB2YUJMeXNhODNS?=
 =?utf-8?B?TEdiOEdXYnFtMG83aEI4NGVjRzhiUGNCMm80MzNWemp1aEZwSUJDN1VOUXJG?=
 =?utf-8?B?YlQwdVJOQUVCOWtraXhKK3JUV3o3VWFxcXFpNzVHU2RINmk2RnoxUGMrQkpE?=
 =?utf-8?B?WXJRL0gyRUd3Z2htM041RFJraVNSZFRJNFhGdXJ1a3RMMHVZMFd2cjhnYTlM?=
 =?utf-8?B?Z3RvSVpMeTVDQ0NJbzdrTkc2c1RxMFprSXI0ZTFRcC9MR1c1S3VFOWZZTWdW?=
 =?utf-8?B?dTBjUnlQUDczZERzTE9IMzU5YlQ3ZmVGUUJLT1pVYlREWWgrVGFmcG5QOVhs?=
 =?utf-8?B?dFFTWUxoQWNyS1duVXdwUlk3cjVBVXNvNGM1Q2tsLzEzWUtYK2NQaXVOemV0?=
 =?utf-8?B?by8zMmNsWnNXemwwaGY5S3pobXl3TnhrTzhGTEZyQ2xuRGJEUC9xR3hxZE1M?=
 =?utf-8?B?d3pMU0RzUEU4Qzd5Nm1TcmVuR0hYQkE3SzlwWDJ5ck5LRUxZZlpGbFUwTGlz?=
 =?utf-8?Q?ezOwNH6JyJD1IeX1MQIFKxhwdpG4Pm+3mgVAy7t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0MyRGI0ZVBSYmEvMENDb1F4YksxUmkrb1l6cGdMVHFXUjRuSFdCOWFCa0dQ?=
 =?utf-8?B?dWwwYzRpQzgwcEgzekdaK2tiVkhLY094UXF6Nkt4UGJXTjBualI1TG9ISFNy?=
 =?utf-8?B?NEpnTXNXVGdRK2VmamRrU2JwTGZTcmpNdVN6UDEvYXRGQkJoMFFZaUJVcmtP?=
 =?utf-8?B?ZmxjU0s1NDNQK0RzTjY0WHNzeFBLcHJlNXc2NzhsNmFpbUowempWTXNJZ0Zu?=
 =?utf-8?B?TnFPMk81Yzl3OTV0LzdVek04ZjZiQ0pRemc5QXhGWmFEQXVkUE1MYzVGaU9h?=
 =?utf-8?B?bytIRHZLTXhESHk3UTdrSnh6djNhUUI3MGRFQ0xIQXZrdUdFcTFlbytNOGlS?=
 =?utf-8?B?bE93bHdXYTdTSGN4eVBqcUx6S3FLZGV0b1U5MlFERWhZbk96a2VsRGJQcTlZ?=
 =?utf-8?B?dkRSaitCZFc1OXVQcHFPbVdzeE14MGxGTDhyK2pjTFkxRlBLTW5Db1A1eVNv?=
 =?utf-8?B?V2pTMERPZjByNVVJa0JMWjVYRFpsZjFsdjBsMU5xWlJxQmk1cUNYY1lQd2Nv?=
 =?utf-8?B?M3h2U281bkpRL3l2djZVMksyUzhEZWRxd2xIZVBzcEhHTldGV3A0dnVPMzMr?=
 =?utf-8?B?VVJuMDdSMUhEMzM1VnVSQTlWRFJGWHhTK1BMMmcydDljdk9Yc2VpQTZmejQ2?=
 =?utf-8?B?cFE2SkUrVjJ6MndOTEFqMXdvQ3RLQ1I2UUhiMUlsWFZ4YmF4czA1ODFYZFEw?=
 =?utf-8?B?N3N3OVVneWUzRmxrTVJmWkVDaGVUZXNFNUw4ZUw2V3VJd3VKN293c3JUSEJR?=
 =?utf-8?B?ZVFFSGYraDBWL21wVFpmWXFudWE5enVCYkQ1UURZUUFlSWNkZmQwZFhJc2s4?=
 =?utf-8?B?dGUvb09RVm9JdE82RWJ5Q2pEZmF6YXhhZXJtT3JNOXR5MmdmV2twSVR2YWZR?=
 =?utf-8?B?WWl5OWlteElsQkhONUR2ekpkUWxDY1ZQdXNSZnpSSHdEYlF2cnFWR3F4ZHV1?=
 =?utf-8?B?bGV3N0tWQytCYk0yems0ODNnajVOK1ZGUGJjd3BLaFhUM3JRZWw5Sng0Wlcx?=
 =?utf-8?B?WXNXd2hsQXR6NE1rK29CN0Z2bTQ4YlVNRnZjN1pwcjZyd0psWTZ1dDhCdmpH?=
 =?utf-8?B?Szd2MTV3bURrRy9VVFN1V2lPcDNWTXZTN3IxTm4wWUFyMmhVYzcybEE0QmNq?=
 =?utf-8?B?RzFTcnZJWTltMEpkaEtmeWpabzIrWmk2ZFEyL1RPNnN4eUlTcTYvdWd2cWp4?=
 =?utf-8?B?WDZ4S2M1Rlc1aUpWUVNxUVpHWlFyN0dMcW1Cc29BUk4xTno4VEpWR3crcXdW?=
 =?utf-8?B?Zm8ySkdLd3dOdUhIWllVMUhQWlZCTnZVcWNYYjhCMk1GQ0lZdVduZk16c1Iw?=
 =?utf-8?B?ZnpFUStEQXlzelVxSlF4SnYxSXVxL0J6Q1BEUWFSMFl1YmhwWVBvN1JjS1Nk?=
 =?utf-8?B?SFgycnJ0ZUtpaVpTeUJrTCsyM29Vakh3QS9wNDBkTjZNcDNtVGZFSHJwZi9D?=
 =?utf-8?B?WTZmbGNON0lFUVpSd2hsL2thTHJ4ZFhMVjBqdnJGZERWU25PMFc5NUhsSUJm?=
 =?utf-8?B?VzVVbGVFUmY2WTBBQmJaZlBOYjRCWlFKMzczWFk1eTZnVkdldkVnNnljY1ZE?=
 =?utf-8?B?QlpRR0hPbGNyYjJpYWlwU0lnK3VkbDZ6UmEwSUVIMVNvOWo4R1cxbnFTd1l4?=
 =?utf-8?B?d2VZaFBUZFQ3SU1yWEdycTdHai80NXJzdGtWNWxZME00cXpHWEd2SFFNQkhh?=
 =?utf-8?B?Y2xjbVJIcUREamNsWURRdThzem9waVo2bHIzTDliQzhCeEhlVGlBYmJTMU9C?=
 =?utf-8?B?T0NkbjlIQ2pzVWhmK0FoZFVQM0tIVmFnZW5iUTZ2UFltUWlGaVNNeml6OHVJ?=
 =?utf-8?B?UDBaNlU1b0h4R21oZzNTUkhwejZtdDVBaFZ1Vk9hRkoxWEh6dGt6Y2lMcFVW?=
 =?utf-8?B?TEVzN0RUN0RkNGdZZytsOUNKbEZyekhZSXQ5cjhhRXFCN0VpeUtmcWRGTmR0?=
 =?utf-8?B?cGwzUEs3bUl0bFVaRGp0d3RZUlYwYVV0SXBMK0lPOTdUS29wUXR1VHlaWmRS?=
 =?utf-8?B?VjNpMXdWT2NVaUwvZ1F5Z1E0RjZQUmQwK3N1anZKdFVNdzhMQkRyRTlyUXBs?=
 =?utf-8?B?OFdLTllOcDYxalJIWmJFZS9Eek5RSnkxNTlrdDRsZy9URUptMzlmNUtuSWg3?=
 =?utf-8?Q?HB+WTajQEoLcPgwoR+JjwEfkc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4w3peC4ATf78JUnRFXSJKWR5tw+9WwwpBI0qIXTsxAgGd0ROqLrqFnuUOchy2yC+TSIv9RzVQODoeC6g6IKlwouom+M2psssdhcJghU/8M52jrE7tl4IGDz5a6+FS9XSMV1x8Ri1Adp+RsRS9BtTnVcl1J4JfyxmGj0umqT8BbPgP5gkLlqNtJ8dpXLroJtoHOeHJVobL8hTQPSiVJPBlMXIcv964Tp/W9L7Cm0FWEu9A0gg2EbT8anPvtntr8Hgzb1OVeRqo450XLqzT8JjY178yBrsOL7VMqxs4QbvbMFES1WAtj2XZnpeqlLX0TMgxmnMpXIBAxLLYb/IvQXfN7PD+72tI68/DEq3K9SZ6JO+LPmk9G5UbCHn1kGF83N/wYtraZFBjT4zI2Niutwxju/pcKsZSw2tkMZfMc5qA0+gAdtqv7r+B1gF0z2/Lev++pRth/Oqys25KKGZMQM3o8rwMOByLuMVOgghv1gjx7Jn/GIWMNz/P7xkRVMZXo2b/CWvR84IX+YLusULxjzRI30ANSAGw5vp5JEg2e5c72BNnDpD3SiHjcFaU32E0p/Cq57f/gulshbRq+ihVAbsDAqoXju4XK2+6BlD0DCB88Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138f51d6-f0ca-48d4-b063-08dcf70f2287
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 05:12:35.7785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmnLvT+suJf6NQ+LFFwVcHOEtfabZsN/bNAxsUguaAVBMPEAtmccYPQKjRqheU8SNwl40N3HK/fh6Csz1rdjag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7093
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-27_08,2024-10-28_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280042
X-Proofpoint-GUID: Gvj4LPA7RjBidU3t9CO8uB_do5CVw7AR
X-Proofpoint-ORIG-GUID: Gvj4LPA7RjBidU3t9CO8uB_do5CVw7AR

On 10/23/24 18:22, Kris Van Hees wrote:

> On Wed, Oct 16, 2024 at 12:01:36PM -0400, eugene.loh@oracle.com wrote:
>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> @@ -1275,6 +1275,12 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>>   		int		fd;
>>   		int		rc = -1;
>>   
>> +		if (prp->prov->impl->prog_type == BPF_PROG_TYPE_UNSPEC) {
>> +			if (prp->prov->impl->add_probe)
>> +				prp->prov->impl->add_probe(dtp, prp);
>> +			continue;
> This could benefit from a comment perhaps?  It took me a bit to figure out
> why we would want this here, since this is the case where the probes are
> already known to exist (they were discovered during program compilation).
> So, needing a call to add_probe seems out-of-place here.
>
> I do understand (after digging through the code a bit) that it is needed for
> USDT because you add probe name data to the usdt_names BPF map and probe data
> to the usdt_prids BPF map from the add_probe() callback.  But thatis far from
> obvious...  But try to keep the comment non-USDT specific if you can.  Perhaps
> just mention this is needed to handle probe types that are discoverable at a
> later time, because they may need additional processing.

How about:
                 /* Handle probes discovered after compilation. */


> I think that testing for prog_type == UNSPEC is not appropriate here.  That
> seems to be a case of leaking USDT-specific implementation detail into this
> generic function.

It's simply a construct that's lifted from dt_bpf_make_progs().

> One way to deal with this might be to add a test in
> add_probe_uprobe() on dtp->dt_active.  If dt_active == 0, then
> add_probe_uprobe() should immediately return (because the probe already exists
> in the system).  If dt_active == 1, then it is a runtime discovered probe.

I don't understand how that's clearer and even having trouble convincing 
myself this is right.  Also, the dt_active stuff would belong in the 
succeeding patch, already reviewed.  Anyhow, I tried the change and it 
tests fine.  So, I'll send out a next version of this patch, along with 
a new version of the succeeding patch (which had already been reviewed).

>> +		}
>> +
>>   		dp = prp->difo;
>>   		if (dp == NULL)
>>   			continue;
