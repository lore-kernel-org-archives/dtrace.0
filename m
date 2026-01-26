Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DB034A788
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769446414; cv=fail; b=VfkdSeW73Nd1/zjdWAYF6Yo9hY/oe6q2nDq9N6XvSkxtr2pSxImwyTAwBJ3vb2ogigqoKJ3iq7wLv+4nLlwQ1P7t1MNRY76cUdP428a4pxVisd+OdWlAoCxqwgr1nbU9YQ86+wE0hidNci1syHK5yWagv320qTaAG2ZBCSbfyk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769446414; c=relaxed/simple;
	bh=pAc8R1rJYihupcvA1HO18VA2mhwli32v3TUaJxT3p74=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A8ls4rvrFidnkHWAyzT0Fh5xi8Nx2XsebLCSTEY+oKzfng/pwbd9mJdTJXHvqRPWPy7yFAQ4W+2wKI+ma+ClDbAVDu5ib5UgV3z18tXy95E0EO5OHHzS5MRMjetbP8FsJzew/d9YECHUvv6ZZvEs2X4cJfJ9ti8GP3CtaujH/00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Gy0vgi4W; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=b99mdap2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Gy0vgi4W";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="b99mdap2"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QGj0oP1228967
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 16:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BPBjlv3VoAXxCFb6aX3Ny6V19KWxOU64ZQFGYZeFwoM=; b=
	Gy0vgi4WDjVg+uDpDAKOJ7VrWM6X33sZChpuw3hQnFKt5MiyhBA7WGu/N9S+tgPj
	icQigaOI6qkqSvhDX4oZkeFLTIF2Px3mrPr02bhBZXjIxXrQGl+Crl5MntL6BSBu
	lw7TqIbw04Ouc91Wc0pjEoXjeb4HWBGSTtsfKy9x6j6iZb2Y/U/jFzdccoZCMEG/
	lC35Ou2Okb+XpiivaLMr6e9G+W7gvNbYqdtz18AmypbDdTU3ITum0KHrz4JU3JyF
	1dvpmwUO3vDwWhK9G5TcYs1vNbvwzXFyG5kxENZ74Bv2eqmT5p8czPi+6jKJjaHh
	kUdf4DXKkHCOAJ8keCdvig==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvp4bt8hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 16:53:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60QFKgr2035147
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 16:53:30 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012039.outbound.protection.outlook.com [40.107.200.39])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh8640b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 16:53:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtU9rxgGjR7wPJZ0w++PmHMDRMynX4uUiquu+xHNtXdzQWer6Bjzywad1ArNwgvhH8ZFHPJBY2z48g33RXNFXwWktAG9LUMAIFIW+njF86hMlAYA9nJPUxPPMU1Y+oCpQLru6U61BPa6EM3MOh7btTKrGSj4D3PVfxpCvFrdG6HBKgmhbc76qOxlbg3JPmk7mE4HsY0Gbvx3ZFJ5s5sOslunQBKCufnAYW7knK3yHZfKOliPmNCz2cLMjMv2ke9l6kjhU3/ZVUiAa+6ErbK//nZ9WoZ68YhWQiWXMuyt2nxcI9CizG/A1RL8y5DOtxdhyXzl86gwGfkM+WITTczUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPBjlv3VoAXxCFb6aX3Ny6V19KWxOU64ZQFGYZeFwoM=;
 b=B+vexq7lApuKNTp2RtJoVROWqq5wbRu7mRAzkED2jtOm/TFNeaXaC1NhofSqUjfIyQPCoUa4ZrmiTK9V6AqasaHGBcNPOZXVNp+SRivI/jRAoK66OtC1B1UKAlsfMavPTKIez6y36BsB0glyhnmhepUrh+nEQYlyGMsU0YxiurlQq4gHNJnhZ3LToAjQC6x5pQqxRpr3F7Rnr7mznqigTe/bPYUOWU3jMn616GAoXPQoo2w79pu52wKpzneyrQnJ96k2sgTLlmkupMVj1ivOsh5A1yPKS7eq8bkByS2fOjcPSoFhN3dkfl3g/kyiarWCoFcnRUTloYhJ6RFuBPPDZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPBjlv3VoAXxCFb6aX3Ny6V19KWxOU64ZQFGYZeFwoM=;
 b=b99mdap24Akkn618/0vpeHOzUE7KwSK51bkyEdWw84YFYG07XgrFy3BDSeZyEnvz2MmUN1nZGHhqb6t0AY0ibZs3zl4Z7rJqnukQAEO3cXCOYBfuWbtRBTGviQJ3SDLWOpUCbWdiw0TY0r+3gM37TQUWFZN7FIjN1u4q3IugCQs=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CH0PR10MB7536.namprd10.prod.outlook.com (2603:10b6:610:184::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 16:53:18 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 16:53:21 +0000
Message-ID: <cde7e0e8-95ef-46ad-ac67-c17ec6ab2d2b@oracle.com>
Date: Mon, 26 Jan 2026 09:53:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] Update LLM context files to forbid "if"
 statements
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20260126045341.7172-1-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20260126045341.7172-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:930:89::18) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CH0PR10MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: cb42194c-05cd-4af7-e730-08de5cfb6982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THFxWU1jTXExUk5Eb2NFNDNud1UweTczcFV4eFh0S1pJRW5WTGxGTXB0ZWpu?=
 =?utf-8?B?S01XblF6MFk0K1FaZFlmLzQreE9VL3BCVmE1b1pLTXdpNGpRK3RPV0ZaV3FQ?=
 =?utf-8?B?c25xZ1prazlScUtiNURuOU1JR201aHN1b0VpZkJVVjQyWVRKYjBRek8vOWxr?=
 =?utf-8?B?NkMvK2dhS3c1d2VGa25EOXBTbTdtZ3pISmptVWtTR1U3bTkzMG9MdnBDU1A3?=
 =?utf-8?B?NVlMTlFxYjRKNFgxdnVrY3NGanJ3M2FiYlAvOS9SMm9xbER2ODd3c2g2eEhI?=
 =?utf-8?B?NkVyN2RSNzhiY2NudlZEVGtaTWFJTHVLWmxjUDFOSTM2Rit6SUM2TjN2UnhF?=
 =?utf-8?B?SWMrdFNqVGhwSHhqWG92Y3hodVIwMFJIUXczaFhRWWs2dDdGM0ZjNm1CQjhk?=
 =?utf-8?B?ZU9RQ1NPOS9Na3N6TzNrMktFVUtIVmxwYW5sRGw0MGQ1QzF3NGtFRDJ0ODhH?=
 =?utf-8?B?K1AxVWdmeVhHRlppeTFCS05yWFhzR2hJdGUvNlU3NjNuZDVadWxPTThVZHY2?=
 =?utf-8?B?WjZXTm55ZjM3SHRQZFFiSXlpYXQxbFI1TGg5S0dlamVUTkE3UTFZVFArNlFU?=
 =?utf-8?B?dk9tYnFjc3ZvV0IrWnhTOG9WemF2bnNyVFBia1MvWUJlaUpydEJsV1ZDcncr?=
 =?utf-8?B?OTVLYUxYTTlTY2lEMzR0RjRHUHNLck1xdkhESUcydTNub3FVc3pET0pUMWhj?=
 =?utf-8?B?Y0Z6bEFvOU52OGM1Y1oxOTJBalpJOWNpOXMzQ0wyWkJXK0x1MTBFbjZ0aDVs?=
 =?utf-8?B?WEVlUzRGTmhFV01uRlN4VnQ1eWpFcGN3OG1odzBNd01iaTg2V0pLcGNJZ0NG?=
 =?utf-8?B?dldMZnZJMWZjSWRkT0JJMzJuNzhKTndVY0wyZ2xvT284ajdCOHhsQVNnYXFj?=
 =?utf-8?B?K0dvWVNlYzhDVjBsb3VuMWZsNHd4RWo4akp5NlR1L1VqR2UrSWIzQi9BZmV3?=
 =?utf-8?B?bUFvTVZPM3h0K1RWUThWMmgvWmhycHUwNmRuTU4xS1RSamZ2SWo1TVd3R0Z6?=
 =?utf-8?B?dUIvVzRJeDVZQ3BXa1JDQmZFRENRdU01K0JnSEUzTTU0dW5vbW5zd2RoTmNm?=
 =?utf-8?B?S0VpSktOYVNkYVd2czdPRjJjSXhoMnFQUjhybG1ONGE5ZjlRNW9maVJINHpa?=
 =?utf-8?B?cHdBaWtjRGNUUHZPM0VSaXVNOW4vdmthYmtsOGV2ekdZMlI5bWJ5WlFZWXBk?=
 =?utf-8?B?VnJSdDdwSXBSOFRYTVJiV3Z3anhleWMvWTBBdkJBZVNRVDhGWHh1Z2RmMVV5?=
 =?utf-8?B?S1FYUjdpbDd2Y3dzZzY2NE51YXYvWWprTzdKcU9QaS9tWEgvUGhaVnFwbzlN?=
 =?utf-8?B?SllDRHFQOTdsbE15NFpMeUMweVk5bFNvVHhLMnBCRUtTdldXa3lrZ29INzVt?=
 =?utf-8?B?K1hoQmdJVGpkb3BDQ29rT0x2ck1OYURIYTREQklRK0c1bDRpa2N2WFBPZWo3?=
 =?utf-8?B?N0U4b3RUOGt1YWZaNG92N3k2Z2tHQ3NRUDAzTGMyWkFEak5ENTlMT2FFcmxC?=
 =?utf-8?B?aU1rVlZqZDNOWVhqaWIvVmFEc2JzOUJ5dkw3azBac09SaytabGJjWkIzTTNw?=
 =?utf-8?B?UzB5NVBoRCtjdzVrMjlocW1mOXBRMXdGS2NJQ0V4VENIcXFFZ0daRjcyb0x5?=
 =?utf-8?B?Y2pGMi94V0dsQVByQXBpSU1VSCtNZ0lHNUl1ZTRYdFlEVlA0dHJqeHNIeUFo?=
 =?utf-8?B?c0hXYStWby9ORWR2U2R1Y0tWbkFJczJJbW1NRFRxTHJyNlUwSy8veHhyTXZV?=
 =?utf-8?B?amIxTFJtSDd2TlBsc3RWa3Q4VitMUmtWVTd6MTNRaHRpdEhsdk02NzRWQnZ1?=
 =?utf-8?B?dHI4YWdEdUcxc2pNOWR6VnQ4aVlBM1Y1aDE0QWVQZG9YWThHTDY1SEo0VWVC?=
 =?utf-8?B?dU9mQWEwL25uTXE2NTRBQlBXaFdHaFJGbTVzZW8yUG40Vmo4NktCMFVjUUVv?=
 =?utf-8?B?OE5iZE5wMk9DVlRSMGN1YWIzcDB4ZitScjUzUnp1WEV3dENPVmFXWlh1T2Fy?=
 =?utf-8?B?ajdaOWozdkFUYUhBU2MvVDhPVWxIYS9Db1QvaTNMQkdRbDRFMWl6NVBxdkRS?=
 =?utf-8?B?ekVwYm5rdURTTkVBbDAvYUJrOWt4QmxJOE91bEpEWEgxY3Ezd3ZWZFpFMyt5?=
 =?utf-8?Q?LKhc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXJSMmorKzBQd21WbG8xSCtPMVFOS1pvc3Voa1NWMVZkaUxwbTdBN1podURK?=
 =?utf-8?B?a2ZHbUQzTHF4NEpQcHpmTDdMd3hOM3VhRml3Sm8wdFhqRUVVK0NrL0xhb3Qr?=
 =?utf-8?B?RlFuWmRJeFlWallpeG1sUTk0TjNpTm5HZ25Pc2tCZEhETWJKRXBlRFowKzRp?=
 =?utf-8?B?SFcrSmRQWHhpK2tnWlpMMS9aZzBaeU92QWo1UG5FcmswbHdBNURPTnVxY1k3?=
 =?utf-8?B?UnE1Q1hpOEFjdWpKenh3VnNua2FvVjN4YitCSkhBUTNoeFVDbWFYL2F0RFcr?=
 =?utf-8?B?eE03NnhmMFlUSWYveDN4YmdMUFRlLzNMaVZVT25mNXp6bWEyK2JjQXhsNCtR?=
 =?utf-8?B?Ukp0Y1dDK00yWkFmYkVWMnpHTmF5RWlmdlRMSlRCM21OTSs0a1p0VVJ3VHdJ?=
 =?utf-8?B?Smx2NklIUDBpenpSeFBKVE1yL1BnMGpmbmlwYlJFUG1sUlVQcUo3OXY2YjNS?=
 =?utf-8?B?UjlWZ0ZOMnhOOCttaUVQd2dFT001cTNpYjVKZm1pL0VnV25mSmZhc1ZoRTIx?=
 =?utf-8?B?blh0Z1hrb0hQM2hNWk9kK0dLdUg4L2d3TFY2SGdCMlVkRlhoOE16UWVoZk05?=
 =?utf-8?B?TnJibkhjWEJGUHRWekMxT3FSTEFOdENmZ2tXSEJoWExSWG9OaHA2L2FDaUpo?=
 =?utf-8?B?OUkrZHdiczdMRXdqS3ZGUnVPc20rN1hKOGVzMFlnU25CSlFablg1eFJTcjda?=
 =?utf-8?B?ZTNDQWp3UG5VRWI3dldrNEVPaVl0M1VRN3ZwM0NsYXVIbUF5T0NBZGtxRWs1?=
 =?utf-8?B?WW9yR1dtU0RWM0VPei9WNUQwWXd5b1pVblFJbGtUYUMzM1lpM0FqSFJPQ2lD?=
 =?utf-8?B?MmprK2lHWUFHTFBPamhVWGlWSTVPVjhTbUhzN3cvTTdQSm1FN2w4QUQ2VFpI?=
 =?utf-8?B?NzZ5bVBWUE9PbzcwNmJPL1J1UlpmWGVDWGpuSnlzQmNJQm4wcmJQNnYvOW9C?=
 =?utf-8?B?V1hBQmJibjdZN1phMXJiM3duK1p2bzk0UzR1d2xGM2RPM0ZjVjJpQ3Bkb2JF?=
 =?utf-8?B?SXFRazZhYkFvS1AyN3ZwYk5icWhhT2R2dmRRNUVhQ0E2WUsxYll4VzBEdnU0?=
 =?utf-8?B?UGpGWnoweWpqdjZPZXIzNUZqaVBnUkw3Y2tFay9SOFRHa0xjYlprWFF6aHJG?=
 =?utf-8?B?NVozeW1PdVQ4VnkwLzJQbGc0aUwwQnN5bVkyTGRYSmxiQWk0anNPVHYyMmdz?=
 =?utf-8?B?cXFNWmN2TDI1SzRGak5UYklLY0VEQm5La3FBZkxtZ2ZPWm5MN25oZUNjQWo5?=
 =?utf-8?B?NjlXY0dnQ0Y0djBMOCtoQ2xnNkZJSGV2cUJuYXdReERHRmptRVMzdUU0ZkRD?=
 =?utf-8?B?TTA3bHdvTTRUM1pJTGdsb1FMakJSTXFmNmtVd0xsMWNNVXMyZzdZNE9hM0h1?=
 =?utf-8?B?UHh4WlR6d0pBb3ZCamVlaUVpOElrSU0xc0pOM0JtOXkzdFJSbnpWTGF1Z1Nl?=
 =?utf-8?B?d1pCQ3dGVUs5dVBnUWgrS0taUjVjb1B4VVBNSUxHTFBYKzB3eGNyUXRMOU1j?=
 =?utf-8?B?UWZCRWVieEE3NStxK2xuViswMGV4R1JYTCtiTFA4NEZ2SSt2Yk5zQXJad2dK?=
 =?utf-8?B?ek9KL1NaNEVaTVRCczR1dkZqcWRoeHBURElvbjZyQ2o1OVhTamRNRERFYzBq?=
 =?utf-8?B?TW9SMUlTMkQ5NTJ6alU4dkV0NGpjY1V2aXU0bjRZbnJJL3VrWk1qbjcyaHND?=
 =?utf-8?B?ZVYrOEFvRDRDNmVpSFBLLzdSRnVKdGVZNjVtM21KbXpTTG5YVEIvbGZxdVlo?=
 =?utf-8?B?UjJ4ektyb0NIdlNzM3N2emFmbWNXS0RkbzFZbWZTWGdOZ1Z2VXhsQUpUQmlW?=
 =?utf-8?B?MHQ3K3I4Ukx6WHBKbEtTbkFaNURHL09OQVh0WHpZcW96NW1ENlA0VlFOZ1Y0?=
 =?utf-8?B?dW1jYVNDVEUyTEF3MGprY21MZjI2b3pCQXBnR3FYdW9QOWhTQ1VLc0dESmRw?=
 =?utf-8?B?UEd1NWl2ZktlYzRsMlQrbG9xeHp4T25sZHJUMjhIdGV6WjQwcjg0bnNveTRw?=
 =?utf-8?B?dUtOY2F4MzJhVkZsOEdOUGllaDIwZTdzMnpQdHNjNGJlN0JsUDQrcVlxaW1T?=
 =?utf-8?B?dkNHVVNoRFI4MTRWa1hQTzJWSzdLekRMdDJiaDZXZUdVaHNZOXFVbVcxQ3dh?=
 =?utf-8?B?SVRDenhoSkF0TFlORTFEZXZIbkJGb2c4VVZBbk9Rb2M0ajhxdUkraTZTb2lp?=
 =?utf-8?B?a0xPWUFudzdIL3g4Qk5pRllIVHBrWlJSUW1pS0t4blJNNXdBL0p2NUhnNkJP?=
 =?utf-8?B?VTVDZHZsWWJ6YWlYTzcvQ0dRbGE4OVFwMEpsOUdNK1Vjamg3cHYweWhyU2Z3?=
 =?utf-8?B?dVgxVlNteGxLUlRqUzhPV2dnSEJRTTRVYjg4VENaN3pqUFBLMnNoeTRTL1J6?=
 =?utf-8?Q?VYWVUBcR5gJlsYF4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bwzxovF11MfmWJOC2J8BUqvyzan0yiuE0AIYerSg2MHre1SLlDYkbAM6dn/zrF+TQljlZ8al8PRHoBrx8XdmglmeJhETY/eq9/7xOCB8g7VEV4cYerlVnEvtqavBZOflTz+EQco8+RLVD2EyqeAE8pMxFBnSR2SBCHxM6yLwC/PCek94lNhk1rrChI89UWeKPUGKzm5xvKUk4t2CFx6axI3dvsOzSVSfqXJ6jko/gmTsC0TI+mwjONG8lRZOJfzrsQCuyrDo5r3npXT3zMd6PiWdCLXpZkdYpmOMjk+sm2ewjfJmS2OMATgErfgQqjBFiC25xpRxL//a7t/muJo+dCgt6eK8g5cbWmySom4ra+qL3RR+9rl6pX2eCBSM1grWGuuTJpeUV7VtkMm5CGpH4TyiFdHy+h9QKCeNIXmDfwXKEdzqidgUHaOfWBrvP1mM8oRbglpsJovMeK60w3ML/9ZCS0b/FHinwYjk6zRmN532J9mdaSsfEvjalYV35/+F/R/5aBzWEWXlwn4Ntje5JZvR71JglMHfGSc1m3IvTaALzmw1ccnCBprbgUeioU0yHpiTtzLYgzQ6PLlCoPntY+JxJRnZtprZ41taVJc58xA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb42194c-05cd-4af7-e730-08de5cfb6982
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 16:53:21.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkAAYX8qOdOOTNbfcDVIPewtd6bSYohp+6G2vpF/G7t4O9u9mEnxlw4rCSv6aTXE+KCip4Xg2o1pC3J3S+eld7j3NoIYk89GpPFJTWt1jTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7536
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601260144
X-Proofpoint-ORIG-GUID: UPuUiBeno4ScrJxsLNKu5_jpv8FpC21z
X-Authority-Analysis: v=2.4 cv=StidKfO0 c=1 sm=1 tr=0 ts=69779c0b b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=qvC4iFV6QkpFuHBij_4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: UPuUiBeno4ScrJxsLNKu5_jpv8FpC21z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE0NCBTYWx0ZWRfX4JaNZZq6ggGP
 B016LfEhsokcboX9jeWRSde7wND7pZPx/J3cOeG5atz3o9xVVNjL6mCuykAO/JrUnNPE/HVbN61
 nNzDVMdSi3QKsRMj3u9hHKTVfVepdm0d6nTokVJFN8hsZAtCw9GakHw58EOI8JgIcwHjcvODVmE
 D52XM7rAi0t6JBPiB/YDC9LMyeambMkAcfN2WS7YsEwmXwH1wMwkZZCB5psbOoUmNwBxSnRM2nl
 aG3NlDJDspjV1rBfasIphLA/ab2uTHC+8xosglF2Z2iTI8fz98ZORq5JEzK5qoYNHfGJ4LR3W0E
 Eq+qBuk8vRi4p92C42yOdHHM5IBj8wjgyTHwdmmbq1k7hHOY5ciw6UTPHa+KF6J12Zdx7cfezRE
 zqhBIyCEfXvtDG1W4lOuLySCfwv5JAnqEor99zHaezIgAUu3erKttG7co7VmHe4WzgX84otsEJt
 NmBNJdeEWzHJwVhoA2w==

Reviewed-by: Elena Zannoni <elena.zannoni@oracle,com>

thanks
elena


On 1/25/26 9:53 PM, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Uploading the existing context file to generative AI using either
> openai.gpt-4.1 or openai.gpt-5.2 led to the AI assistant producing D
> scripts with "if" statements, even though such statements have never
> been supported in the D language.  Asking the assistant why, it had
> muddled explanations, like "if" being a reserved keyword in D, etc.
> 
> Modifying the context file to forbid "if" explicitly had limited success
> at first.  In one case, the assistant explained, "The context clearly
> states not to do that.  Despite this instruction, I used it likely due
> to a habitual programming pattern."
> 
> I finally got a statement strong enough to eliminate the use of "if" for
> some simple prompts I tried.  I used both openai.gpt-4.1 and 5.2, trying
> each LLM with old and new context files, 3 times each since generate AI
> is not deterministic.  The old file always result in "if";  the new file
> never did.
> 
> There is currently no automated testing for these context files, which
> clearly depend on the gen AI assistant anyhow.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  llm/llms-dtrace-complete.txt | 12 +++++++++++-
>  llm/llms-dtrace-short.txt    | 12 +++++++++++-
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
> index 8a4a535c8..818e0086f 100644
> --- a/llm/llms-dtrace-complete.txt
> +++ b/llm/llms-dtrace-complete.txt
> @@ -4,6 +4,9 @@ You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid
>  
>  DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
>  
> +WARNING:  Forbidden constructs: if, else, for, while, switch, etc.
> +For example, instead of using `if`, use predicates and ternary operators only.
> +
>  Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
>  
>  After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
> @@ -103,7 +106,14 @@ PART 2: TYPES, OPERATORS, EXPRESSIONS
>  ## IDENTIFIERS & KEYWORDS
>  - Identifiers: letters, digits, underscore; must start with letter/_
>  - Reserved keywords (subset relevant to D):  
> -  auto, break, case, const, continue, counter, default, do, else, enum, extern, float, for, goto, if, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, switch, this, translator, typedef, union, unsigned, void, volatile, while, xlate
> +  break, const, enum, extern, float, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, this, translator, typedef, union, unsigned, void, volatile, xlate
> +- There are imporant differences between C and D.  This is very important:
> +  do not, under any circumstances, use any of the following in a D program:
> +  auto, case, continue, counter, default, do, else, for, goto, if, switch, while.
> +  Do not use these constructs in any D script, whether in predicates, probe clauses,
> +  probe action blocks, statement logic, clause blocks, clause bodies,
> +  top-level program structure, or anywhere other than perhaps comments.
> +  For conditional execution, use predicates or ternary `?:` operators.
>  - Avoid names starting with `_` (reserved for system)
>  
>  ## DATA TYPES
> diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
> index 01f9f408b..19d5f73e5 100644
> --- a/llm/llms-dtrace-short.txt
> +++ b/llm/llms-dtrace-short.txt
> @@ -4,6 +4,9 @@ You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid
>  
>  DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
>  
> +WARNING:  Forbidden constructs: if, else, for, while, switch, etc.
> +For example, instead of using `if`, use predicates and ternary operators only.
> +
>  Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
>  
>  After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
> @@ -103,7 +106,14 @@ PART 2: TYPES, OPERATORS, EXPRESSIONS
>  ## IDENTIFIERS & KEYWORDS
>  - Identifiers: letters, digits, underscore; must start with letter/_
>  - Reserved keywords (subset relevant to D):
> -  auto, break, case, const, continue, counter, default, do, else, enum, extern, float, for, goto, if, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, switch, this, translator, typedef, union, unsigned, void, volatile, while, xlate
> +  break, const, enum, extern, float, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, this, translator, typedef, union, unsigned, void, volatile, xlate
> +- There are imporant differences between C and D.  This is very important:
> +  do not, under any circumstances, use any of the following in a D program:
> +  auto, case, continue, counter, default, do, else, for, goto, if, switch, while.
> +  Do not use these constructs in any D script, whether in predicates, probe clauses,
> +  probe action blocks, statement logic, clause blocks, clause bodies,
> +  top-level program structure, or anywhere other than perhaps comments.
> +  For conditional execution, use predicates or ternary `?:` operators.
>  - Avoid names starting with `_` (reserved for system)
>  
>  ## DATA TYPES

