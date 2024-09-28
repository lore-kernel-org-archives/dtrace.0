Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CDB6FB9
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727489532; cv=fail; b=NpfUOQHnmvEjt2FdicrDYMQPGDod5mxicpKvpr0BO7t5eRvF19ZHJvqZzIShi9P8Xw3aZmVC9S18i3AVm/E3IxrpVzODaRpXXvJV2dady3VJUjiwNEQ5MTAQOvORHb/JUWpcQdrfnvctrI39i+cg+9MmOxsaGOEh08ogUhnEPGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727489532; c=relaxed/simple;
	bh=/3BFTQ0KxvK2c3k5esMCIa2ba1je1sKgZdK8TJgj3bk=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZqvrkYgps0pBP6cYWwhX5JreCtDB38YoSXd+yyTDi2MZKMP1HUOkh9qHYMu1ySiW64rIF/43IIrc/zI3CYzYwPfOksVSbFnnvXuuYgoXAfAP9oi9bWWEokCbKyNesgjXE/eqW+6AhKH2KjmZpb5nBwchu/+5yzEpYl+OPgxt/GQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hezTWNUa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QUtVCoRc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hezTWNUa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QUtVCoRc"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S0gNtF025437
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:from:to:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=l6tCmrPOHMy1JRRCZb9PisbIC1aMkqtBmOmbG+rQWAg=; b=
	hezTWNUaNYiBSSBehSzlU4cD5PTveQb77yTToiWwfcpaFhrHt/4Y+6PrvFBHlhwC
	n7fkl1/7IcRscWvoaU6isyJWXpkhyoJIs6TG5Nc8Temf5sEcRfmXMLhTH5sYFMTs
	b7Y0qDOH50BQvS5bqUn4UKg0nQCJvjoFNe8ehQ2boYtc2fpc20ITBos2+oVREo06
	j4B47R4t26cypYhDKwKVZSyAYfOswPK9WUGPElMtUThoFdy68tDkeHZ2xs6wEwHh
	Bfk5KUL9dKrAS/3kDX25nzgcAl2lWDAdy8kVV/SAh5KvvULh8F0nnD9mE2iZW0Sz
	2NrSVuUw/TefTyJARMP8nw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41snrtecn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:12:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48S1XF69017368
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:12:06 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41x8848j91-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:12:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jig/99wmP3jjxT4Qc8T3DCE3TVe86f+pSRTuaNLVGB5EVDMQu8kkSkT0SQN47143bk+faM7yw4i4t28DpORv5B5pLv++ZGchsPhoROG9jMUJF8/EYkQrR9LoMw7rt2eiGscOhK0rSAGAIWLrGxDtsi2Sz5QW8E3AFQBu0BU5uOwUG+LIXW4lNuGoE/CDeZDuWjm8ToYfV04/MTiRlphpmosX/75qD19Qgn85U2rSXiNJ/Ex1DdbsMYpDWy5ZYtiWsLcJYZeRJzxwrBMPlRIpVd+7Z75FPbdVU+GFDhksO7LoOiQOpNnwoS0rpsv/992CTZ0B4eFiaQwHk7G1AoeS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6tCmrPOHMy1JRRCZb9PisbIC1aMkqtBmOmbG+rQWAg=;
 b=kbJltN9rORNcsRbfTYRh7X0/QUIqnBWEpk1USM/EnoAbGe3DhDt60KeNyWpsUzkuZmfaXGbYJ+ahBoIwAG/I7Vu7myZMzw7uxnvt7MVmblvXOXDK5BydiROh1sTvXJQ0oVRfLStyOCHSGfcAIneCKreAQIe8yfy/rUPZ/b6/GldPcR1VthTdm4pq5f+QyTFlkFjjwjaT02qcDiD0CIu5WbDPyqAv8EHU+A5twIAxSBoi7xTXnXt38tdLPf043Nr4JhPh7lJBrNNmjuDM7C+osxPn5b/NF3uv4GN6xLfEa9kNkjNUts3zbIusuMcMWvgx2PpOJQyjeoSTPfmU1b8dSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6tCmrPOHMy1JRRCZb9PisbIC1aMkqtBmOmbG+rQWAg=;
 b=QUtVCoRczwkvRAiuVc/dAtyboSXvWDRQTTib0uJhUg2mCDyuvyEA2FF4w1K5GkBpIsZgZpI6ZD2308ZydQtCmYia3NTNHX6TCcfoqcCZ0I/mbZB/oSMhgwBqAhy0mYZU539B14M2y+kXhLPYxmRlWzsfkVsyEAxcQHbjkCvnCsI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB7240.namprd10.prod.outlook.com (2603:10b6:208:3f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Sat, 28 Sep
 2024 02:12:03 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.009; Sat, 28 Sep 2024
 02:12:02 +0000
Message-ID: <1619f836-f974-8c7d-343d-913e387690ff@oracle.com>
Date: Fri, 27 Sep 2024 22:11:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 18/19] test: Add a lazy USDT test
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-18-eugene.loh@oracle.com>
In-Reply-To: <20240829052558.3525-18-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:208:120::43) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d498b8a-dd32-4c8e-0220-08dcdf62f141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0VLVm0yNW56V1FucEVpTWxDSXlmQUlmMEtkS3RpVGJEOTRIQUlxU2dhT0d0?=
 =?utf-8?B?amNYUEdiSVVhbTlxSGF6WEhsUjk4U0laNmNYSCtjUTlNcVkvbW9Fa3J6eEV2?=
 =?utf-8?B?UG1RU2pkSmFqVytNS1FrVHJEbXR1ckJjS0dTMy9LNDI3N2VJamNvM0hULzRz?=
 =?utf-8?B?ZjV6U3Bubm84RkRmSXMrc2dnQkg2ZE9wRlg5aktsaVhpY1I4SWw3WnZOalRK?=
 =?utf-8?B?Tm1BVWpBa3RUZDFzNkk1T3IyU2g3d0FiWDJTNzRzcTdpMVNXR1J1ZGkzc0NN?=
 =?utf-8?B?amFybnpVOWRERHFUQnljQ1pQNWRBNGZ1TzFyWko4eW03WDJmUnpVSHY4Ukht?=
 =?utf-8?B?TjdzZnA1dk5ZakY4a2piUXd4dUVMODk4bEVRcXVlT00rcTFUWWtWOStsaUJS?=
 =?utf-8?B?K3M2TnovMG91eXJnSXdQc1Y4MytlczFzdHJxRE5xcjZlT0F3YjhNdnUyUlhh?=
 =?utf-8?B?Qm1tcEVBU0syaHJXRjluSXlEaDJ0SWlFZytJclM4VjlUVmFucVJra0NkYzZL?=
 =?utf-8?B?a0RIRVdrelNmeGtZczZHdVpqVDI4bGRWUzFCVm1MZWJRRm1BbEVEV1lOTHcr?=
 =?utf-8?B?Nnpac01MZERkSldNbDZhTlVNaUdQaVNNR2thRjh3MzF2b2hueUs5T082NTQ0?=
 =?utf-8?B?SFVJcThYUllwNmVDcE9tOHR2NVAwV0F2c05URFMveGd6NGcxTkMzeVEybmRR?=
 =?utf-8?B?YUZSRTBzbVo3Z1ptRGFyNzNZTXY0UHJYaHF2SFBWUVNHbVRMVVR4Tm5GSUZJ?=
 =?utf-8?B?Qm1kcDBvSjI5bUsrUS9nK3hIOVFuM2JpSjRORFAzQlpnRFNSUXB1cUVTajZN?=
 =?utf-8?B?WEhhRlM3akJQbXBjSllEOW82WkhWZUlKTEVoSWQ3RzhIQTlMZ0FkN3E0Mys3?=
 =?utf-8?B?K0JXR1czQWZ2ai83aHArM3VBckcwbmtFL0pNV1FPQnAzcFlqUElFdUE5WlZi?=
 =?utf-8?B?M2g5dEtuSjJ6eEV4OXAzV09qR0VDV0dlNkl3U1BZVElDN29HcHkyTC8wOEs2?=
 =?utf-8?B?bS9YQ3UwQ05oaktoaFgvVm00TUVxT3BhMi9yN0w0RThLblMySEtSckw5dkxY?=
 =?utf-8?B?ME9EVVhBN0dRZjAvdDN5bXlYc0Zzcm5ib2xONGV0VW5KK2JsWkhxakpDUnJJ?=
 =?utf-8?B?NU5aNDJMNythcTBoc3N6MVZKSE52VnBiSERkUnRRN2pqbWNPY2VOTEhFWitX?=
 =?utf-8?B?ZGhZUFVTNHk3UDBBUzA4Z1FmcDBiVCtoai9FZkt3Uk1QZFRoL1RoUUhCV3RO?=
 =?utf-8?B?MEYwYm9OT3hEWkt0MWdkVW5CdlZGcVVQNGRWdDcxU0E0ZkNjYUM2K293TGVs?=
 =?utf-8?B?bnRHc3gyc0tWZ3lPajFaOFJXVVF4aVMvUkxleTlFZFk5cE9DeDcya0MxQm56?=
 =?utf-8?B?Zm1XMlhNR0hpVlpjTm1ySzJOa3pIZC9qWFhoR0FWOURwaHhCeXVBNlpxQURZ?=
 =?utf-8?B?MUNvVGRuemlpSXE1UnlQNWQyMGxyRHVHRmNzKzc0b2o3TjY2NnRQZ080SVox?=
 =?utf-8?B?Mkxka1I1Wk9PY21GcS9uSU01c0FCSEtJZEtkTjd1dmNheXZFWVpIZkEydEUw?=
 =?utf-8?B?YzJrdm9PeGNWc3ZBblRWT2tjaHF2bVBIcEJiZ01XZUl0TFFUWTl4NHBoY01E?=
 =?utf-8?B?NnBPR0FkSXdCdWVFVHVhZHlBMEN6NDdwRUxKTEJFZXZ0YlZSY2wzV3FlTlpx?=
 =?utf-8?B?azN0L0JvZVN6d1dwNGVxN1JlOHNqT3VwWE9IWDBOd28wSjd1VFYrWmlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnExM1IzclliTlBVSHI0d2pTTWpYWXhIUlpaRFh4djhzREY1ZGs1RzYzUkZ4?=
 =?utf-8?B?c3BWT2ZkbzNCUVR4VzZMaHFIMlQwZHdOVks3QzdzWWdJNDA3UHpTNWJGMnpU?=
 =?utf-8?B?dnNGZTZMUGpjS0dzNGlPWUhOcm5VdFlINDIrUkZZZ0ZpcXUwQmE5bm14cyta?=
 =?utf-8?B?WDFmN09XaVpuZmxiZHBVb292MXN6MU5nMEduZnpRdkVDN1h4N1pQMThwcHh4?=
 =?utf-8?B?SUcvTC95cjZTcXhvSGdMa2c0VTBudXFFcm53aURGdlVSUzgyemFNSlYyWFhW?=
 =?utf-8?B?YkFwZUlubnlZbEpLS2RWbTB1OGlhN2E2ckgrdmtJdW4vK3JoQldBZWRxZ2Fz?=
 =?utf-8?B?ajdidnBiU1RSRVJ3Yk5UbzR2UnlXb1BITkFCalk0cThLa3B6NUR5UU9kNlU0?=
 =?utf-8?B?WXVUUlkvK2RjSU95NjBuQUNzUkM4c2JkcHFOc3VBeVhGOEVUN1FvbXNuSEo3?=
 =?utf-8?B?WW9Zc3BncHArTHZ1WUd1T3hYWFk2RlRXQnVGbENpTjVmeGZvWi9sWUgreEZz?=
 =?utf-8?B?SVFoTGI0MHFJb24wR0xoSThOVGV5aU5UMkEvUTkxeVdQZS9EVjVsRk41UURK?=
 =?utf-8?B?OE9pWXU3ZEdwc1ZVbGxleVgwVmlPTXlITlk3RVhZU3pYMXNwbEdUOWhBaVpL?=
 =?utf-8?B?TXV0YWdKZ2VaaFRGckdkVlIrOTlvT1dJcFRTTTZoaWp3eEhpYVVRa0xhRlFY?=
 =?utf-8?B?MW85ZTVXcXZSV1RPdURIcW1CNlp0ejArQm94WXRWalF1RS9GNGR4aGc4dmR5?=
 =?utf-8?B?bGJBYTdoOVdHUzFueVpTbjduK3drRDBmZ2hVbzhUR1gxcUt5LzlZQURzWjYz?=
 =?utf-8?B?S0tTcVN5V0RpOVJ4d3ZCc1hkU25NUGFHTnlHeGdTVk84WWdHUkMzbkJJVUlC?=
 =?utf-8?B?clROdjg0SHpLa2NpWkt0VmRiMm5oUHVpMVp2M3hDVVNZaGxaQVc3bEV5d1VQ?=
 =?utf-8?B?dFFxNlBlL1BMczhhOG41N1JlS0NmRUdPSXAvT3VucENmK2xHTkxqNGZsT2s0?=
 =?utf-8?B?eExaTmRzMk9FT0x6ZFlSTU42aGtkYUZtSmk2SDBtWFJ2RjNvOG54ZXBxL3RB?=
 =?utf-8?B?RmNVc3Zka0R5T0JXeVlkbWdDNE1mUzd0YlBNN2ZVSjdhcC81VEdHdGQwaHFD?=
 =?utf-8?B?YWcvbE5qdGMzeGRYUGVCcmVIcThnUXJoMEFJZy9zRFdLREQrV3AvMmlsTURq?=
 =?utf-8?B?b1RpR1NlZWhpTjFtNnJ0ZVpMTlkyVmVHQlNabVV6aVE2b2RZVENSRlZYZUp6?=
 =?utf-8?B?NkhFVDJHWGd2dUxTMnh0VG1oOFMxMnBkaHNHVkIyRm9vazFyV3JvR1NQOW5u?=
 =?utf-8?B?RXdBK1RBN01CZmt0QzlQWEV3ZGRFMGdLdXNSQ053MGViQ0J4ZytBVWd2Wllq?=
 =?utf-8?B?MHVnS3B0aWtnMFVVY1IxNHppczRDSGtHcHU3TkJHRVJja1JaOXZ5d1o4blFQ?=
 =?utf-8?B?dEJQbHRPNzgrT3NzbDRvTWdVZUh0QUhRdE1wN0xHTEdBSU4xZlBOQ3J3Smc1?=
 =?utf-8?B?Z0dLdytLWHNKL3lnZm9PSSt3NjVJQUpBODJvZGhYbEl4cEZ0a3A2TnBRS1RT?=
 =?utf-8?B?cHlLNnBXOHgzdEdiZlF0NHJEcGVxNUE4Y0lIbC9PNnJROVE4MzBzZGhNeVRl?=
 =?utf-8?B?MjBMdDFseTUxYXZWMk4wanpZbzVOR2U5aVJhRGxpZjdVSkcyckRIeVNtSmpD?=
 =?utf-8?B?VVFjeVNCSWlQV0dtUlM4UEQyRTZTM0t3T2RpcGpTWXkrL2o2L05EOU5YVEIr?=
 =?utf-8?B?cHdsdzF5aTJ4Z0RqcFhsWjFwVTJ6RTJZZHhOQy96a2piSG1odmMzNHgxQktE?=
 =?utf-8?B?YUQ1OVJ6azFBVFBYZ3dVNHYzUkh6eEo4Q0dhQ2tVNHNpLzV6dGpZSXVrV1Rx?=
 =?utf-8?B?ekRYbi9FZVVWK0dnR3ZIU0twNloxNGZnRkJONlFDYUM2SFl1bTJDdDIvcHlj?=
 =?utf-8?B?MFNmclJvdW5DYjhPc1dxdWVhVkg3NERhUDlqSXFVaWJyRnp5ZWlYYTR5RUp2?=
 =?utf-8?B?cnlIU09HSy9LM0JJdHBhT2NMeWkyOGx3SlBvUDFPZWwzOEV1bEx0Z2N5cGgw?=
 =?utf-8?B?WEVWODNoVjV6TGlwaUFJZkN0RVBxTjRJWk5LMFF3eVdzSnBHeWJoVDErYmp1?=
 =?utf-8?Q?7TCFQVWbclYO7ALYUaKNYVDgt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ibrWP1wr+Am5UeiJaXpouzGcibrn9rWY/D5tZwxbZpWeBcun/IhWOWNtlH2DFujP5fv/6Hr0FumynYwvD+utDety7EsaOXWKvNdqGKnmPoEnkyJgU7GfH4nGjcUFGBwgoDQa3p1XKLoMt9mP3/cQTS3pr4+0FAjzYCy/m3ESreKcotWB9OSEXzgKSa0mYJAsSDVAVLULa5RdFsH/jCH1VKtNCClmZIuyW1kOaUGd+5jY6gsMKVG1o6b0zorje5MpCbiwka4s2Gf6U+OZ7Y4woubKYTeNPekzBo5RNJpr0xRjSqU+3JuBMfKs2eTvkODBignlL5v11dH+uo9arpnCoggcCxJszC53emL7sAsbtXcT7lTNTD5uBf+6eStaCZQNSddPsvIRygMr7RDOCEMbaeBJnkRiuplYSDR0Aq+liDEQFWuHyjvGPnznEj7DgEOinpTKXFacnWv50Kbk3ekPdl+sPuVNT4YH8Wi0cKnxmIoNRLcO0YijX8s0owDjfTg3ZEcqjxrCSBpGC1kCZBxNpN+bNz+sniwB5MXTB/M7MRXVi+C6IIbpkOXQuT5rzx0VLhAT6LA94rnWK3bFSGoSQM01kZnvATSjEqMepL14IBY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d498b8a-dd32-4c8e-0220-08dcdf62f141
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 02:12:02.8177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDceKW232r0UYZ3IOjwQg1phd24QbFalS66pFIbf4JZelkZ6IcafBJFBanOx5cilLO9TGwHLHptGWd8WBpWEnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7240
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_08,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409280014
X-Proofpoint-GUID: PXLMLx_Ptf12UKLNJkjJuQjo6Rzwazg7
X-Proofpoint-ORIG-GUID: PXLMLx_Ptf12UKLNJkjJuQjo6Rzwazg7

I'm withdrawing this patch.  The reason is I'm going to send a short 
patch series on tracing USDT processes that appear after the dtrace 
session has started.  It will include new tests, and this test fits in 
better there.

The new patch series will also expect the update_uprobe() function to 
return an error code.  So that modifies:
     Add a hook for a provider-specific "update" function
     Create the BPF usdt_prids map
and I'll send new versions of those patches out as well.

On 8/29/24 01:25, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> When new USDT processes start up, we do not immediately know
> about their probes.  Our detecting these processes is "lazy."
> First, dtprobed has to see these processes and then dtrace has
> to find them.  Hence, many of our tests XFAIL.
>
> Introduce a test that accounts for such laziness.  That is,
> the target program spins in "phase 1" waiting for USR1.  Our
> D script watches for a USDT probe in phase 1 and raises the
> anticipated USR1.
>
> Then we expect every USDT probe during phase 2 to fire.
>
> Currently, another limitation is that at least one USDT process
> has to be running when the dtrace session starts.  So, start
> one process first, then the dtrace session, then many more processes.
>
> We start "many" processes so that we can filter on pids.  Specifically,
> we expect the phase 2 USDT probe to match the last digit of the pid.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>   test/unittest/usdt/tst.lazy.r  |   1 +
>   test/unittest/usdt/tst.lazy.sh | 245 +++++++++++++++++++++++++++++++++
>   2 files changed, 246 insertions(+)
>   create mode 100644 test/unittest/usdt/tst.lazy.r
>   create mode 100755 test/unittest/usdt/tst.lazy.sh
>
> diff --git a/test/unittest/usdt/tst.lazy.r b/test/unittest/usdt/tst.lazy.r
> new file mode 100644
> index 00000000..2e9ba477
> --- /dev/null
> +++ b/test/unittest/usdt/tst.lazy.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/usdt/tst.lazy.sh b/test/unittest/usdt/tst.lazy.sh
> new file mode 100755
> index 00000000..348a70f6
> --- /dev/null
> +++ b/test/unittest/usdt/tst.lazy.sh
> @@ -0,0 +1,245 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This test verifies that USDT will see new processes, even if detection
> +# is lazy.
> +
> +dtrace=$1
> +
> +# Set up test directory.
> +
> +DIRNAME=$tmpdir/lazy.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Create test source files.
> +
> +cat > prov.d <<EOF
> +provider testprov {
> +	probe foo();
> +	probe bar(int, int, int);
> +};
> +EOF
> +
> +cat > main.c <<EOF
> +#include <stdio.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +#include <signal.h>
> +#include "prov.h"
> +
> +static int phase = 1;
> +
> +static void
> +interrupt(int sig)
> +{
> +	phase = 2;
> +}
> +
> +int
> +main(int argc, char **argv)
> +{
> +	struct sigaction act;
> +	int i;
> +	int nphase1 = 0, nphase1foo = 0, nphase1bar = 0;
> +	int nphase2 = 0, nphase2foo = 0, nphase2bar = 0;
> +
> +	/* set the handler to listen for SIGUSR1 */
> +	act.sa_handler = interrupt;
> +	act.sa_flags = 0;
> +	if (sigaction(SIGUSR1, &act, NULL)) {
> +		printf("set handler failed\n");
> +		return 1;
> +	}
> +
> +	/* in phase 1, loop on probe "foo" to wait on USR1 */
> +	while (phase == 1) {
> +		nphase1++;
> +		if (TESTPROV_FOO_ENABLED()) {
> +			nphase1foo++;
> +			phase = 2;
> +		}
> +		if (TESTPROV_BAR_ENABLED()) {
> +			nphase1bar++;
> +			phase = 2;
> +		}
> +		TESTPROV_FOO();
> +	}
> +
> +	/* in phase 2, just loop over probe "bar" a fixed number of times */
> +	for (int i = 0; i < 10; i++) {
> +		nphase2++;
> +		usleep(2000);
> +		if (TESTPROV_FOO_ENABLED())
> +			nphase2foo++;
> +		usleep(2000);
> +		if (TESTPROV_BAR_ENABLED())
> +			nphase2bar++;
> +		usleep(2000);
> +		TESTPROV_BAR(i, i + 2, i * 2);
> +	}
> +
> +	printf("%d: %d %d %d %d %d %d\n", getpid(),
> +	    nphase1, nphase1foo, nphase1bar, nphase2, nphase2foo, nphase2bar);
> +
> +	return 0;
> +}
> +EOF
> +
> +# Build the test program.
> +
> +$dtrace -h -s prov.d
> +if [ $? -ne 0 ]; then
> +	echo "failed to generate header file" >&2
> +	exit 1
> +fi
> +cc $test_cppflags -c main.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test" >&2
> +	exit 1
> +fi
> +$dtrace -G -64 -s prov.d main.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to create DOF" >&2
> +	exit 1
> +fi
> +cc $test_cppflags -o main main.o prov.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to link final executable" >&2
> +	exit 1
> +fi
> +
> +# Check that the is-enabled probes are false when the USDT probes are not enabled.
> +# That is, nphase1foo == nphase1bar == nphase2foo == nphase2bar == 0.
> +# Also, nphase2 == 10.
> +# Note that nphase1 will be undefined.
> +
> +./main > main.out &
> +pid=$!
> +sleep 1
> +kill -USR1 $pid
> +wait
> +
> +echo "$pid: undefined 0 0 10 0 0" > main.out.expected
> +if ! awk '{ $2 = "undefined"; print }' main.out | diff -q - main.out.expected; then
> +	echo program output looks wrong for the no-DTrace case
> +	echo === got ===
> +	cat main.out
> +	echo === expected ===
> +	cat main.out.expected
> +	exit 1
> +fi
> +
> +# Run dtrace.
> +
> +num=10
> +
> +#     Start one process.
> +./main > main.out0 &
> +pids[0]=$!
> +i=1
> +
> +#     Figure out the pid's trailing digit.
> +lastdigit=$((${pids[0]} % 10))
> +
> +#     Start dtrace.
> +$dtrace $dt_flags -wq -o dtrace.out -n '
> +testprov*:::foo
> +{
> +	raise(SIGUSR1);
> +}
> +testprov*'$lastdigit':::bar
> +{
> +	@[pid, 0] = sum(arg0);
> +	@[pid, 1] = sum(arg1);
> +	@[pid, 2] = sum(arg2);
> +}' &
> +dtpid=$!
> +sleep 2
> +
> +#     Start remaining processes.
> +while [ $i -lt $num ]; do
> +	./main > main.out$i &
> +	pids[$i]=$!
> +	i=$(($i + 1))
> +done
> +
> +# Wait for processes to complete.
> +
> +i=0
> +while [ $i -lt $num ]; do
> +	wait ${pids[$i]}
> +	i=$(($i + 1))
> +done
> +
> +# Kill the dtrace process.
> +
> +kill $dtpid
> +wait
> +
> +# Check the program output (main.out$i files).
> +
> +i=0
> +while [ $i -lt $num ]; do
> +	if [ $((${pids[$i]} % 10)) -eq $lastdigit ]; then
> +		nphase2bar=10
> +	else
> +		nphase2bar=0
> +	fi
> +	echo "${pids[$i]}: undefined 0 0 10 10 $nphase2bar" > main.out$i.expected
> +	awk '
> +	    $3 == "1" { $3 =   0 }   # in phase 1, round 1 down to 0
> +	    $4 == "1" { $4 =   0 }   # in phase 1, round 1 down to 0
> +	    { $2 = "undefined"; print }' main.out$i > main.out$i.post
> +	if ! diff -q main.out$i.post main.out$i.expected; then
> +		echo program output looks wrong for DTrace case $i
> +		echo === was ===
> +		cat main.out$i
> +		echo === got ===
> +		cat main.out$i.post
> +		echo === expected ===
> +		cat main.out$i.expected
> +		exit 1
> +	fi
> +	i=$(($i + 1))
> +done
> +
> +# Check the dtrace output.
> +
> +#     regularize the dtrace output.
> +awk 'NF != 0 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
> +
> +#     determine what to expect
> +
> +i=0
> +while [ $i -lt $num ]; do
> +	if [ $((${pids[$i]} % 10)) -eq $lastdigit ]; then
> +		echo ${pids[$i]} 0 45 >> dtrace.out.expected
> +		echo ${pids[$i]} 1 65 >> dtrace.out.expected
> +		echo ${pids[$i]} 2 90 >> dtrace.out.expected
> +	fi
> +
> +	i=$(($i + 1))
> +done
> +
> +#     diff
> +if ! sort dtrace.out.expected | diff -q - dtrace.out.post; then
> +	echo dtrace output looks wrong for DTrace case $i
> +	echo === was ===
> +	cat dtrace.out
> +	echo === got ===
> +	cat dtrace.out.post
> +	echo === expected ===
> +	sort dtrace.out.expected
> +	echo === diff ===
> +	sort dtrace.out.expected | diff - dtrace.out.post
> +	exit 1
> +fi
> +
> +echo success
> +
> +exit 0
