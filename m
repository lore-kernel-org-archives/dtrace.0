Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB554A2D
	for <dtrace@lists.linux.dev>; Thu,  9 Jan 2025 19:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736450251; cv=fail; b=s1Nbpe1KilHV2owODh2wTv8DBokXbThVQlLcukTpZ/+VjR7aAUML3lPGY4QyKf89a4RF8SFJkD+Hx7qRcvwkrqC7MQrTxi1aDX67KWlv11yb9KuIvyJCKzLkxlA3Wp4feMupGCWJ8bniz7zb2WbG9JQyeI5omD+4Vk4GMT1W4yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736450251; c=relaxed/simple;
	bh=DZHgiAS0Llj5pzvTRJZzSFI8sYK7D7mCsZZyiNNyyXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UYdR76uk28yMKodK/CcY3TxqeQPO83hCBT9A3aWB5HxkeL6/luYIiWfTXwY3I7UaBDJAy5A8ksCVLnmeW6ngRFsZCFhc4J6PzjGlz4z84D+OfY05CFrDHMky4wbC0ibK/p9gfxIHwqX6HwEZEcabjwoyoHnwfIp+7y2CVQOSyy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hGyustKo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VEe9xhfi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hGyustKo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VEe9xhfi"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509GXnVG003828
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 19:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=TLU42iMdfQYzUwPX+0
	RnNxQpYp8GOT7xM9ZrQW07YJw=; b=hGyustKoR6Czwae0FBFvjUouRc8RsdcZai
	GzNw3OiejjdOkSLWX4GLNAdAa/ywWNB2KFG0ntqEtEZ9u8le8NKh0u1RDXY9Xeot
	d7JemG2WtJ31XA/hn4Yfwu0jogYYLvflsvuLchGHAqg2vAVr05CWKIBk6RnmHrfV
	rPSweXNCCdR2ThKf78d+poG7qJBzAm9kEkVAlr2OtD/KlxUepAg69bqB8+YTGKNb
	emR8c+WtyAZYtalxyG4prQHH82GPdQqLFNrDcJaim6uNv2242u9Di5YqOizInVCM
	HPFt44Wn3Jdy0HaIfTWxud1lnsB/4vYu1AF9sqvfT55g1VXn37mQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442gy5rfyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 19:17:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 509Ip5uY027558
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 19:17:26 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xuebrhq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 19:17:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FA99uRgS+VPXXFpqg6MKoNA+2a9YbuN6ue9xJMqnbRObk8ruVsV+RQ8lwV9pmV9OGsaZEKQ8fI2a96GDM0i3oDmvL5qFaGYucX+e6Mi/K8ym5BDQv2UM60E8+dxvFJo4l8N3aRhEGNXfEQTt+aSFFYugjVb7JGz7BKL0eZ+2py3SFu4gQXfD7LSgtztaPUa/90219EA8Wqjoo8/4dlRftETkeJ1VsSiLK6CcbX4FTR6YAJT0gp593SmYzQFpJaCU4TnxLfigss2T/eUawCyJk55SFYC4Z/wvPwyiwlNi0lRseymk8yutyNeaXnLdJlL86BzV76EU+DLIqkdd7pBe/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLU42iMdfQYzUwPX+0RnNxQpYp8GOT7xM9ZrQW07YJw=;
 b=UoAoB8BW5+xLs8lZllpkh2FX4J2UAN/r7C+rbN2CL0RjHTSL6DuTWPvX7jzmKXHDL+TMYAFcZaga6rwiSb7T+WBGKpGMCSKsAMAivFYTqxSND7nSWmCkRQ2mgmlh9nsXtA+Lfyq0BN/pU/bFLe6oGKUmwmeGLV2gcS84DrZDRxaQ1Cdwd4plsYZ7weVTg5caY/DXf4fd93K0wpiQN1iluIqbCJrBaPpoNX/DfnrJ7ddgy5VNCgPoYiK8wtxWbl1jq6qv/TgtB6BKHup1r210HUX+B+qXUGseM7momHmmojapAthPjgBGV4Joct9bK2BXr3XkU28TtYQe6ZFVTY8HKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLU42iMdfQYzUwPX+0RnNxQpYp8GOT7xM9ZrQW07YJw=;
 b=VEe9xhfiu2VY9KKiUGMVJvxxscWMlnBwQCrDXPfqRz1JDZgx7qyGEsGZfrkMKY7vrlOuT5SfD14G2Xjz7MgqENFVgWpN23KQNBTmMZcZm9u8K3URvPPmObEReURDk7J9I3aFhJAEa04Ym0K2yaQzDXBIsfG4NpguiqWsSH51g20=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by IA0PR10MB7349.namprd10.prod.outlook.com (2603:10b6:208:40d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 19:17:22 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 19:17:22 +0000
Date: Thu, 9 Jan 2025 14:17:19 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 4/6] Remove unused function arg
Message-ID: <Z4Agv1EzqCTv3KJF@oracle.com>
References: <20241220222716.18511-1-eugene.loh@oracle.com>
 <20241220222716.18511-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220222716.18511-4-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|IA0PR10MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a738be7-d78f-489d-9f17-08dd30e23e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1vdLctxakeZCbf0Ya8QozlwwNuPljvDWKAXF5zzFqojLzYseDbvjF0s1R5FQ?=
 =?us-ascii?Q?G+zHvZqI+fpjTuz9kBxIHUVs16EWeX9JnvQF0QL1QzFAasgNywcVvKXIBtgM?=
 =?us-ascii?Q?+8UMUVlw6AfbiQvV0rMvOofUEFSovBSWOI5HW9WmY99ZuRsiSQ66k9WIswSv?=
 =?us-ascii?Q?IDg4rH767RtHZhD8X9qswu8o04rD8g3w+YtqMeOrBvSKj2vyyp3YgLsUBuPf?=
 =?us-ascii?Q?A4NIoSbkrbORj95QHfN5esbGD4SPCFUCniyZGZ4fhOduY+8m8uJUr5zmBVWY?=
 =?us-ascii?Q?Yql2q+5APakAtkT9RWTst8JDn0dK0vQyMdh1vFab2+12xK6y36I+fy7WugKz?=
 =?us-ascii?Q?hXgeSMWm/t4VJmMbs9zchlXugLVyUsSasGWH2T0bCldHTxXliHjc3DeelEQk?=
 =?us-ascii?Q?rra6CkxF4Vdos2dIjtM35MQDRar17qq6zg2pMBRtqTYeTF5ytEss6GxNTfg6?=
 =?us-ascii?Q?bdpyJlO1GFvIrG6SB9If52iZDf68C+xYqcpnoewCcihoq/PHuh3dTPoCCciA?=
 =?us-ascii?Q?eIWxX7C2iUgJHo7pY9WkI+IGMONVSCYsp9FTXqiYFlLg6b8XynqTzFbH/K2r?=
 =?us-ascii?Q?UaYvzMmsAJ+B1WvQL/JW3rUTRuaYxMHzNpHnSqMnhELP0jLZYQ1dTM8j4Wtd?=
 =?us-ascii?Q?tKBor7HOyFbzYbusUHspzRPrfy/tHW6oretJ6o9Br0tsfs5srB4RzIxQIJlm?=
 =?us-ascii?Q?2ipeZ71vWq8sugY9Bw7iAIuBzPKP7nd3nsgylSOhhh4afNqPKlOqA8er42cT?=
 =?us-ascii?Q?QGGH2n4mL/oE9snUarXoxJD66K/amGECRV4+TBbeCqfZy7awXUdumHJxKcAV?=
 =?us-ascii?Q?keWBGpYbzBfjBfMhiieys6uFErwIltEjPAhPMT43RFwQud/iWVkfFYFMcXlK?=
 =?us-ascii?Q?kFgr+Ak6tVazAHgUjZVEn255CROP4lFh3fIl73EwBBWGFMW8lv0qM+TXV3VT?=
 =?us-ascii?Q?M79mtgNrLLP3+npzidPq/3Iugrfe7/+bEr2AlWyilmSFZmCljIMdrle36K6S?=
 =?us-ascii?Q?6u22EWNvfkVu+Rx3Fural3rgMQfyWzvD2D221Xad7qceO2gSWEPBbEftLCxN?=
 =?us-ascii?Q?KfWRMWcy6e25Sii7SawkY2a9i8n4gydQXTcnw2LeBthvIwhWCPjUYtBO66Pf?=
 =?us-ascii?Q?pa4FgXMY2XdkSJZHJX6DL1yWi1vNpfpVS12b/WQmKILIZMQmBiNL8UXM6/y2?=
 =?us-ascii?Q?1s+8S1CoaH9hnWpMlJ2rGMBMrOOf9A0BvXsp7myKbQ3KqZsboe5qiRMMRhg3?=
 =?us-ascii?Q?UPZ8fYF+O4r2wrQU/SVMg81052qSyM4jR7MbzlyHvE3n675NFeGbMy+SKxaQ?=
 =?us-ascii?Q?xIy+GmVVdRCQ7Dyy7UT0jxIFNtKU2G96DEoTF22/VsE0o5FyNvZdxpEYC0JU?=
 =?us-ascii?Q?mNhYaEYX+9TDOd7LGjkQRG3UpTQL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dDD2I8OXmtDgg/EGp+F5nGNfG4pI38IuKUzlA5T43k8f044O4Fsmi729EmrC?=
 =?us-ascii?Q?Y61Z/L+sO57J84oTPP+LfJ6xgbLgz83I3wjDvVIwqsDoSYmonTGN3uOLN0fE?=
 =?us-ascii?Q?7d5z7yRfo+IzYrnTF6T3JRe5atFhpLiUBRGMs9TWMEL9AZ4kpa+kvb06tVS/?=
 =?us-ascii?Q?npBoI9UYmXzwHSsCUBbGE3+tFD+CXke+VIgS0cOwPSp00Fuk+MHuCdkyUx/e?=
 =?us-ascii?Q?eq0ejnkwVvkcJEXw3BrHyW+foCJpnPe0CnAy7Lcs/tfD6B4u52feS+ki85/g?=
 =?us-ascii?Q?gmPwNQp/V3ZFyp+vnOihaJwT6Qy2Tqarn1CSzKtdFS6qxkMXeqO239DlpnOf?=
 =?us-ascii?Q?3/zNJXpAOsAAyXNXGLyp1pRukYVsZqzFidDj2qa92AO95sDBc1D8moYwnNwe?=
 =?us-ascii?Q?2R2shgtQZzVyudq2/v+ei0Mqz017Acvk1GY8wJ3pUDmR/3UVj0a/YqPLqWB0?=
 =?us-ascii?Q?gRhWOKLTj38fPTsFTuCLEH5T2P4YGAHP9aLHKL7nrXHEBSwlD9xEEWAeU0WP?=
 =?us-ascii?Q?ramlVWU5rYdYJEu2S06mG9mGqmbqJn6Btgsg5Y5Uv3TaXnEUbzRfEGXts4yH?=
 =?us-ascii?Q?BlWHJl+Lt4zFpUPy/OlRnUkiCALCF/Bj6WacTQexwS+TlcNSN156qTbQcOwe?=
 =?us-ascii?Q?BudtY9WU8t6kY0xmZnf4upsG8V99D+dMCMAsUog1Gj8x8AmrewVXQXReXjqA?=
 =?us-ascii?Q?7hIPFNtfmFieL+LpbqV7b1A5SaL2nTpw+K9CHhwCBOEh3Iq0/gJCJcM8zA6b?=
 =?us-ascii?Q?m6EFLOgw73lMBe+VwmWpbiFpe5FBV/4K17VBsvRftK6eYzr/sFtrPAVRSuvA?=
 =?us-ascii?Q?WCVT3oflTtbf0amKSEQI+D82oaH+RqmlA8GoEQzaqs6bHUhEX6gGjIJUs8sl?=
 =?us-ascii?Q?Ml+ymYqHMVj8bMQKEPMarVNO3QsP+L+uko4Rxi1sXbDAPlvDxmlltmFV7FVT?=
 =?us-ascii?Q?cEEvPjYOAOz7ONbWgnlt/yRrgiXpTTntnJB76M/5dpaOzpruDtGTkXJX8xzF?=
 =?us-ascii?Q?5nrnPMqY0E1N096fW0xe6BXcPUSjTRCsBVvPNw2w4tDRB5/2E1JnjBLvVk9a?=
 =?us-ascii?Q?sqbYjm0wCXDVMSPyhiBGW+9WsRR1ThHd/sFB7UElr1gmWAKDma7y2Me6pu2j?=
 =?us-ascii?Q?MCMIX+mg7iV/I5cpjLDxMKTXRnTjWA+aLF8x4DA9afJM3diYbFiVQ7bAs7mU?=
 =?us-ascii?Q?cKFEVwzTe1NW23uR4xPjD6UtpcFTlUwFKgIFnl/3j7/MXmk3EoP/p3RlvSgp?=
 =?us-ascii?Q?wtkDSjFWdfmWhHn0Ji1G9nIPnUSYxVAbOZ2M7WuwPcvslK+9kq6eED6t1FAq?=
 =?us-ascii?Q?HOxWTkPsQQA8pbwygf1LoscmRF5Pzyepq3yv7SH4HyOsfH8CZ4gvRcJOURQC?=
 =?us-ascii?Q?WGHnzvWnFZRKny2qw/3/IpeEJcnG0dtPTVQmSey3CYvHtqo0PeyORnwk87w4?=
 =?us-ascii?Q?uUorD78cYItQHWkHapTn461LLUcZFfGKzbIslUITC4ZPBIy7WEa4qRgZDqwW?=
 =?us-ascii?Q?BJSwPvkYn0AJYr4t3vDvVNvmLnRkoxwCefJm26aWtNyhytj8GEh4OG2SMRC9?=
 =?us-ascii?Q?8eze+GUGIshT9jc9OEyJ8yut7rVzRoB+3jz0yq0b4S2OF5cqIlO+/24AF9Uw?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gmNRinKaqyOYOyYZEYnCt867I30qGA1is462780AYzlEpV92pV1vjSndGXioevZtrZvNnOt5nyIr1B0eJTTEqzSJrMZSt65M6tBHwNWn79WZRojoWYqhg/TP//hLN1FxjSRJgNn7LNESPvSGC8uU8yV4q5rtODqdSw+/Tuo61yV53TeqzLX/uwKB9oqsvBQYvoISymuUGw8Xp229cacHbF9y7LYfE2kpu0WPTIcwBXkjyI8sanz1NDmj9S6vAXBYUANl3nCyyMaVfUX/Pr5PTipcFbWQZv4Z4rVHM6R4iiFOKSNXz1yD2a8zLEpQ18qh6HxJNM0iXpKkWjpA3LaBIdUrXyIdvrUyhr/qE2JTxfH8Epovf6t5XuDo6BaVFFj67sjxomAYTnVa/4TNOjTuofBV6tnBoUs3BxpxjUrIbspjH3neKc5AIRp0uSJmVWA2mPPSjYViiFQ0uHkrE0m4T/D7YXBQjehJIMytJnm1CUctiWOlGgaXM8wPHG/AAGC/Jnp7UnR9zvSmzR712IXCdfbVJS77grjD2wGC+teMcLduy7Q+HfxSdc/NbbtDNiN5eXxzEI/kdFoOYLReKiiaXgbA1Dm2KA1PzAvMbdsfw38=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a738be7-d78f-489d-9f17-08dd30e23e29
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 19:17:22.1969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVgwILeZWww2ht9yHrIdlPSsXD1IcRMOFNLKeZM0xTg58QxEopCjvVKUh4o5T4rWTUvNpBisvT01sK213Z2lfNZOKpVhN1+IBaIuq9b/n8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7349
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_09,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090152
X-Proofpoint-GUID: utC_YIWxbI4DxCm_qTvR7776GJ_8iL5B
X-Proofpoint-ORIG-GUID: utC_YIWxbI4DxCm_qTvR7776GJ_8iL5B

On Fri, Dec 20, 2024 at 05:27:14PM -0500, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... merging is pending because it depends on earier patches yet to be reviewed.

> ---
>  libdtrace/dt_pid.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index e57478450..b8bbb0396 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -104,7 +104,7 @@ dt_pid_error(dtrace_hdl_t *dtp, dt_pcb_t *pcb, dt_proc_t *dpr,
>  
>  static int
>  dt_pid_create_one_probe(struct ps_prochandle *P, dtrace_hdl_t *dtp,
> -    pid_probespec_t *psp, const GElf_Sym *symp, pid_probetype_t type)
> +    pid_probespec_t *psp, pid_probetype_t type)
>  {
>  	const dt_provider_t	*pvp = dtp->dt_prov_pid;
>  
> @@ -184,8 +184,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  	psp->pps_off = symp->st_value - pp->dpp_vaddr;
>  
>  	if (!isdash && gmatch("return", pp->dpp_name)) {
> -		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, symp,
> -		    DTPPT_RETURN) < 0) {
> +		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_RETURN) < 0) {
>  			rc = dt_pid_error(
>  				dtp, pcb, dpr, D_PROC_CREATEFAIL,
>  				"failed to create return probe for '%s': %s",
> @@ -197,8 +196,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  	}
>  
>  	if (!isdash && gmatch("entry", pp->dpp_name)) {
> -		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, symp,
> -		    DTPPT_ENTRY) < 0) {
> +		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ENTRY) < 0) {
>  			rc = dt_pid_error(
>  				dtp, pcb, dpr, D_PROC_CREATEFAIL,
>  				"failed to create entry probe for '%s': %s",
> @@ -232,7 +230,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  		psp->pps_nameoff = off;
>  		psp->pps_off = symp->st_value - pp->dpp_vaddr + off;
>  		if (dt_pid_create_one_probe(pp->dpp_pr, dtp,
> -					psp, symp, DTPPT_OFFSETS) < 0) {
> +					psp, DTPPT_OFFSETS) < 0) {
>  			rc = dt_pid_error(
>  				dtp, pcb, dpr, D_PROC_CREATEFAIL,
>  				"failed to create probes at '%s+0x%llx': %s",
> @@ -363,7 +361,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  			psp->pps_nameoff = off;
>  			psp->pps_off = symp->st_value - pp->dpp_vaddr + off;
>  			if (dt_pid_create_one_probe(pp->dpp_pr, dtp,
> -						psp, symp, DTPPT_OFFSETS) >= 0)
> +						psp, DTPPT_OFFSETS) >= 0)
>  				nmatches++;
>  		}
>  
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
