Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378A546BF
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742242850; cv=fail; b=JS5uUhjIzPo08bEQ03BXnP3Wu83xHwFUw3UkcpJKbr6vxcsrJmjAdxfzZsGsDNhyRUGxwBF/cuLkvLxdvVzgz9GIX7Kf1JdtLm7zQOVPUxQ+ptgCTNt01hGzH9fXKDGWhxgpbr0v+EOzTsfBLx1byXynHU4dAprD5oW1whCqm3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742242850; c=relaxed/simple;
	bh=U7XKcEif+btRpHgU1bI+ijtuqoPc+BbbyTzj9E+7eCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YUZA1ItWqJbsd40I24jThJMt3Nm+3JIe9rLWu3DY8huvFEdSfQoiMQ0FrKv+zP/s5AVkXgLfHfQqBBEnwy0fIm6L1r7Bvdy5F2M8k8CbBjU0C1HioJWG13YtTP8UnYiLRkmozU6TyhKc4vvyN93nCsj9Ssgk0xEnJt19P03LviE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BnLTg3As; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mxn1TVXl reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BnLTg3As";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mxn1TVXl"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HJfuf8004436
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=vuWXYZ/D22rLgHzn6w2xgX3u1rmU6kU7btYoJ/uoE9E=; b=
	BnLTg3AsNhdq52DRuijur4W2EMEB4MidnBKhUDJfmszBghUh0vaogmVG8/rApWCE
	tmX3qf8kWeCADdC8bWlZi99RHPnVfclfvZUDpCaRfnwKN+tnugoaMlGqk5i631ee
	WxneVh2zn6KHQWSQ/SYQ+EPmgeHFY4Iq/Q+wTyaoi9glAo4yQVBuFhjw5zjPZtVO
	3cxADWqIXFAbUe44NISDqgXYfKv2RI9toj4yDwX1WSxfAIRwygQMViyK7Bs2Bdc/
	VdK5iSDgaQjiLWs6P+2t5As7a8ky2eaSzCRn4RE57lJlYlZbpx3oobaF7GgHpwu+
	Zc5coG0eJya2cbhCJoF70w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1n8btch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:20:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52HJFUMK009562
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:20:46 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxkxpaut-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:20:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1iKvG/KbzESQJ9eCQ3ZillOiPsE/fQ4HhBX/gvG6TeXEjpiNdRaTcWQbC4V8aV8EUTMVUNk6wgjTZWtBQ9etYk2UG5fP555SKaWTFZ3o4vkvz7afWufF9tsQVdk11ZdUGnLfJJWtGwyKm2tCgGtm8WDqX2jVf0H+XvqHGcQMUXOy+kQZgowjmVPbzkhaqZLMoAy3/xL7IpexANf5n2pUhpxOqJJM/YjwGb8TXn4FpIGY3lMMvD35ENrdZ91uOjSRGZsIbnQylHvoG3bSTsbm66d1mrsHB9AaQZ3cvWXda5zLrDHo/E0cXzVzxjmqEKU6cI8FC0bTAVv1lXjy16b7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s106vUICiM1yDfB09OIug3EB/KcrSlWiouejVAMobKI=;
 b=S4U8Uw5r/QGlQfnijBRoPJf0xLyYtVeFPd0/bt/cnaBitd1HDWlbC6sNthnfqvh7D7+8/DPS7LQ00Gkg2V57jzTHw9h7Ooe1ryefmOW6qH2m6SjEyicd4ALBE+PL6URcOSADqtcXGV3rZE+oSTL3wO6fsr32fuC6ymAtH2ElP3JZ3X3+k9KlCceHWNnYctpBs4ch68NBSH1AE5jKOVwX/+nwVNaGcU/oLUudjjFYjJsZ6sK1Uh/J1VrGnV/L3TvrPsZRyPisjnCaX/pWkSZ/lPGJVJ7rComU7VS4Kglgo+0FCy4BKkm1jjC1Btzh/hCbe5a36+kR/2+TpgM7NM5Dhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s106vUICiM1yDfB09OIug3EB/KcrSlWiouejVAMobKI=;
 b=mxn1TVXlFY0fhvH+iYSPEE+626hpquzzI5A/I05OTupk+XXuTBIRf/1rI+nxRIj49mWlQxtDF/aV4kbFjM220EQYk/JZv0kbPVNx2+aPFxH/RQtdO0+xI20a7Ru5gYAbMISexjaP/hsqm9sfyQcDxq46aMx9TOXDXWMH6SuJ9Xk=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by IA0PR10MB7136.namprd10.prod.outlook.com (2603:10b6:208:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 20:20:43 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 20:20:43 +0000
Date: Mon, 17 Mar 2025 16:20:41 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] bpf: fix have_attach_type() detection
Message-ID: <Z9iEGTtQ5UwxFkKm@oracle.com>
References: <34f1beb7ed7b330dcc9031f23483f546.kris.van.hees@oracle.com>
 <e0f0aafb-d76a-56ee-2e12-36f19da409d1@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0f0aafb-d76a-56ee-2e12-36f19da409d1@oracle.com>
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|IA0PR10MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce567c5-9d8d-4db0-ce78-08dd659131b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?MK2rbtaHPActAlNrtU89TEGkMxGU3wySoMEgGaDxce+BnVDXE92CIIu1Ha?=
 =?iso-8859-1?Q?YDbs3tedfduA+kMOJiXeWACZWjkCF+9A5Er5UdxROn0EqZ8V9P3R+hFE67?=
 =?iso-8859-1?Q?RbyxZIHat9xaCldODRUeNcHDEslEG0kdmFenWRgRph8meqGn1x1dlfg17Z?=
 =?iso-8859-1?Q?VuEzmT/URjTCB6dilQMHQbwTHvpH4jdcWQTGpcF2caznJYiD1IxrHLEyDp?=
 =?iso-8859-1?Q?8elNY1S4P8qcB/UgR2V6EipcImqpSCIBaAvRNkHI2hobBYnA9ajRML4T+9?=
 =?iso-8859-1?Q?YNFQ4RQVoSHpioS1/+XsRf9bKmnpSytxgYbydLdhJonOAb7Z4BHgwAzhzo?=
 =?iso-8859-1?Q?VcNqFf5llDZWMxE8wE+w4b0xb8zEoNcjXV10syu59YGElCE+AUBB0dUu5j?=
 =?iso-8859-1?Q?oQS8yozVOKKBoe2t5D1JtqsGo3rjFTBELghdPvv1o1F+5Xl6HlzyxXOq0L?=
 =?iso-8859-1?Q?hUUj5cttxjGKjM+kNQ6tvcqIDmw4lkkadDDKD2l3RLJYz883ngfUaraK17?=
 =?iso-8859-1?Q?7rgB7u/V628JXz1C5R/nCinirtHnFWeAo1YpeVbvyYDgYF3Izck0Lirm9E?=
 =?iso-8859-1?Q?FwgFKJCZChXyYeZ3Nq2PEp4yzga3Qs+lGMv+XHc8bN42BpJT724Gin0gMm?=
 =?iso-8859-1?Q?obfGV17dxl3VlWMhjYMLrNmGKukxb01G/bPuX0b6pnm/ZZtOq7WirdFQLW?=
 =?iso-8859-1?Q?59uCIt7ciwNXUoer4nAjxmnKkTFKJs+B0QboMkYN/zYcp7r0i8KRzup9rj?=
 =?iso-8859-1?Q?jriw1DMS4E7av89KH1U9i38B8zL4R9oTlGmWNdUNNQceTJbB/d8pIQnTM+?=
 =?iso-8859-1?Q?TjKcd2UzkU70idF5djv8O7wh3jLJuJoEi6XpCQcCIX1F9YAJvNKuZCTFN7?=
 =?iso-8859-1?Q?X04a6OPuCcTVOAO3mfRCQFpCbsxPPZhaJfvPH1DedURFY+cNTAfCTu43a2?=
 =?iso-8859-1?Q?AdFKcmryydLpPilywnfj9PXCWrNfzJXMTw83beVZJk/uP0K6mF4zm5+a3y?=
 =?iso-8859-1?Q?hbq/pLyXW7BE0rMyNBzc90WWFMZpS8HImYZKczIWlWty25wba9fDHcqCtU?=
 =?iso-8859-1?Q?Ymp75hPGQeDrASZjFHWA1uiN996rWblNNhac+gZ4E2EemKI4FvUNwtAiws?=
 =?iso-8859-1?Q?59tGexwJ5m5wRiHnWmbzM0u716f2G54o0UCTuMR3NB9+Ab/Ij2Uz7u2F5o?=
 =?iso-8859-1?Q?wZ5BS/m0faTWY1MedsQ+cJ1Wx/x8tm/dDdQVLvUZvwrJgmoeLGstNf+tQP?=
 =?iso-8859-1?Q?P57jiHvxAkP8fBJXoPTeOQghDPZxp+e9bU8Pmj2Jus1QFj6wAlisJOjdF7?=
 =?iso-8859-1?Q?vP6AGIwwJ6uz2nAP+v2AytMqkrN6Q1YlZiXeDK6NMQJoBOiyeF12INy6Lk?=
 =?iso-8859-1?Q?sAFSv/W1LNQ/GVbrQbGcy7GhpWppidb/r10bFAWqWCenTS9QxxQ64bcMGm?=
 =?iso-8859-1?Q?wpi+E78er0ClN2or?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?lOLXft/jyb9t36cYZlZ1iSLWguj1nV8GoTEf0TIRUFBBCFD/WzWNpGXC4/?=
 =?iso-8859-1?Q?3tLDFU0SHeBuVmwahlNedFOVsVjMw8JtaqaEdfV/PjxBtIFk8iviwJj/ZX?=
 =?iso-8859-1?Q?wYvirvp8KCax+VS+pTawnee3FaMVwourE3CsdYdu61WMR93ZTbLuTAEhLE?=
 =?iso-8859-1?Q?9Q/8QN9vYQQ5Melg7VrdMp0jtbSEuU+zClKh41znOz9i/UOZ8V08gLrwIb?=
 =?iso-8859-1?Q?zDKKIpZRovMuGEogm0oK37+sF6fbuymOBLP3mPuVg8PbRu/oH2jfoe81Q9?=
 =?iso-8859-1?Q?+9xWBKo15jltkEfAkbn9pNK3ncVjd99Cn9MokEIzbvgyjAvUW+1pTSiAl/?=
 =?iso-8859-1?Q?Wf96pjQHj1B5LuvB6oBjoSCsxRhJZpyWqACz67YLSPBJk90+4ncYSlZrLc?=
 =?iso-8859-1?Q?p+NXJdP2e4dcfFFBlbDqBFruuZAQVw8sM1WnnCCxL2GIzvBtOIy/XMQSa6?=
 =?iso-8859-1?Q?wrfPfEVDjgLS7eMxE9nsGAFqtWsrMzjdbPJDm0w63tqdZ6SuXJHqss7nKp?=
 =?iso-8859-1?Q?xMnBChy1ypYupHoQDJ9WtMgmvUbEz9qiACU6jfxWQE2uoJo5zPyBWhmMk0?=
 =?iso-8859-1?Q?sjFbSQRDe7DORH2p4h+94hDRuUuW0mPIGvALnktklGi8pCPechk8bloYSb?=
 =?iso-8859-1?Q?2Pnji6gR+UOsDS3G6XQ9SDwQSXkhekjYRIz69PaDCMGudYl8BzGpA9qRps?=
 =?iso-8859-1?Q?qS44+BBc9N7ullZFgrrsJHAa9qT3+KmaBYbN9k8Ja6TrOjWRDCkHZcp+Xb?=
 =?iso-8859-1?Q?eSKG5jmr6cxNWBNisZTliPrAkMeacbTX583m5VExgpWjQ4Ihi5nQ2hnr4J?=
 =?iso-8859-1?Q?HubamIuyz28zL8w+/uphfBhs0juJpnG41h82e0cFEBWEGx3J17Mw6FZTEZ?=
 =?iso-8859-1?Q?9mdRuabuKVny2Wn6HUrRch/FfTPTgJm8IfNN6Dj/6hObwmztiZK99k6mNE?=
 =?iso-8859-1?Q?Rl1QK1ynaXZKFpGpNnWwFpga830RTQUsAxcYFP34NdsceY37Y9dBTWPHGF?=
 =?iso-8859-1?Q?0ztRW2wRAhPB4QLubl7AbbfOG1Ej9feoJk3clg6v2f1Wl9Ks1EqZjY9T+Z?=
 =?iso-8859-1?Q?k0OxS9eEaOWGsYtEvbS19L/SzWI5FgVBZRMndCSJQ99INHlVRzTHWRp/M2?=
 =?iso-8859-1?Q?331SYekBDdEzXTTBU8loh8e3bGS/iiSdrcW/QBcfX9Hw3YWyRy4pbEfoey?=
 =?iso-8859-1?Q?z2Lt573KWAR2S7XhMzSMm1ogcUHOH94f1GtO+kENRrjKa2hcVFJ6v6c+Zo?=
 =?iso-8859-1?Q?1M+CWGc7TN5JyB5oXFNZsxTzFu5ZXwFL+KQd9I7XtzRfidlNFYXAjUO6a6?=
 =?iso-8859-1?Q?L2usFqviz8Y4cZPWi6ccASR3kVCOthWBA2HExPOGF5OKz/mczcrGdcL/ue?=
 =?iso-8859-1?Q?Mj5htG7cTqK7+XFDCb9ycbvNJo7O5+7/0yn+nWEWrJKVpJxlPhMJKAJmOj?=
 =?iso-8859-1?Q?lSMxUWuLJJUU1f6IETYs63pYYJpMocFlY4S0V5Mveypf5VU31XpIqG/t2M?=
 =?iso-8859-1?Q?TzDMj1fH0oPyCD3/6WQXicVZCqua9id4W1Db8AKkeqpEkHJ3RWj6wKxN1i?=
 =?iso-8859-1?Q?o7OpJgw3ShfbSxAr601EDGBqs3XVHSfrp8qYfivzomXs2/7CHhi07FjPvV?=
 =?iso-8859-1?Q?Csx42DmaSlMrcVafASLpZBLmtdJJdjjY6BTyfgyxgML3xhjoLhfp+MHA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EJoaoe8si5aKQCy6+6jW5AqLHplLgOBS2Hl+6g280e31P0UMEj/aDZWEl2Puzvuihw19TE5gHlvUnDCqfQc+h9p4o8IPxo9lCnOAFtDbMLDCgalk3JN7K8ncPz8VC1Hc27ZtEjyIMuhQucbLjqBVpafPUR4l/ecLiuIbfq0ZEOjmxscrT9L10MjVQQiTtIc8POW4efetLyuCB4tDiTS+3Cgx1BKNpCw8MZDttYv7c+IA5ZqxeRkdBEs+xJolCu2qtQffAzZ9XQ5Sxps90Ev5io0w6MH+cTZNSLo1ERKfnQQKKKLeaIsBgfjT5v60MYgidVbz6qwXi2aU1ee1DJYiax1QtDaKPzlF746k08gt8GR4i9r55gT4T3c+DaKsemtZdKJALFJri6fgoDR6fbXatrT4Zp1iAWa6q8x+34St/RBVIm7tl/3DMNT7ywuatCLSjz9mvAHURvatq1WqJ853jCOKzIIkihGeIzNl/2bgiy6QIeI+wX67EjRfla585W4hhNbUIPekGUoLDQ391bMoqduQO1xSAg+S0r573LRHgH5y/aL9lqyjV6xf1iDsYWCMC+I/YrtlTTA5Pa9zGj7q+2jRsTR7aUPloZe9kCBcM50=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce567c5-9d8d-4db0-ce78-08dd659131b0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 20:20:43.6455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppbD3mL73jwNv7qt8TEQrYsWMSeMyuPBpJnyWRV02HTY9sEQlS8CmHQG81YvmHtPaFqQGhLOTIBGkkN2vEPsxELklvDRYu+h+hMDSF+9J1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7136
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503170146
X-Proofpoint-ORIG-GUID: CqErEkR0Y-eAtv1nbofuut3JCCt7M7sl
X-Proofpoint-GUID: CqErEkR0Y-eAtv1nbofuut3JCCt7M7sl

On Mon, Mar 17, 2025 at 04:16:01PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Thanks.

> I'll try to run tests tonight.
> 
> In what order will patches be applied?  I vote for these two ahead of the
> 8-patch perf series.

I really prefer the opposite order, mainly because the performance improvements
really help with speeding up the testsuite runs.

> dt_prov_fbt.c needs updated copyright year

The perf series handles that.

> Would it be possible/practical in the commit message to mention kernel
> commits or version numbers perhaps?  Not a big deal, perhaps.

Yes, because it is a bit of work to hunt it down, and not really relevant.

> On 3/17/25 14:41, Kris Van Hees wrote:
> > There are kernel versions that support the BPF_TRACE_FENTRY attach type
> > at program load, but do not support opening the attachment point (a
> > kernel symbol by BTF id) as a raw tracepoint.  The cause is that the
> > support for fentry as a raw tracepoint was initially only implemented
> > on x86_64.
> > 
> > We now test both program load *and* opening the raw tracepoint to know
> > if BPF_TRACE_FENTRY as attach type is supported.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_bpf.c      | 29 ++++++++++++++++++++++-------
> >   libdtrace/dt_prov_fbt.c |  2 ++
> >   2 files changed, 24 insertions(+), 7 deletions(-)
> > 
> > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > index e50bb536..9ee32e8b 100644
> > --- a/libdtrace/dt_bpf.c
> > +++ b/libdtrace/dt_bpf.c
> > @@ -486,19 +486,34 @@ have_attach_type(enum bpf_prog_type ptype, enum bpf_attach_type atype,
> >   				BPF_RETURN()
> >   			};
> >   	dtrace_difo_t	dp;
> > -	int		fd;
> > +	int		pfd, tfd = -1;
> >   	dp.dtdo_buf = insns;
> >   	dp.dtdo_len = ARRAY_SIZE(insns);
> > -	fd = dt_bpf_prog_attach(ptype, atype, 0, btf_id, &dp, 0, NULL, 0);
> > -	/* If the program loads, we can use the attach type. */
> > -	if (fd > 0) {
> > -		close(fd);
> > -		return 1;
> > -	}
> > +	pfd = dt_bpf_prog_attach(ptype, atype, 0, btf_id, &dp, 0, NULL, 0);
> > +	/* If the program load fails, we cannot iuse the attach type. */
> > +	if (pfd < 0)
> > +		goto fail;
> > +	/*
> > +	 * If the program loads, we still need to verify that probe can be
> > +	 * opened as a raw tracepoint.  Some kernels allow the program load
> > +	 * but return -ENOTSUPP when you try to open the raw tracepoint.
> > +	 */
> > +	tfd = dt_bpf_raw_tracepoint_open(NULL, pfd);
> > +	if (tfd < 0)
> > +		goto fail;
> > +
> > +	close(tfd);
> > +	close(pfd);
> > +	return 1;
> > +
> > +fail:
> >   	/* Failed -> attach type not available to us */
> > +	if (pfd >= 0)
> > +		close(pfd);
> > +
> >   	return 0;
> >   }
> > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > index 1489275a..00f9174c 100644
> > --- a/libdtrace/dt_prov_fbt.c
> > +++ b/libdtrace/dt_prov_fbt.c
> > @@ -74,6 +74,8 @@ dt_provimpl_t			dt_rawfbt;
> >   static int populate(dtrace_hdl_t *dtp)
> >   {
> >   	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_fprobe : dt_fbt_kprobe;
> > +	dt_dprintf("fbt: Using %s implementation\n",
> > +		   BPF_HAS(dtp, BPF_FEAT_FENTRY) ? "fentry/fexit" : "kprobe");
> >   	if (dt_provider_create(dtp, dt_fbt.name, &dt_fbt, &pattr,
> >   			       NULL) == NULL ||
