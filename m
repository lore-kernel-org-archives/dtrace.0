Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CACB641
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726669121; cv=fail; b=bG8xWSvb92W/Y+iazTfHH0i1qWCq2R/4ZsF/nQCOXXehCQ2gVixhdmOLdCHJmQQuA5n7NdDGW/DDoJLK7w+sr5SFXgl108QDgKq1FUGeWTTEmROK0JgaaSNE4gP9GcB8J0/qGFIxGHpCBL9nz01Ij/71K/24+8xeTexljgbK+Sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726669121; c=relaxed/simple;
	bh=TzsMqeOxKIJVJtJsyE6oZZJmAssY7cpYnlwqbByU8Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z6A/YfFdKkut4AN2H1y4J4bSEti9LRTJ+dZra/OzWFQUxrJOXIDmolOq4XhydP+u9VI0z3EuvTVKGdm9xjt2gtFb2s/h1GZk5vRlQRLqr3rhPo9vIlLaDhJHPA0tph6F9ixUUYMoQ0UcbM8lMHv/Y5fDk2/CjYr9ItR9eu0HwOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S5ZkgnV2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SRpnMjA/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S5ZkgnV2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SRpnMjA/"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IDtaMM011911
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 14:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=VR1YCe2IlnINpX0
	CW901OU0ldv4ZVTkR2q1WQQnREGc=; b=S5ZkgnV2yL0QkudgVeQKN3xft/N4oVU
	1sFgN+8be108fsn655sAAu/Hrm4z6Aq4TSVRY6LjF1ApkZkeHdsO+AxYxvTzDg6P
	r7CtwwEA+5t+Cd/Ia7yKBr+N1ytgxOADgTJcsM3jBjYsPS7ZlvxQ9aVMl7FviY6/
	UIgoB7ZXI+MLAA70Z0q13R3VtNe2md1ChjdYpEOBqvO5W0qu8Dq3c0w3DgY5puul
	s/ef/O7aCgOzyH8r91iwcQnsldU2cHNGjm2KBM0zJmKrkbEuTPu14zrY96RGVgul
	+g2jXOddWAfSrTljuHNfELoeyCdzYgBlg0eRwnMWXD7u7QudQfRkkTA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3n3heft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 14:18:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48IE8wNS008137
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 14:18:32 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nyfddwh9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 14:18:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRt/45JswtXEBJ8LqVCnbD7k+6Yr4Cav/Jmuj8ldtFag2O3bXAZBYMgqoum9ppGzRVAJidC78JBd+DF+UY8BvjgLygD+v+H3DwIWkHcLJ7ESO/5gnI+RS/9vbcT9KgTIErzlDCbwGuoo6uk2PZQ+oSJad9NWJOyt5BhKCEQg8ET+nixjNmmEAJ4jUT7348h+NaZi7l2r0uK0yCSK5gRtc0yO6VaPqcyhulYDVD0oiZZ7qaI6IeDmnZQljwKKFKjh96gar7TBb9wfMgYMrKuh2nhvxa0/aE66/cZ369pLd3hrS3kH/xvPemBr8Dbb1EvXplw7zXHYlvmwWp781BBtWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VR1YCe2IlnINpX0CW901OU0ldv4ZVTkR2q1WQQnREGc=;
 b=gwqixvIfKq/A8uaUzwP2dQbBoF7hNT6Hkbi9LwBuVS5Ae16TLH/ukzrC7WbFfq6Vkc7DmFaJmn4eiLp80zn4YfvWqOGRVlXpN16XLEIf4uGnKtOZ7Lpm3SIdnJGwAtUfZid0Io9zEfd0122MfnvJhVQ3VqRRgCyBSqFAAAKDN5BQPRZk4/Qk9afCVEQSS7y+PrZSmTVcS7Zh+bEser2ifGR2W+kfzpgjX6dSu5yS9tAEg+bkh373Mlg80VuXFaM8jzaSSAgEYi9MCm9zLH/HYGLrFzh0dbe+Wj7gC89iv/WBEu3p+xEUHejf51MHpVuWRHR88YaPeVJcgQOE3YLJng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VR1YCe2IlnINpX0CW901OU0ldv4ZVTkR2q1WQQnREGc=;
 b=SRpnMjA/4uhjH67J4GVci5t5FRR1gGYzsnTfy/5UwpgPYRBs7rE/xo3Zopg5Qlxg8Qjyn8IV46n6ldQLvwDOXOot6yeXcVozTiR159KejYiZY9sJKQBDcI4xZgbWXbpkE32+0uMMqnM0m2drEaoajXHhxhHUVrvAYZ2YTpCIm5M=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA1PR10MB7141.namprd10.prod.outlook.com (2603:10b6:208:3fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Wed, 18 Sep
 2024 14:18:30 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 14:18:30 +0000
Date: Wed, 18 Sep 2024 10:18:27 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 01/19] Change probes from having lists of clauses to
 lists of stmts
Message-ID: <ZurhM8wk6e4rVxZ2@kvh-deb-bpf.us.oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA1PR10MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 36615aba-bafc-41e8-bffe-08dcd7ecc4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?el0EfRGIETKHn+jbWs4WWHUJGtDzyWaNxoIsQ55xXVAz7Fz8+gxfUop34Xe3?=
 =?us-ascii?Q?tSQijjKxErDR8XW6ahOCEhEm3wSAXLGgsGA1+dvGEdCgkYPG4DPjEF072DXs?=
 =?us-ascii?Q?Cj3XKjuKkAQ38/DtHg3Zmxi4REOa3CJDTjeYv7OwOKydwi2m6PGyL5n+dF/n?=
 =?us-ascii?Q?tZnQD7kZAa/7KHAca87fogeHnZb74SOKCsB70EbI94XU1EwFm6bXrS+8Dyve?=
 =?us-ascii?Q?3fG//htli1ns9xNx/3IBIA0zxemQqKHJlTrwkmzo2ihdaqautfZMNXpvfoZ7?=
 =?us-ascii?Q?GgYHHcXlkM6N4yQG4yDaoKUicSS0XJQnQ0CPSNnVPynDER3qgnVkNuXrL3gR?=
 =?us-ascii?Q?YWQlEMydsTnFmGPVQpnM3mKBMBgQABf7Pq6CMdT4IayAs2FwMAIzN7QyfFVt?=
 =?us-ascii?Q?8DCm1JfuOMDp4M28NowojyBpShDtJL6L2eYBbTHCCzx/YipORvIouSTt8e9C?=
 =?us-ascii?Q?UrFtgVenS9dspHgQ6Xq5jc9bKqITXha3okywYt8erlB55+tjUqPHVaZ2NiBU?=
 =?us-ascii?Q?MNxrE5XckE/Jkf6rPzhz+xUKXPN87bsFOR22ugKkBIqYWA3ukECrtQ3WjlMj?=
 =?us-ascii?Q?L9elmF5dNL69Ekt5SyU+gX7UCV4uaviIwENzUF40wGVDtoyp/xgIjs65/sOA?=
 =?us-ascii?Q?Gat2s2nJREtvcdml2+/CbkrRy9Fy4+krXLm9v9TC06VJGvvj1hiRyWp89kSy?=
 =?us-ascii?Q?mLEalR2XQ95CY+okp/YufMH6QvIfAYg81HPlvFYldrWq0Th/qE0/ltG7jRHN?=
 =?us-ascii?Q?E7byaUPcsoxpPXlyNJ3ftbAN+ynlVKqbYyPibl/FGe5UaTfwfzOOEenn2dyC?=
 =?us-ascii?Q?HhwyHgCMWHviJhA3OJlJtoqjP8JJP8+fJKFYOJCDVnUIR44fS1Qo9yxAj4FK?=
 =?us-ascii?Q?J2bLBcmBRDNS4GTEZ9OIO/NYu0AFeg0I870l4aPkDISctv7UHIGDriM38hJF?=
 =?us-ascii?Q?obOJhMlMLD0Y9JGGaJayxOn0jrwPRXbG8nYC4xrp0w8A7x3KZo04TnXKWS/s?=
 =?us-ascii?Q?d4udRgp/UOjfR4/tbfuWM/Fe0znHzSzHPnjO7FAAlYjlHu7hjcNMhm41V0Dq?=
 =?us-ascii?Q?8VLn9PdQracRsyY4jVoragpO5MtLvCm2/OAOqSshYJ2+ylDAWujKaDRNym5j?=
 =?us-ascii?Q?MMMUPdyEMByGPqqsNVrNYG7Kaq7042ByeKhJ8MwZQ/hQWE7FwKKspZpWrDBv?=
 =?us-ascii?Q?YRAAE6M1h9qBv3vT9lUVufxSduiDRD4WnOyOwdHNQPQTwaDdsjzG6fIxkMf5?=
 =?us-ascii?Q?jUOYfpDzm9oQZeJdqeKwICpm460lc95+ITbx4DA2C1VO/v4SbrP4cGuwy1XV?=
 =?us-ascii?Q?O8RXrAjmwj/YOy/4GbXBmZ55YepU4paDlzmcRkHECefmsQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LjBng+JGVU4JbfGeazruyc/vT7kVFFNxQsOSQ1/2HtEIsubwajbAVwn4u7zv?=
 =?us-ascii?Q?3VbMyQ6JIO9Y/EfLhIC7Y9AcGHb9d0guTJ6Db1oE+IeusyY4mSDbJehhyYXd?=
 =?us-ascii?Q?vJr0+bDMzSBKKAFhS/Qj/KiFkXcsJlBaFpNrOP4cqwsVKS/epEpwjlDCkYzA?=
 =?us-ascii?Q?5drrqWfrxcXpxAx2S1CakwcmYJr3rJ3BZwTzi/LbW6KyYbFt4/1HvHl2PBXV?=
 =?us-ascii?Q?ZUfgYeCvVYRNWqgQvEfXxH8/nXyYXWsyMZy8baz1OsCzMaf8Fh5YSqw2Axyy?=
 =?us-ascii?Q?Iwj4vSYmBic6HttvRrz93ZJTJDUbocXYLX3tax9xN3GMMnyDinpu9dk0LvwW?=
 =?us-ascii?Q?Bd8MlJMzSyZS0JwolFuanLE9nMi+6Y9Dd9+vgiJ8Ov8Wgnrbw6KOy73rRN80?=
 =?us-ascii?Q?f7ARqIpSzpELV1Kro5X7uHGAP1Ac5cz/04cuV7XRUxngnVSQ7YSzfBhttb5A?=
 =?us-ascii?Q?qAEgeh0/4UDTvE8cxbOnmPSiCEcOXSkxkYKtgz9wXmHL0+ieuojEjvZkrOZK?=
 =?us-ascii?Q?dA8AT7SupksjPx5txBNT8qcvGRl7JLGg4oCy04sXdy+T4OgJ2MjXBRWSVXsN?=
 =?us-ascii?Q?NosBLt0kupf3kx4wiRRiu5YtNtJx02btXK9sjWmgR8QaC/mUfXqa5SFCv3n6?=
 =?us-ascii?Q?PmfroecrbuHbis4Vcl8kWNI0BrgPk+XHypylONuJN38gATOoR0vq+UkkX7Kr?=
 =?us-ascii?Q?0Ngptn1QWO8MkLMf85rtU4KMvYUhdRUvi/NsR2OqoX0K8WDlH2AHm7/kc4sG?=
 =?us-ascii?Q?DcsIASqGn0WtYz2NAtEOLZ3+W3mRTpfG10d34J+8RywghXgbmDDSTrvNxpFI?=
 =?us-ascii?Q?8aMKzgTd1zfyZ5DCcN0sj+Odb8k9tAnLfx1l5oULXuQSVRBROaPhkzxqPy+W?=
 =?us-ascii?Q?0xAInqu6PxHytot2ncpiAnUE5uqJJtE8diINIDVkBV+6FA86d2Xwq0pdOR73?=
 =?us-ascii?Q?QC4MyLKKztOuW5thx2Ee/RHf703qNAQRb7mM6DZY+rnhA2YX0gBomorhxf6/?=
 =?us-ascii?Q?E0FOpntQ7xQIDMhioLkxsxasMJmesFX44PDH1K0IHTDJYiLsk11QNzJm5YrW?=
 =?us-ascii?Q?c1BZp/gWj9J0rYjhia05a5C70aMoGxlyaIliSrA3/vHLfTrSiK+KsIDqdRQ6?=
 =?us-ascii?Q?ya8SUNesdgM3qlOLyMh+5TSqC57rVtyaEyO1r+HwyJjnMYHD3PrYwInW4Msh?=
 =?us-ascii?Q?USBlp44JZDsYSKHKrQgOVIiiJIIePE7akibjW5cKF2IRxVFzRgbuBmKYV5q+?=
 =?us-ascii?Q?papsz8gg+4hsyn8JgwedO8YHU5w37hrnM+pzB2HZQXl2EwSplsrrmEh9L3x5?=
 =?us-ascii?Q?lHjr7AGwHq9f3IC4YI2EJDuF01zow6twmnLcLiC0HiEhEkZhf2pKN/UvERPo?=
 =?us-ascii?Q?rUq1RAumtAA5uDxKbcFpb1ZZMCJPUip/7vhp61uZyqWUpGZnPxm//f8V/1U6?=
 =?us-ascii?Q?FbBMnFhUKwpbOACWflgZKs3dySGuY96Te9HXvafrxxnBEGQSMKUlIEy7Jouc?=
 =?us-ascii?Q?wvDRkLbCqSdwoID1cQY33VoCyoDgQHXK0yeD8zIULNMWHMPOVurjsO8TBOdg?=
 =?us-ascii?Q?zaPSKEqzWlr0TVqguBnhkHzkLGBLn/FU1wj75aKicHGy+AEOtnb12Ty0vJDp?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rpVqJ7avjDpOZFKWB+CGxfZrymWfuhzF2fLYG6PGzTJ5cl6LSNPI/Gu4th1NlOBpeH3zVIni7oXLJ0Ho47dkeiq1nLTXNA1yRupra4tzh7T9VX9A/jFHUAlzro67uQiS10b+vCwtrdwNMa2fGmnf3QoE4OlgFBo9f7y75N5uDZEGlTBuQkB5Ue90IbqlhMGUbgnq20ppYTBdD8tef92UseTebekQPkQpQ1c3FyQYhvWqrWaQii9hALvtrqlAiwsSGwOw5HfeyUv/LA4QMC8Ka4YySx+UTkXiYEQnNBYJ+YKf4vQQHfJUxru1U/a3h5rvI14fBHKcl/XEVj1QWjlpq5b0Hifzz1LXyJmULl2XllP5zN86RJd+V94gAzn2eI10fWMuSXrUOVnt3a7BCEstMc0vnVR5Rd1D0/HgQaoTJA954jPm4Vhre2+J5yZhUo7uqPEtuymzo8G2OAvUMH4iGXQA65xSBHchf0aMpmFQ9yf7cKGbg4pZ0D6pEy5nWINieGUkoEAZmDyN3vwsLKyCB3FaqRTU2rM0LqLG+XQhwA1M+pyddSo2usZnN7c/dSGoFpodiCDBRkGlw7GmQhebqHKQ8uoyRLGWRo1tXnzXPPw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36615aba-bafc-41e8-bffe-08dcd7ecc4ee
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 14:18:29.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/dF0hwRObPdT5c0wpaKh6FBcEyTnpdaYnlrFUZ1fTuEgEw2ILlwiKQN/YBwkJo56drlYsp3w2LgBq8axHGO2Wi4lpI+CLLzlbc4gaMLTmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7141
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_10,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409180091
X-Proofpoint-GUID: O__8UHVRt0KlxbM4pfFSec5MEEI0JbT6
X-Proofpoint-ORIG-GUID: O__8UHVRt0KlxbM4pfFSec5MEEI0JbT6

On Thu, Aug 29, 2024 at 01:25:40AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Each stmt has a clause and a probe description.  Traditionally,
> we have added clauses to probes.  Further, we have generated an
> enabled probe ID for each probe/clause combination, and the
> consumer has use the EPID to determine the PRID as well as the
> data descriptor for the clause.
> 
> In an up-coming patch, we will move to a new scheme, in which a
> widened EPID will have the PRID in its upper 32 bits and a stmt
> ID in the lower 32 bits.  The stmt ID will be used to identify
> clauses to call as well as the data descriptor for the clause.

No widening of EPID is happening anymore so the above paragraph needs
to be amended.  Or can be omitted actually.  I don't think it needed.

> In this patch, change from probes having clauses associated
> with them to having stmts.
> 
> We move the definition of dt_probe_clause_t in dt_probe.c to
> be a definition of dt_probe_stmt_t in dt_impl.h so that the
> type will become available for providers that will need it.

No further patch seems to be using dt_probe_stmt_t *and* even if they
need to, they can just include probe.h, so I would still leave the
type in dt_probe.c.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_cg.c      | 17 +++++----
>  libdtrace/dt_impl.h    |  5 +++
>  libdtrace/dt_probe.c   | 79 +++++++++++++++++++++++-------------------
>  libdtrace/dt_probe.h   | 12 +++----
>  libdtrace/dt_program.c |  8 ++---
>  5 files changed, 66 insertions(+), 55 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 4fab8eed..a7861829 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -844,9 +844,10 @@ typedef struct {
>  } dt_clause_arg_t;
>  
>  static int
> -dt_cg_call_clause(dtrace_hdl_t *dtp, dt_ident_t *idp, dt_clause_arg_t *arg)
> +dt_cg_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_clause_arg_t *arg)
>  {
>  	dt_irlist_t	*dlp = arg->dlp;
> +	dt_ident_t	*idp = sdp->dtsd_clause;
>  
>  	/*
>  	 *	if (*dctx.act != act)	// ldw %r0, [%r9 + DCTX_ACT]
> @@ -874,14 +875,12 @@ dt_cg_call_clause(dtrace_hdl_t *dtp, dt_ident_t *idp, dt_clause_arg_t *arg)
>  }
>  
>  void
> -dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
> -			 dt_activity_t act)
> +dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp, dt_activity_t act)
>  {
>  	dt_irlist_t	*dlp = &pcb->pcb_ir;
>  	dt_clause_arg_t	arg = { dlp, act, pcb->pcb_exitlbl };
>  
> -	dt_probe_clause_iter(pcb->pcb_hdl, prp,
> -			     (dt_clause_f *)dt_cg_call_clause, &arg);
> +	dt_probe_stmt_iter(pcb->pcb_hdl, prp, (dt_stmt_f *)dt_cg_call_clause, &arg);
>  }
>  
>  static int
> @@ -990,9 +989,10 @@ dt_cg_tramp_epilogue_advance(dt_pcb_t *pcb, dt_activity_t act)
>  }
>  
>  static int
> -dt_cg_tramp_error_call_clause(dtrace_hdl_t *dtp, dt_ident_t *idp,
> -			      dt_irlist_t *dlp)
> +dt_cg_tramp_error_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_irlist_t *dlp)
>  {
> +	dt_ident_t *idp = sdp->dtsd_clause;
> +
>  	/*
>  	 *	dt_error_#(dctx);	// mov %r1, %r9
>  	 *				// call dt_error_#
> @@ -1029,8 +1029,7 @@ dt_cg_tramp_error(dt_pcb_t *pcb)
>  	TRACE_REGSET("Trampoline: Begin");
>  	emit(dlp, BPF_MOV_REG(BPF_REG_9, BPF_REG_1));
>  
> -	dt_probe_clause_iter(dtp, dtp->dt_error,
> -			     (dt_clause_f *)dt_cg_tramp_error_call_clause, dlp);
> +	dt_probe_stmt_iter(dtp, dtp->dt_error, (dt_stmt_f *)dt_cg_tramp_error_call_clause, dlp);
>  
>  	emit(dlp, BPF_MOV_IMM(BPF_REG_0, 0));
>  	emit(dlp, BPF_RETURN());
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 44dd1415..98fddc23 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -258,6 +258,11 @@ typedef struct dt_percpu_drops {
>  
>  typedef uint32_t dt_version_t;		/* encoded version (see below) */
>  
> +typedef struct dt_probe_stmt {
> +	dt_list_t		list;
> +	dtrace_stmtdesc_t	*stmt;
> +} dt_probe_stmt_t;
> +
>  struct dtrace_hdl {
>  	const dtrace_vector_t *dt_vector; /* library vector, if vectored open */
>  	void *dt_varg;	/* vector argument, if vectored open */
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index ab90d2ed..bb28bbed 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -24,11 +24,6 @@
>  #include <dt_list.h>
>  #include <dt_bpf.h>
>  
> -typedef struct dt_probe_clause {
> -	dt_list_t	list;
> -	dt_ident_t	*clause;
> -} dt_probe_clause_t;
> -
>  typedef struct dt_probe_dependent {
>  	dt_list_t	list;
>  	dt_probe_t	*probe;
> @@ -467,7 +462,7 @@ dt_probe_enable(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  void
>  dt_probe_destroy(dt_probe_t *prp)
>  {
> -	dt_probe_clause_t	*pcp, *pcp_next;
> +	dt_probe_stmt_t		*psp, *psp_next;
>  	dt_probe_instance_t	*pip, *pip_next;
>  	dt_probe_dependent_t	*dep, *dep_next;
>  	dtrace_hdl_t		*dtp;
> @@ -499,9 +494,18 @@ dt_probe_destroy(dt_probe_t *prp)
>  	dt_free(dtp, prp->nargv);
>  	dt_free(dtp, prp->xargv);
>  
> -	for (pcp = dt_list_next(&prp->clauses); pcp != NULL; pcp = pcp_next) {
> -		pcp_next = dt_list_next(pcp);
> -		dt_free(dtp, pcp);
> +	for (psp = dt_list_next(&prp->stmts); psp != NULL; psp = psp_next) {
> +		psp_next = dt_list_next(psp);
> +
> +		/*
> +		 * FIXME?  Is there nothing inside we also need to free?
> +		 *
> +		 * If psp->stmt was created with dt_probe_error_stmt(), maybe:
> +		 *     dt_ident_t *idp = psp->stmt->dtsd_clause;
> +		 *     dt_iddtor_difo(idp);
> +		 *     dt_ident_destroy(idp);
> +		 */

Since the identifier for the clause is added to the identifier hash, it will
be cleaned up when that hash is deleted, and the idops associated with the
clause identifier ensures that the identifier cleanup also gets rid of the
DIFO.

So the FIXME can be dropped.

> +		dt_free(dtp, psp);
>  	}
>  
>  	for (dep = dt_list_next(&prp->dependents); dep != NULL; dep = dep_next) {
> @@ -1283,24 +1287,24 @@ dtrace_probe_iter(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp,
>  }
>  
>  /*
> - * Create an ERROR-probe specific copy of a given clause.
> + * Create an ERROR-probe specific copy of a given stmt.
>   *
> - * A modified copy of the clause is necessary because the ERROR probe may share
> - * some clauses with other probes, and yet it needs to be handled differently.
> + * A modified copy of the stmt is necessary because the ERROR probe may share
> + * some stmts with other probes, and yet it needs to be handled differently.
>   *
> - * The following modifications are made in the copy of the clause:
> - *
> - *	- it is named dt_error_N where N is taken from the original clause
> - *	  dt_clause_N (which also guarantees uniqueness)
> + * In the copy of the stmt, the clause is named dt_error_N, where N is taken
> + * from the original stmt's dt_clause_N (which also guarantees uniqueness).
>   */
> -dt_ident_t *
> -dt_probe_error_clause(dtrace_hdl_t *dtp, dt_ident_t *idp)
> +static dtrace_stmtdesc_t *
> +dt_probe_error_stmt(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp)
>  {
>  	char		*name;
>  	int		len;
> +	dt_ident_t	*idp = sdp->dtsd_clause;
>  	dtrace_difo_t	*dp = dt_dlib_get_func_difo(dtp, idp);
>  	dt_ident_t	*nidp = NULL;
>  	dtrace_difo_t	*ndp;
> +	dtrace_stmtdesc_t *nsdp = NULL;
>  
>  	/*
>  	 * Copy the DIFO.
> @@ -1316,7 +1320,6 @@ dt_probe_error_clause(dtrace_hdl_t *dtp, dt_ident_t *idp)
>  	name = dt_alloc(dtp, len);
>  	if (name == NULL)
>  		goto no_mem;
> -
>  	snprintf(name, len, "dt_error_%s", idp->di_name + strlen("dt_clause_"));
>  
>  	/*
> @@ -1330,7 +1333,12 @@ dt_probe_error_clause(dtrace_hdl_t *dtp, dt_ident_t *idp)
>  
>  	dt_ident_set_data(nidp, ndp);
>  
> -	return nidp;
> +	nsdp = dt_alloc(dtp, sizeof(dtrace_stmtdesc_t));
> +	if (nsdp == NULL)
> +		goto no_mem;
> +	nsdp->dtsd_clause = nidp;
> +
> +	return nsdp;
>  
>  no_mem:
>  	if (ndp != NULL)
> @@ -1343,40 +1351,39 @@ no_mem:
>  }
>  
>  int
> -dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
> +dt_probe_add_stmt(dtrace_hdl_t *dtp, dt_probe_t *prp, dtrace_stmtdesc_t *sdp)
>  {
> -	dt_probe_clause_t	*pcp;
> +	dt_probe_stmt_t	*psp;
>  
> -	pcp = dt_zalloc(dtp, sizeof(dt_probe_clause_t));
> -	if (pcp == NULL)
> +	psp = dt_zalloc(dtp, sizeof(dt_probe_stmt_t));
> +	if (psp == NULL)
>  		return dt_set_errno(dtp, EDT_NOMEM);
>  
>  	if (prp == dtp->dt_error) {
> -		pcp->clause = dt_probe_error_clause(dtp, idp);
> -		if (pcp->clause == NULL) {
> -			dt_free(dtp, pcp);
> +		psp->stmt = dt_probe_error_stmt(dtp, sdp);
> +		if (psp->stmt == NULL) {
> +			dt_free(dtp, psp);
>  			return 0;
>  		}
>  	} else
> -		pcp->clause = idp;
> +		psp->stmt = sdp;
>  
> -	dt_list_append(&prp->clauses, pcp);
> +	dt_list_append(&prp->stmts, psp);
>  
>  	return 0;
>  }
>  
>  int
> -dt_probe_clause_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> -		     dt_clause_f *func, void *arg)
> +dt_probe_stmt_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp, dt_stmt_f *func, void *arg)
>  {
> -	dt_probe_clause_t	*pcp;
> -	int			rc;
> +	dt_probe_stmt_t	*psp;
> +	int		rc;
>  
>  	assert(func != NULL);
>  
> -	for (pcp = dt_list_next(&prp->clauses); pcp != NULL;
> -	     pcp = dt_list_next(pcp)) {
> -		rc = func(dtp, pcp->clause, arg);
> +	for (psp = dt_list_next(&prp->stmts); psp != NULL;
> +	     psp = dt_list_next(psp)) {
> +		rc = func(dtp, psp->stmt, arg);
>  
>  		if (rc != 0)
>  			return rc;
> diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
> index b4c1a3e4..2a78cb9c 100644
> --- a/libdtrace/dt_probe.h
> +++ b/libdtrace/dt_probe.h
> @@ -32,7 +32,7 @@ typedef struct dt_probe_instance {
>  
>  typedef struct dt_probe {
>  	dt_list_t list;			/* prev/next in enablings chain */
> -	dt_list_t clauses;		/* clauses to attach */
> +	dt_list_t stmts;		/* stmts */
>  	dt_list_t dependents;		/* dependenct probes to attach */
>  	const dtrace_probedesc_t *desc;	/* probe description (id, name) */
>  	dt_provider_t *prov;		/* pointer to containing provider */
> @@ -86,11 +86,11 @@ typedef int dt_probe_f(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg);
>  extern int dt_probe_iter(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp,
>  			 dt_probe_f *pfunc, dtrace_probe_f *dfunc, void *arg);
>  
> -extern int dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp,
> -			       dt_ident_t *idp);
> -typedef int dt_clause_f(dtrace_hdl_t *dtp, dt_ident_t *idp, void *arg);
> -extern int dt_probe_clause_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> -				dt_clause_f *func, void *arg);
> +extern int dt_probe_add_stmt(dtrace_hdl_t *dtp, dt_probe_t *prp,
> +			     dtrace_stmtdesc_t *sdp);
> +typedef int dt_stmt_f(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, void *arg);
> +extern int dt_probe_stmt_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> +			      dt_stmt_f *func, void *arg);
>  
>  extern int dt_probe_add_dependent(dtrace_hdl_t *dtp, dt_probe_t *prp,
>  				  dt_probe_t *idprp);
> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> index bdb434e0..afbf7265 100644
> --- a/libdtrace/dt_program.c
> +++ b/libdtrace/dt_program.c
> @@ -139,8 +139,8 @@ dtrace_program_info(dtrace_hdl_t *dtp, dtrace_prog_t *pgp,
>  }
>  
>  typedef struct pi_state {
> -	int		*cnt;
> -	dt_ident_t	*idp;
> +	int			*cnt;
> +	dtrace_stmtdesc_t	*sdp;
>  } pi_state_t;
>  
>  static int
> @@ -151,7 +151,7 @@ dt_stmt_probe(dtrace_hdl_t *dtp, dt_probe_t *prp, pi_state_t *st)
>  	dt_probe_info(dtp, prp->desc, &p);
>  	dt_probe_enable(dtp, prp);
>  
> -	dt_probe_add_clause(dtp, prp, st->idp);
> +	dt_probe_add_stmt(dtp, prp, st->sdp);
>  	(*st->cnt)++;
>  
>  	return 0;
> @@ -166,7 +166,7 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
>  	int			rc;
>  
>  	st.cnt = cnt;
> -	st.idp = sdp->dtsd_clause;
> +	st.sdp = sdp;
>  	rc = dt_probe_iter(dtp, pdp, (dt_probe_f *)dt_stmt_probe, NULL, &st);
>  
>  	/*
> -- 
> 2.43.5
> 
