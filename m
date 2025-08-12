Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3C72FDC2F
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 17:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755021276; cv=fail; b=nm/IDvEz3WWkawvP+zD57bDzJ2OruAkaj50lmOX9c5joqIKMycb70wvYyE1804qpW1QHFYixfZHKWP5yJ2/Ct9yr85PnvUS/EzPee8/xGl1IRMM9RGGWLyBZJyospJv/t5NJJRjvMq4vdg5jwRDbeUjcN39oomUv+sdgsmUEuU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755021276; c=relaxed/simple;
	bh=mYPnBWeIXFTPFT9bzQY9ahx8V1dcXt49ZhgOUZsKfw8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pogvx+8TNhuPlEZZ779EGPK/EHUuQQO+yr6jYU7UwJkKC40RtqXDzc96vabajXMtuaCNmR+qtJsY27wPOMzovpoCIiF3vUDtfQYFgY+RMkfyzGGdSYeWYmh15ogGM47Mhg7anKS66PT3pXRNd9j6YA+QMpSP6A8I+5AI89u7BkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BOXBgNO2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aQphu2Ab; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BOXBgNO2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aQphu2Ab"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDBvq5025249
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 17:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=U2/Dj1W9bO52g0dyAPgKD094O/wORAoo33t3ecolkeI=; b=
	BOXBgNO2vv0kjCRkczHvOUAP2oYJuacHBotiDdg9LI72PApl2b3DiXjLVzb1XXVA
	1F9G7UMcgQP90EfscZw2xPZlQebBVR/O+XHJi1UrdlNE971WS27mcI0fMKyIgzdt
	I+wD8jpsok/nLsByRjP/4tGKDDvz++oxt/N6yeDTluH2WiPHELtdGE3GNsB9Y0JU
	Vtb5Jp7BUgmX49WXbuKcaNmm3BJRvtQlLHViP7fsc80wiZBSRtV7kpzD7k4eQ3ZC
	dSNZ6SkrRm5z5Q00xiGyghkw8VKGmpG13Ve4fsiQInwIHQBwscYEVfA/wKmcsHOT
	7iPq7eyuqkFITqskYAC0bw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dwxv58wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 17:54:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57CGa8bq030190
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 17:54:32 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsaa0ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 17:54:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAutCFKcz+D+YGHh+N0/Yfs2zlS5+2qOjadz8brkZXbEz6u7BI3r93ibayVI65TZT816HelxAaLeHnhXGJ/EVbLgVKaPAMHA6aPmaYcLEZztfxZK/Z8IIJP4D2ICbYPQhUg8m2L8Ufxfh9CRJqycpi5vTAxEgc+66zvjpm/71XRcZV2Fmt6XnrkBjmQkNuS8qcAEO5kPFqjnmGtYfBaBLSKtngfO3tFb+wUQuvnmcadNnIoW1DMIG4XwVpS0vIURjqO9qSl39qsnvZhYxxp0IZWD1yXZlI/0U70yU9SMxWwa4WdZyrEot8b1tiAHkpkXZm6hO7FufU/5EQtE8TSz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2/Dj1W9bO52g0dyAPgKD094O/wORAoo33t3ecolkeI=;
 b=jjvU5vCnXyWHhtvr+Y15rk/M8TLd9bmOZD8Tzv/hrXGa8I6xFP4QjDysKJ92eu9AWjU1tOZiEK2DiECclIXXmN3wSfqLA4FppNR7F6a3eylBSQ69dAxrXRRW2xxSRwxYR2bl88V39PFqZMGOoOGUudDS37lAzlxKhwSvDb/mAKxD/Kw6F2DmD7SwGwFlibFyOqWw7KrjuigDbcns/+2hLwfOEwd8ferzZz1U/1nyvpyAgO6eiq9SXI/vAC7ZuuXjelEl6HcbCJClUShWj25kG9eODbbW/khg2nEt6Vv2KaDB5kkIW/CcaSmEViNvz6tApwNEvIy0TLzB+quZRaonjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2/Dj1W9bO52g0dyAPgKD094O/wORAoo33t3ecolkeI=;
 b=aQphu2AbO6joyZs4RY6Gcc9O0Ek8BV2XPl0NRugYVMJfUSLyrVYkS29V0f0E8+77AZI50bL3gY3DLKFZaOXNcyln21xufv5yUxTSBlsMebGQ5aK3PDCRM0WpWecyhrNiB8urIQYMHAAvCWl+RpR1m3WiAJB+bzSnFifnt/cm6rg=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BY5PR10MB4372.namprd10.prod.outlook.com (2603:10b6:a03:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 17:54:29 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 17:54:29 +0000
Message-ID: <f5760136-5c80-32d9-fcab-dc1dd51c976f@oracle.com>
Date: Tue, 12 Aug 2025 13:54:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] test: adjust sdt.tst.args.d for
 task_rename tracepoint differences
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672305D781B114488EA0800C22BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672305D781B114488EA0800C22BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::44) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BY5PR10MB4372:EE_
X-MS-Office365-Filtering-Correlation-Id: aad3409b-c575-4a6d-cba3-08ddd9c948cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3FFZ1dvbmNUUjZ5MWdKVWthTm1OcnZLQjFERmtCZEt0ZkxMS3JKUWt1TW5W?=
 =?utf-8?B?UjJIaFAvUkNsb0c3SjhiQXpwV3Y5bmZlTGF3T2FmTDRLUHJ3ZEpvciswTVBD?=
 =?utf-8?B?dUFrNjlodTA2RFJTdC9NRlFnM3pJWFY1eW9HQThpU2h4TWVYSDNpcHhuUGV2?=
 =?utf-8?B?WVg3RVlJZXQ2Qy9JcC9sTU4zWnp4a04zT3laNnkxM3R0UUw0b3VIV3dsaVNK?=
 =?utf-8?B?MkZsRkVoQ0M2eGhSa0xwZWNhYnZ3blpZdmhFN1k1UVNxd3FmZVF3S3ZFTWN2?=
 =?utf-8?B?MU5uajRxWDg2UHJNRUQzRm5WbVkrWnQ2T3hIWlZBYzdGY1JMR3F1eUZHYWVo?=
 =?utf-8?B?UlZOc1AyeTM4Z29NWjd6RW1ja3hrOElWWFZuTVMyRU1TNnVKTUZ2a3NVSDBW?=
 =?utf-8?B?ZFlHLzBxSlRiNEZicG5hT0dJNHROdnUvckxHclJTQmFkMHZPMFZGWTJhMldB?=
 =?utf-8?B?aC9mSUovRi9vdmVDeWk0NEt5cnFxWWhpVE12UTRHdktIeWdwNGN4OUpOcjlR?=
 =?utf-8?B?MFBtTmp6WTBzKy9PNHkzUVdORWdSV1pqc2ZEWEJ2ZVVseDlEMmYwWHpMQTFt?=
 =?utf-8?B?SVFnZzB2c1lXSWNZUUMraFdIR0VDUGdHY1crTFNKVkEzZDVQaUV2eEcxcThM?=
 =?utf-8?B?MTJHd3hzSncwZmdMM01yVndhYktVcFV4a05Cc0U1OGx2eEdHTUhzUTdhWW1M?=
 =?utf-8?B?RmEzZ1V5T2tFRm5FcGdNaHFYQjczTFJsdWJBK3RxcW1aUWdXYW4wRThlTDRx?=
 =?utf-8?B?Q1BvcUZiRm96czVOYVB3Y0x2dTVaZmxVdHlYOERmUGh5Ui96aU5hR2hSSFJS?=
 =?utf-8?B?TnhCOEpKS00wdFZ3c0c1SkNySjFRbElCYkZDRXgwbzIvamNhOUFjemszZFJq?=
 =?utf-8?B?MjdHcmpNTWF6MTVObVJKQ2pyemd6RG9iS1lESVI1ZzVSUlJ0N1JOUmxqV2w1?=
 =?utf-8?B?MXZUUDgwa1prZHRoRllOaW93M25CY1A4anlVY25jVGhENmFJNm0zMUxmZWNL?=
 =?utf-8?B?RWd6cFBWTnl5Rm53YjAzcUF2S3lVczVzemprVXVsVTNpdkRuVVpkZ0xrcmp1?=
 =?utf-8?B?SVdTRWxvb3l0OWtWRnQzV2ZieEdzQmVFRE9vU1QyRWRvdWZkelRMUVVkL1pw?=
 =?utf-8?B?T1RRVS91RnRpeWphM0dWRDdRaDZLTWpFZVV4YWdQdExyVkdsWnVZcDE5TlU5?=
 =?utf-8?B?VWhWMkJMZmdSdURrTDZLK3orNzdwVlRpOVFISDU3amFXTENTZHJScG5VaGZK?=
 =?utf-8?B?UFY1cmxFeVJxWU02VlI1cHBtNFpEd2todjZzNjdjclV4THVIL1BKdlQ2eXFU?=
 =?utf-8?B?N0tZZU9hVWRaWEhGeGg1V1JwWEV6anc3VTlLT2hBUmtxTm5DWTlkbkZQSjh6?=
 =?utf-8?B?TktVeDdJVmRMaEZpRzV5SG1qT0lLS0pnNGJ4OHF4cDlnTFFDK0Jpa2g5eDdP?=
 =?utf-8?B?eHdXTjIxSDMvZTlnYnZ0T0hLc0UyemZOWS9zYnp3a3N0YTV0SDZyck1idnRy?=
 =?utf-8?B?cFZIU0RvMXRXNVJ0bTdna3J1TTZFVkJQRUVuc3YxL2ZvYjJ5WGlhZUMraXRS?=
 =?utf-8?B?MExwSm5RcDRaRE55SDJ3NEhMY2tScHp2cjdUY080TkZzL2lQN08rdWxmOGhL?=
 =?utf-8?B?SDJSK1pweFdUUCt6VHBWMmRvLzFGY2o4MU92MDBwakRQcjFMUGpCdktRSVoy?=
 =?utf-8?B?VHd2Ulk3bzU0ejlmay9DRjU4NFpRNmVqa1Ywb1VvR0pqVU9MRWE2OTVVQmpl?=
 =?utf-8?B?Q1QvdS9ZdDlsR3ZpT25IYVlHQ3duRkhMNU1sOGZjNmZMUjM3SmZTVDF0aEVD?=
 =?utf-8?B?T3hHYzVNWWlzNjlYSm0xMXlHM2JzUjMxV2taeVcrZE9kTHgyYUFhd0JEOHd6?=
 =?utf-8?B?SEs4MUxOV1VLWkhmU2tEbkpQaWFoME9peHRmV3BPUlMxQk5HbHFHdjJ5ZTVX?=
 =?utf-8?Q?01KLQw0M0QM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elRuOUxybzJQbFRMd2pSL1lmNmU1UE1sV1RiQk1YZzZmVWIrZnJ3NXJjaGZP?=
 =?utf-8?B?M2M0Mm5YeXZSd3V5dXI2UGtVZmNhbmJYZGxXY3RkMzNpYkwrL2RhMW1TNzk5?=
 =?utf-8?B?UkRXUExXVkhIb1hyT0V2V3BiR2FTUW9PL240ZEdLSVVxdGFiWHVFK3QvUzR6?=
 =?utf-8?B?UTRvVjVzWVVxbHhzT2huQytaenkxNVppdTVVT1VyblB3N1k2REVUeXBSakgw?=
 =?utf-8?B?R2NWNjFwVTQyNXlFWE0vQWE1aE5sYU5iUHJzaHBqZHVVNnphdlRkV0dabCtD?=
 =?utf-8?B?VUI1aVZFR2gxYktPNGFZSDVYZ0Zmc29GdU1JM25QVmhzM1drcS9XcXQyaGVw?=
 =?utf-8?B?bUdxODBkRmJRK2p1S0E0ZUVhRm5SeXlvWDlOYzZ2aVdLZzZsajdVUnJjTDE1?=
 =?utf-8?B?Y3dTa1pyNHo5ZWZDbEh0T3hzV20ra05LWTc1cmhmY0xzMkNoRkVRMm1xczJO?=
 =?utf-8?B?alVuYXd3QXZjTzFrVitGTDZTNFVqTXZGQ20wSkNPWlF2K1krcXBIRmUyKzFP?=
 =?utf-8?B?eSt2elhybDc0NklZM0JZU2p3WlgvbkxwajBaSWRZQVduT1V0RTNMNU9kTDhj?=
 =?utf-8?B?UDgxZVp2bkdQWFpNWUxlY3JjVzc1VU1RL0JBV3lSMGxvbjFocW9PTVR0Wmwr?=
 =?utf-8?B?M3lRY2laZHg5MTVUeXRrREdROHFkSGhPYUZLSTBqbERUS2NQbXYwU2NTNUVY?=
 =?utf-8?B?amIwK25yMlZCNGNDSFoyTFpVeEZsd3RITzc1YktDZTJPQWluMS9GT2x1VlQ5?=
 =?utf-8?B?UmlDQUxUVDVtN3BNbDBxb0NtWW9yMGhDcjVOZWlNdCswZjlUMXNleXlhNzJE?=
 =?utf-8?B?SS9PV1NWMjh3RnJwMS8yZzlYMWErTHZ2VVRhRmtKa0t2K2hhUXlseVA0WFFu?=
 =?utf-8?B?R2k0Vkc2R2dzTkVHalJiYzQ0RG03aXJKTEk5dVZzdk1ubGx0NWFqUmhxeVUr?=
 =?utf-8?B?cFRibDZjTlB5c0FPVndFNFV2dVJUZVBWdC9tS3pINTUvQ3h1allKSjVxMElL?=
 =?utf-8?B?c3Q0Vmx2NDVzeHZpZUtpbzZYd1VKZFowKzJHVGlJd3ZYVUtsZzE5MEVETFhI?=
 =?utf-8?B?RWtJNDNIMmhBOXpycGkyWDRyV3c5eEJyMVpObzREdnUzQ1FUbEV5dzVlK1gy?=
 =?utf-8?B?bndmRnhhMDNEYUVxZGJndG94ckM3SFY5Tm5sWVM0cW11SDUrdUU0UGo3bkVR?=
 =?utf-8?B?d1lPVkg2bXBsanpRM2NFVmdkVzBCT3ZzK3ZQY0RZbno1RGhYcWVWREJ2RG9J?=
 =?utf-8?B?STNwcldhVWpBYSszOFNuSytNT3J4TTNObnFlS0xOakVjMmoxNjU2ejljY3hW?=
 =?utf-8?B?dlVIeEdlYXV6UExXUzlVUDdVMnFkVUswL2xudmxEVWZqaXpnckxLQUp4a3Qz?=
 =?utf-8?B?ek9kdGhJT3F6a25iMVFWUWIxcGdLNnA2dkFPWDFQaG1vNE9rV2d1aWRwbDc0?=
 =?utf-8?B?bm9GRFIrdm1UbllzZm9obzNkVFcwTVV1ZTJvKzZIY3U5ZmN3S0cwZVplY0dT?=
 =?utf-8?B?ZW9zYUxFVVk4Rm81emZBakhDV3RUaERkb01heEtmbUVMdUxMYXdKT2hualVv?=
 =?utf-8?B?YkNYTjIwdXJ3SUxheE02dmRrSEdZUnZwWHdLVjZOLzRFQ3RaOW9jZ1ZML3ZN?=
 =?utf-8?B?Q0tNWGVhbU5haXF1L0xxTml3ZnVWVjZLU3lnWFdxdGRsSklsT25tR1ZHRWZ3?=
 =?utf-8?B?TU45dTJVYzYveGVTckIxdXd3K3hTMEtyWE44cHNMb1doc3NMbmFCQkNmQzZ1?=
 =?utf-8?B?NDJOU2hPUmVLdXJrT1h5dWdSTElEKzBaYTJtTVg4V0ZVVDRqUng3djNxS2xZ?=
 =?utf-8?B?aGZhOThxYlp0SmNpd0YxdFA2RTRGOEFLNVZVbUdPVVJJR1N1NkdKMTFFMEp6?=
 =?utf-8?B?Qnd5ZG1NK2tGME5SRjQ1QzVXcW5PczdkSTJNWE9lY1YrejcyblRVc2xLcTZG?=
 =?utf-8?B?c2l4Y2N1MmtvUDZtOFNJelpPZ0Q4S0p6anprWEI4Vm4rUUZFSEMyaGxUSk5v?=
 =?utf-8?B?Ymw1VUgxRmNjY3NFYnF4Z1gyRnQyTklPUjl4RE14L3Z5VEZJSjY1OVBXazhk?=
 =?utf-8?B?ZkZ6UWczQXRNaG1CL3pGQkRqMnBwK1NOY2cxQ2tqYkoyRkpZdDl4S0JCN3pk?=
 =?utf-8?Q?FUP4wef1zpkOr5AHiGGp+zUYR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VxWHnpdtmcureur7VtggrE7sc0YZiME4dy0rkXY01+QiDq4oRJM29YAIYnokd2qTpefbkgvPYucxIaF+dkVFPvYQgufetVIm4KOskI85/+aiQHqhEwDXBoecK7ABhtrlxaxLHuBLNtRM5DxzSUs09fdi07N9/HxQW/j0jOYWrGCP0x3KlSaomBq096Lm+l8SdEpsTugrPVPkZx0PfWmFnQf5BfH8WA1YgbaZEiJl+RLjVnTAZh0+YBk61XL4+Lf5nHybF0eN0mC8H0brEK8jfGZHVyYLkJftebJrqPGKLwSJx5jO4fx6GcgKBC0JJynaD33zMJ6L/89asEVQwLhLsVTRp+AWlItuuUJmK42uFEwCRIODglQUd4PZg91WIsOzUt0/XGO5Az372fJ710pKsZH6g1xA6DzNV8ITNqCFDT/JPQ4N3wYBKb6UQdsbrUU9W8ZzoBvR0Ov4cnpAprLkcsULshuqiEnDqncJYyakk7lMNXe04TCpMjLiDHy2JYv1r/WyqBdITpxhdbwrB3MTvJ4dCcSogv8R5MPm5MPkFTCQjh1owEHBFvSL39PI1EHGq+t4T1pIaVW17/OP7VBkWuN/Lckkq4iC8mtYEcJTnkc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad3409b-c575-4a6d-cba3-08ddd9c948cd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 17:54:29.1857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOBx15AudUTA9yOcOZIzy87yYZ8U3ktqLL4bgCOFf2IAPtlXTB36jIHSiKsPLwRfID7625vfwbfFEn4AV8sOnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4372
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508120172
X-Proofpoint-GUID: nkafD1dKdfczZxa6i0iaUY54DLjVCtHx
X-Proofpoint-ORIG-GUID: nkafD1dKdfczZxa6i0iaUY54DLjVCtHx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE3MiBTYWx0ZWRfXzreHcrmQUbsS
 SjU5n48axaoUdDwa+szk7LAv/NGvXNO0N4oGglYHxKjhvyengtQvozvFFpisDqmQV1DJ6MOWEll
 t8c1XXD4BqEfB2GAaOruohHbth+jNpN6TWCoJ7IvKXeSvAsMuOmrmJi08MTmoo/EiIwBrC33Gev
 Xg5Npv6jU54nus3zOmzIHwWL8x+Pm+ADesUy2VC+ys9ZMqe1CSw6na3U58A1SdKRwGxhttHe1hj
 pl41CXsh021PkZJPmqgoXi6kRt9PWfqcev9UYdliPk4e14jJugOnLbBvBlkNuBSVRV00Imi0F4g
 jldn4LO1pezW68wUVBz04z8DPYwDZVY4S1JVJyMqDeFIWE6MtZPmznqa9eL+2RXM9cRZECWSljG
 cdlRD2+yoTlwkvHV3AhzFltvj99XkBqQrrIu5JdHnJwxokoyrNTQv1OH6id7YdEsF9vSaX7I
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=689b7fd9 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=QpxU7CHQZpag0AJcrGsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 8/12/25 08:41, Kris Van Hees via DTrace-devel wrote:

> As of kernel 6.14, the task_rename tracepoint provides only 3 arguments
> rather than 4 (the pid got dropped).
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/sdt/tst.args-3.d                | 42 +++++++++++++++++++
>   .../unittest/sdt/{tst.args.r => tst.args-3.r} |  0
>   test/unittest/sdt/tst.args-3.x                | 14 +++++++
>   .../unittest/sdt/{tst.args.d => tst.args-4.d} |  0
>   test/unittest/sdt/tst.args-4.r                |  2 +
>   test/unittest/sdt/tst.args-4.x                | 13 ++++++
>   6 files changed, 71 insertions(+)
>   create mode 100644 test/unittest/sdt/tst.args-3.d
>   rename test/unittest/sdt/{tst.args.r => tst.args-3.r} (100%)
>   create mode 100755 test/unittest/sdt/tst.args-3.x
>   rename test/unittest/sdt/{tst.args.d => tst.args-4.d} (100%)
>   create mode 100644 test/unittest/sdt/tst.args-4.r
>   create mode 100755 test/unittest/sdt/tst.args-4.x
>
> diff --git a/test/unittest/sdt/tst.args-3.d b/test/unittest/sdt/tst.args-3.d
> new file mode 100644
> index 000000000..ae070cb72
> --- /dev/null
> +++ b/test/unittest/sdt/tst.args-3.d
> @@ -0,0 +1,42 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +#pragma D option destructive
> +#pragma D option quiet
> +
> +/*
> + * Ensure that arguments to SDT probes can be retrieved correctly.
> + */
> +BEGIN
> +{
> +	/* Timeout after 5 seconds */
> +	timeout = timestamp + 5000000000;
> +	system("ls >/dev/null");
> +}
> +
> +/*
> + * The 'task_rename' tracepoint passes the following arguments:
> + *
> + *	char	oldcomm[16]
> + *	char	newcomm[16]
> + *	short	oom_score_adj
> + */
> +this char v;
> +this bool done;
> +
> +sdt:task::task_rename
> +{
> +	printf("PID OK, oldcomm [%s], newcomm [%s], oom_score_adj %hd\n", stringof(args[0]), stringof(args[1]), args[2]);

It makes no sense to report that PID is okay.  What is pid?  It isn't in 
the test and it isn't in the probe.  It is only in other kernel versions 
and in some other test.  Emitting a PID OK label is not necessary for 
matching with the older test since different .r files are used.

> +	exit(0);
> +}
> +
> +profile:::tick-1
> +/timestamp > timeout/
> +{
> +	trace("test timed out");
> +	exit(1);
> +}
> diff --git a/test/unittest/sdt/tst.args.r b/test/unittest/sdt/tst.args-3.r
> similarity index 100%
> rename from test/unittest/sdt/tst.args.r
> rename to test/unittest/sdt/tst.args-3.r

Again, PID OK makes no sense here.

> diff --git a/test/unittest/sdt/tst.args-3.x b/test/unittest/sdt/tst.args-3.x
> new file mode 100755
> index 000000000..80c135543
> --- /dev/null
> +++ b/test/unittest/sdt/tst.args-3.x
> @@ -0,0 +1,14 @@
> +#!/bin/bash
> +
> +read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +
> +if [ $MAJOR -lt 6 ]; then
> +	echo "tst.args-3.d disabled on kernels < 6.14"
> +	exit 2
> +fi
> +if [ $MAJOR -eq 6 -a $MINOR -lt 14 ]; then
> +	echo "tst.args-3.d disabled on kernels < 6.14"
> +	exit 2
> +fi
> +
> +exit 0
> diff --git a/test/unittest/sdt/tst.args.d b/test/unittest/sdt/tst.args-4.d
> similarity index 100%
> rename from test/unittest/sdt/tst.args.d
> rename to test/unittest/sdt/tst.args-4.d
> diff --git a/test/unittest/sdt/tst.args-4.r b/test/unittest/sdt/tst.args-4.r
> new file mode 100644
> index 000000000..52854c0b3
> --- /dev/null
> +++ b/test/unittest/sdt/tst.args-4.r
> @@ -0,0 +1,2 @@
> +PID OK, oldcomm [dtrace], newcomm [sh], oom_score_adj 0
> +
> diff --git a/test/unittest/sdt/tst.args-4.x b/test/unittest/sdt/tst.args-4.x
> new file mode 100755
> index 000000000..74a0234bf
> --- /dev/null
> +++ b/test/unittest/sdt/tst.args-4.x
> @@ -0,0 +1,13 @@
> +#!/bin/bash
> +
> +read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +
> +if [ $MAJOR -lt 6 ]; then
> +	exit 0
> +fi
> +if [ $MAJOR -eq 6 -a $MINOR -lt 14 ]; then
> +	exit 0
> +fi
> +
> +echo "tst.args-4.d disabled on kernels < 6.14"
> +exit 2

The < should be >=.
