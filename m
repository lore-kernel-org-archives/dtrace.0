Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52502BE621
	for <dtrace@lists.linux.dev>; Wed,  4 Feb 2026 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218957; cv=fail; b=JFSz3boEfkE9NvnSozPFM4XN8O3S6TvG2t8x7elcXrDvCw50OqJxMmKaNqGb4t/JOOJZmaL0nN60Q14Wuo34c+Y+GqlcPtsniIOfaXG8X2FP5HIIWWxIs/7G1M4UjQZoXHKOq6/w8iBEZrBFzbW6DKkgUS5R6vc65bRpIFhk4ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218957; c=relaxed/simple;
	bh=cfoz2jZgsltuFSZa2V3Mw4YDXw6Aj3EQu5398iTmfv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=si2YET84KmM2WZ1x+wGNLsqTtAnkxsJe8GYRNx1XR9I3hZQ8G36ylqu5c2gQ0qX6V1n07Deftzb24LsiI3BOmUhrEUzII703kzcziQjPJA8COiolgwfqptFcGnLQ5imb4nTm24rR/fT61kvLTX+PfOpGjchFbcOyf5st38Lk0Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f33altTp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fu637dTX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f33altTp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fu637dTX"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614DOrih1716663
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 15:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=7QYy2+9YgIfUFsSYOm
	yzr6O3UNi8eU3swbrCdHDK1F0=; b=f33altTpJPOtsNAADvwBLxAuxRg9/rzo5H
	wyaMGpERsNwPTtUMAfnFr2s/HVTVXllIRIlP5r+KLXD/db3f75BUL78yrL2NhfdT
	29pqeILLoU889xsiZFGojcjjXxxQc+zVdKuehQEl4R2yMORzFWAfZnp/iriY/n8D
	8B7XAqQCd4eZnSp0D4gOD46SQIibDKOUE631kr3+yAmQPKlqt60Ww07FdKW29sPM
	J6poJdkDRyfP0peST4qaz2CeNC3VTW2vVM2KAWz4Cp4sSBmOTMWAgrUCgn3Z7dsM
	QSNzKq2Te2S3FW8I8uQ0kaZkc9dv5KvjedGlTq6CnLU2mUVhEb8w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3jhb23mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 15:29:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 614EoAoY026046
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 15:29:14 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c257a6cyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 15:29:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9O8Up06D6T9xxyXGHvI35fV3h+XH/8XgunEKhLYwHoLaK+zPL3TNukwIrB/hCqEuMbb6g/CoRL3AbHKCWnrUD6582S8KckIqp3fzZXQco7qvpG+G03Xnu9Bv9CvqznaeESV3LA4VYCPr06oM5yukniBjgEMcpEJjHOEG/9iDm4KfB3Vhl+tGf98s0f7LSyUDA66RPvuuD+aCLZX82qIvtGDC7WDzoosjWIcz14oO9597UGbbC06qtoxFjCEzMWnZrQnFv6aMEoobGd48vEqy/X6+qeTiExjPnolI28Eb37QxEP3DHa/Aauw0iVdLUP7B8JkMDek1d/LOWL0Y1ILtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QYy2+9YgIfUFsSYOmyzr6O3UNi8eU3swbrCdHDK1F0=;
 b=aVt9dWGiOTpPYsIrZsCnVqBf2UdpaFLfAp8b89j2oT/RDAhX5BHt0N6v8YdoQxXQrKcIUzQeYudxQMG/hVdiC9NNW6FJy/NbtINStd2/tnOFtW4ItE/w/QlBOmOYSPNBwHQL/jao2Du7Y21OqFJz0r65jhxPnGfJFYj5EX7JTvX884RPkRKsXH/NqLzvfHe7NsaXWwfNRYUmjMYqmjrigZ3SbjZPMGCdfhIBqn3jAD0/s1aCPGH2C9UVJETQDEoWfn3Rq5Ty9+45yJaPeJJ7WA5nRR0pwydRkxMQEOSdq9zpkufjm5OOaiBUbmwFcjHLzp7oHn0Bc/1DQuex9IOUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QYy2+9YgIfUFsSYOmyzr6O3UNi8eU3swbrCdHDK1F0=;
 b=Fu637dTXPWQ5seCz2hSdNIKkOpAyl7WQ/LHg4AsoRARQ+mk+eWaOLx19pMx8s52K6JuJ0BjGWJbdYL6R3LjQnLcELazpUYZEI12SCrkGh47aDgaSCWPXyvYAF0z+4sG88d/AoLfXoup8JRSP4/tbQ9F/r9ubNZiwVkBD8oiPfCw=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH0PR10MB4890.namprd10.prod.outlook.com (2603:10b6:610:c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Wed, 4 Feb
 2026 15:29:10 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:29:10 +0000
Date: Wed, 4 Feb 2026 10:29:06 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] NEWS/dtrace.spec: Add items for release 2.0.5
Message-ID: <aYNlwvIJv-S9bJNe@kvh-deb-bpf.us.oracle.com>
References: <20260204130903.3426-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204130903.3426-1-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR01CA0025.prod.exchangelabs.com (2603:10b6:208:10c::38)
 To DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH0PR10MB4890:EE_
X-MS-Office365-Filtering-Correlation-Id: d352861d-7f06-416d-2a02-08de64022475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LwbNmGUZW5Q/amNNAmaL2l2G6IbwNtZSyarus/9bxV9gIY46rtXa6XocoHKW?=
 =?us-ascii?Q?YvfmNHkJqJqk0BUQfUYUVzb2pBBOB2yPVA+IKRy1Ior4vKMEygVgwYYMZGvl?=
 =?us-ascii?Q?gmd0vixpxKdGQqrCfZ5VDJLjEgJWv0rOA04ZwQUKGd2M/l7ZAh0RAZV4VOh2?=
 =?us-ascii?Q?/OasOJkIqBfnhL9eMPc4HZDaDhi5q6YMh4TizOJVGldwuu6nh9BCO80b6U0k?=
 =?us-ascii?Q?Tyg71itN0YFDYIh1hjmgJeLzBHlheBvVWS5CTF+e/hyL+pmqNQit4DihXmdL?=
 =?us-ascii?Q?TpV7zJgk635p5d5sdk97eeLozdodfHeFu7Tn0mnUmld16WQxCBfpMRMnkMbx?=
 =?us-ascii?Q?yXZbhQoX6Q/7MR7LLX4hAgwLiMDzOf3u3vNqdF99Pw3DbYI8awaAN1tXGULs?=
 =?us-ascii?Q?nqWLgBBOffzxmaHpDxuVtv9sEvM/NYcj6jQE+PvM0YSljFGfHRL/YuTZMjN0?=
 =?us-ascii?Q?yuiNi4EyWP0PIPQbLpmZZ6H81tnoGo52B4obKwNg2gJhSCNt3pISf4yfCyNp?=
 =?us-ascii?Q?t+HX3zqotWk+R84m9xq65iGFk07FsOXST5ccVQxdjMgVe5Hmfbxpz1MqsJpT?=
 =?us-ascii?Q?9sQpfp68MCvgmOl9UxnpfNGJ2nrlzzCe6i7or2h7P3fMkk2fwX879A8zr8Xi?=
 =?us-ascii?Q?2o1L9xGB58rs5Tmn4KESReRlxKj1BcbflNGL6O+z+HPGNheF5sXhtmTOZ3mt?=
 =?us-ascii?Q?PIqefP4FlV+5JaBgGhbUO7HN4PXjZWjS/KMFTmevQ6ZHU5ccBonfYD/jitlz?=
 =?us-ascii?Q?HLdR6pCzqc6eevb1gh5fERoWbi+7WDf9rW0wbRJKcZQH3m3yBSwESlThYD02?=
 =?us-ascii?Q?QhaBwhbE9D/92zK9t4fpUDk9YTcrLJFrRhr+aLaYagkUrY56goGhAEUMUeCT?=
 =?us-ascii?Q?SSpBxRS/OgF11ikS50ay6D7G80+iHwJ5khxi2QxYDcQ0F4P11eUvu4N+/9kX?=
 =?us-ascii?Q?zfl58Xhti0a8ETRtOrEs0MEkcM/kJWuF9ZCocs6JB/Mb4HWUkeAx0eyfp5Wo?=
 =?us-ascii?Q?gIa3vZxAR7N8xrtuxqAsaR0Bfn0PJTXW3yHXC6+g0u0kV8jYbRNgMhOock7Q?=
 =?us-ascii?Q?r6x51XeXjRxcY8Q5fJoHskiXwXyvywhmjR5ioRcc25TzHYyf1HPFtyMoRuXP?=
 =?us-ascii?Q?sZSQbNuQwy40lnDEi91x/lKmVYOJpxXcDBrScZVwdQ5WL/PVt67q2kFzdGrr?=
 =?us-ascii?Q?zcEudEq3vpFEazcY4t/7YWrCKsGnw6Go81DIdvbQPoZRUM3uSvWgqKCw2c3X?=
 =?us-ascii?Q?Ktq0My5c9e4LFJA195lvdW4jc1fLfnHACJbFQDc8AJd1gRAL5NUWQ2LrdD7d?=
 =?us-ascii?Q?tp9eX0vt6Gqoopu0fgIHwcw3dfA3yRf0hzUhDpiccXcQHLQBG5h3EnfanrLS?=
 =?us-ascii?Q?j1yUcgCqhgma9OKxbQtBeEsIc6k5ph3p/flDMOIk1wEIWhKoLdOOuD46ZSR8?=
 =?us-ascii?Q?nTU9BCTTJ/8I7EzRGeyB8XEfWWYJgItqTEyOvBevMqBqNFwGcVTevYgigcv1?=
 =?us-ascii?Q?ib0G9YUTA9l8x1FQ7K5PPB58e7Zq8IwA+FGABlULRWSLCs/uSfHlQWGK4Byk?=
 =?us-ascii?Q?fgtARLWWuWtnDXTxpKM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZVgfIft4lnyawNP8zAmM31yJtKLUL122PyMqqHYr/mbbvoIy54cF4p7eR3wQ?=
 =?us-ascii?Q?7ZWVRrtNho0/YgqYCYpQ7NP3YsCyLPRC6QYEMwO+T/M8D9JLvVo/leSlkukB?=
 =?us-ascii?Q?jmNVtsLJ7v0vhmpN47ssx6VJWr8zUkXK65xgIOWyQgINrivtOGQPsRzD+lFB?=
 =?us-ascii?Q?GCyKsNN8FBrf5nL6wiT3RUm7TdEy2i2PUAtVkAhrMIvc9IM5k7fqda/jq8qt?=
 =?us-ascii?Q?WjE3YfGAJI4tod5mi5xzgFBRKeekGk8OryuNBRjDG3Or1FDDnYgTyOSEUkAK?=
 =?us-ascii?Q?dA0UpR0QSOblYJ/8R7CBB9UAq593kR0iY+1/FQpYe6QSXgu4mcMs9hcJFfNI?=
 =?us-ascii?Q?RERx/kbK8hY4pqAomxrRsA2zBPqdTC6KZ93vQks6Jx7qGEVYSln8yw0vHC1Y?=
 =?us-ascii?Q?v0b78EMQXedYliqA2bmx3ZXCXj3kcnAANmgWJ+VQRko1xat16mAxvbnDgJ9Z?=
 =?us-ascii?Q?SS0QrYLJ0+qVfWnRXJmk9dtbqhTf8JB5lnAIkn/Zpq6OBLhIugQ0gExga2Kc?=
 =?us-ascii?Q?hjjDVKJhlAI6GF8XDMLnKU6AsNh8QWvY6fhg5kc5sjvdl0JFeSIsDD1HlP8K?=
 =?us-ascii?Q?tJ+sM7d4Ntr1OAdpMX0MiRoJ4dqgRF6oU68NjqXYcqm+Lo6ClCn7Cwipcc8H?=
 =?us-ascii?Q?eB17VN/sY3EohujeRI4Bs8KU8M2EjgoDUct53LTJ9SLrJAk3rlEBiFxU1QUa?=
 =?us-ascii?Q?FnYbl7nCPDKTd7dwXH4Rx9NQwP37/SoBVXFzfj1iQrpu0TikC1ADPuxNaqQv?=
 =?us-ascii?Q?Qq2DwtfR1eFeerllCk4vdNJ/+oAEpIXnsWqoPNuOVz2sdg1VN4fNNuDR/MxV?=
 =?us-ascii?Q?ddwY2JFYXIzpwZD78zF/YuhhJ+ab8E3Pj2Y+WFLMbgVCZlLLRE+lnleRE0oV?=
 =?us-ascii?Q?9/9Ka/6JAhp8Zckz3W3Kxu9ri3YR8S/DrOku2Mau8Y2ItrfCFBbQlvoHdo3j?=
 =?us-ascii?Q?OY89z51xPclLv0BopT3DFcfCCqa8wF8WeSeY1DUkB8uy39HaBS8dAl+glZ+m?=
 =?us-ascii?Q?GV8q01CqSrcSR+fW9ueonIu2LUhvnypOtaQpQY5KRoQWobecC7KSnxWl0SMl?=
 =?us-ascii?Q?yQftM5IZXLgHjCxWr+tNgPcseJz7JccIFGG85UWyBIkl/jIM8fgFL5AMuI1R?=
 =?us-ascii?Q?b34dHU5W3Sj/QLVFLX+f7BM5v7mNKOsysFV1f81GMEYUNXv33sbjQh0gMgsW?=
 =?us-ascii?Q?tZvSJg6SOKZhGtvZ1omzRZ3KrZL3SEYRjyR8yRR7ZdRdFBFbekqOPRcG8n76?=
 =?us-ascii?Q?zGjApaEDB3La1F0xCmpkv5XzF/NYhILEDEG3M9mc0e09yaU+mhxSQPqI2iSl?=
 =?us-ascii?Q?ABjvo/kIbCKkxj/nmDrB1xi73cwbfiyH23pk1oP4nIIUPC1SNxS4SkrKVNVd?=
 =?us-ascii?Q?JZIPxAn7o09wOBZmHWahLAzm2lbffoLf1Q/1WzGDPT8o/VfNpiLDoS3gB2Bh?=
 =?us-ascii?Q?bBkHo+LUNB7VQW1lqavX5QhKji7IQ1KHuMxvb6rk8GXPCqNO6iFdBZaYHLwm?=
 =?us-ascii?Q?JywCOBf4LVwaIIBlLDnFwyLYh3X6BkbUo+x23RD/gEkdJsDdiNmw4GkcpTDM?=
 =?us-ascii?Q?GjsYXpjTzX3wcZe2mUpWoRSBYywcNOUVJFfAWgf641u3UqEf43emMUF9G/QP?=
 =?us-ascii?Q?wmdxG+1EWB4T7zx6iujnd9ZqNMWaGw79X9Rw+fWn7gD49ZJkc8Rpd/XmZqUA?=
 =?us-ascii?Q?VRq/lRhBAaDl62mxZt8A/wF2IJjB4NoMtPDJTGhTOb3SpRl7fizOjqvVKE4W?=
 =?us-ascii?Q?iZfCxg5G8MrLQjHQOe7kjiolIbSHa8s=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uWHKiDX6zHh7BZdoA63sXvKnwrYHud750HeLZWhENytDQofBu1T6xn1dXbgSpfl497+YZpxJGrXREwzQB+vNyW6PS0zVIGuy+30pCc3L7gRitkH8pZKJO1qjvQSAWKyX3/8n92U6GnrGCSLf5jnsCrpYiL8uqs0xycQ+TU7CRLkKwJqizJrRvWfOXujuktBKL/fevfk5OJ1yNQ2tTSQ1Oxrdco+sFdWA2AbprwgbbmgXIJQCCt+42+YF/HUp6cNKCh0JhLGUOD3oL8z9qJntjgGFynej49RTyutJpI/r6Pb8A8kis6Y0FSBqsrS0oPRbs3KeXH+19P//pd/oKsJS+LMJ0yvjNET0Wy/JoFSW95BMS2qzDLTsNLT+W8s5rwjtIiwN7Hv6/Tk0bfaheh9Wdi/4hgKBFVXHeQspokvIRKMXecAeOy95gqkHGD2RXpj3rWJMg+T+6ubnfaV4IFVdcgIF+zwszWRh+Ugkp5wXYJuhB8r0E3SgNrLoy9quWwtUEvqjfAIL1Rf9AXRh7nmP/jvJeGEPw09d/wAYL6TP0IEFBy6Z1k1CGE4unflM24LI3DkRdbU73GWyRAghfq4fFcJViFKiNtdUHyBbVLJFTdc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d352861d-7f06-416d-2a02-08de64022475
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:29:09.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmK5LTnQnmrlafhHIqgPB9cnr2X0p5WwxGVP+y2o42KkExcpzs8NgXOtxdPU/bCMESP8573gzzYGehaEEHLZw07nT3Xm/5jjHyQJaH+Wc+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4890
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602040118
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDExNyBTYWx0ZWRfX0AYAlFK4Ekmp
 YFmPHxwp4RnmfgTx8JcKEn+77gf5cW+UriEl4jTjNI1/D+G3HStY1avY0u1hNhUim6qqGSXcLFy
 GeL31Uy0vgKC0+5TjKv6kEuNS3aOtJtWvGA2Am/PF8LLcG6PHCAAfiutPQpCyVBCy9YFWLFoLU6
 yYbdxtWvb6rQx/OTicZ78XyXTSMGFlV2nUcOVnB4cyD3uiarO21m0G/Km1ls7iuxLwry2Dwqq9v
 XKfMLVUjBm/iWaaw+EUokm/JnKVtIcQuByvNfxCF7kuOiPl54VJIuXlJzIutMfqL+fnxqwoNG3l
 790zY2JyMz87gfx8CHoXvV0CcY06E68E1u1gYiNdLo2LgVYCi2FYtbe3mnscn8YGWT+CseETTo1
 6yby2WzizOfatvZY7RyRi/mureBmwKVmGjKMztuo+WuItgq2QcdN+lTlksaCapJSd20m+vC7DBG
 azmqLaldbpPwOlYUbtHpmphByxf0Iw2n86XhYd2Y=
X-Proofpoint-ORIG-GUID: azx9vJgt1IIvVYyu3Y-svpkJV7Eq9NyX
X-Proofpoint-GUID: azx9vJgt1IIvVYyu3Y-svpkJV7Eq9NyX
X-Authority-Analysis: v=2.4 cv=CaYFJbrl c=1 sm=1 tr=0 ts=698365cc b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=Na0fFrWoggrnY4-pTfkA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13644

On Wed, Feb 04, 2026 at 08:09:03AM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  NEWS        | 4 +++-
>  dtrace.spec | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/NEWS b/NEWS
> index 8f9ea6f4..bd20932a 100644
> --- a/NEWS
> +++ b/NEWS
> @@ -1,4 +1,4 @@
> -2.0.5-1 (Jan 27th, 2026)
> +2.0.5-1 (Feb 4th, 2026)
>  ------------------------
>  
>  New features:
> @@ -9,6 +9,8 @@ Bugfixes:
>  
>   - Allocate the buffers BPF map to fit highest CPU id.
>  
> + - Fix argument handling for multi-location user probes.
> +
>   - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
>  
>   - Fix prvname so that both rawfbt and fbt probes are seen.
> diff --git a/dtrace.spec b/dtrace.spec
> index d43b3c20..ee6c37b0 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -230,9 +230,11 @@ systemctl start dtprobed || :
>  %{_libdir}/dtrace/testsuite
>  
>  %changelog
> -* Tue Jan 27 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-1
> +* Wed Feb  4 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-1
>  - Implement PID-specific uprobes.  (Kris Van Hees)
>  - Allocate the buffers BPF map to fit highest CPU id.  (Kris Van Hees)
> +- Fix argument handling for multi-location user probes.
> +  (Kris Van Hees) [Orabug: 38922360]
>  - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
>    [Orabug: 38776929]
>  - Fix prvname so that both rawfbt and fbt probes are seen.
> -- 
> 2.47.3
> 
