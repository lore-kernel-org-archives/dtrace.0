Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCE910E0
	for <dtrace@lists.linux.dev>; Thu,  3 Oct 2024 05:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727931853; cv=fail; b=NSnZwvP4XDeGs7Aye1FYO1AE/D8EOSozfz3Nc0fd/w96DC6QKLaal1LZ2PJ+u17+O6jB11vlCE4LWFohRPOgUBO5q0ESxbT7HAevrB2yvguziDGXsuPUui81YqTMzWGBvoDWrlt0Gx+QsrJT1kLrZ7RtDe77hB7VqKWxCs5WxH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727931853; c=relaxed/simple;
	bh=hd69CyqAmqz8vUXB5lNg8LMlvVQqp+OsTeWKGBlfMWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Cm45SUO/4F8p7q9qxojobUJ+Om3r/xksNkFPgNYP7RvJA+YOr+mVKFNArnJWCC8o4Yao4qBeMas7982mHgrbahA4ArNm3m7eJE2Tvm5iZPFZKPIruGDXbVRO3HT3MOUqwNndFqak2IcB5xC1V/bJMX63ZyeRW/wa+kJuw+5dgBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oJ8WaK+y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TvxAgV5Q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oJ8WaK+y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TvxAgV5Q"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4934tcr9014685
	for <dtrace@lists.linux.dev>; Thu, 3 Oct 2024 05:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=2Y3zg9RKYhnxc86
	LqR/H33i2DrEv7yYxkHIlUKTXwTo=; b=oJ8WaK+yGjFpnOOBkMivpg77h7BLbFT
	JVBfA9YlP/3yNvkzXu9go+ZBdwptAEjjMhmKKBMwKqa2D301/AaTKja3/vdLeDlQ
	D91YfmfKuGy1UgOFw7QlK27pfyp3O9+WpxzcU0be8VbV7GWQ108kq1wwf7O++/Xb
	BtTTSCxGnSw+O0RlYL/+f8iZpHAzk42jQqJ4g38x6Bk5rPgaY2iwSTfr+17a2TL9
	YLdMzr3niEuP58GOfyahemlt/7zaIpFX4aeokHVv0DXr/PlLmL3zYJjmG5XibJes
	3dXQQqXpeorJ4MQRtI5witBgplzAev4MriPAlgyLGTG+Gsd0e0R+SFg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x8d1k3ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Oct 2024 05:04:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4933DnE5028390
	for <dtrace@lists.linux.dev>; Thu, 3 Oct 2024 05:04:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41x889xm91-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Oct 2024 05:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNKZmrOkd+ZKedQQ34mcCpUR1LRJXpsqBZIoeVCdEGPzm5lQuK1HmombP2QgRu/nUkzUBHxXES5+OjVjhqYVkqk+CLd2AcVF9UqSkqFU2LgH8sywBPrSi6tcgIC1TayaeRXmgey93Z/NM96LLoZly9zla7m9e0GX43qqby1A3csVumLclrsNlb+pzmOTepB7y2EauFdK3dqueKVdO0Qt8WxmOWhEWvsCpoXvoYp6UE0UTNjjDdWaIYjsHiHUd7+1B+1p32My9Y5qkhHh5wH5OVbLJR0GPFglfhDmMl0r+JGzYRLLc0qfHRD4NHtqfz9J5q1gvtAQVymKiDGohgUMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Y3zg9RKYhnxc86LqR/H33i2DrEv7yYxkHIlUKTXwTo=;
 b=ISxgozUhZjI8gcspf7ZoG98uR1PJwIWndi17BQTXEc8INAUCb9ucGK0+loal1nWLCmyrSVi7lzDiI39wOy8d68lDElpy0o2suh0Tm6IaBCZvPl6CXuiKCv0ciJo5kyN1rSm0LRt7ozgovEA6W1F7OhO4JWj+p0PNVtCjuOyLxcF9RYMBYiG9TgciaFdVLb9QtN5sGxbMXcGJ7DWs+qDI2cQReuI6DcbYVSbhP34Jxh1/73iNgCOhcuGH0PV5MtWUIeBNOWGZ/HdI+fGmPiaTxyDiSNrlldyf5NIY+cSIhsJINA9oAXtMIFjeVEoh1QpwDK/oiNnxzFoxSLKeRC/N2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Y3zg9RKYhnxc86LqR/H33i2DrEv7yYxkHIlUKTXwTo=;
 b=TvxAgV5Q9iAgy7louygY2f/StfzDl0SKlfFjjHSkgHjjgij9Ay0+bPC4mp2WIfNz0KcjZRn4Xb++n+tOeakENxMNYWwjv4xSfOQf7tASTq7qMh5PD5GbUcgkATRrlDVjEzcXIpIlvtROOGf3YiKCfsJdA0VNBd7p9UV6YylwAac=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4576.namprd10.prod.outlook.com (2603:10b6:a03:2ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 05:04:06 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 05:04:04 +0000
Date: Thu, 3 Oct 2024 01:04:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 07/19] Create the BPF usdt_prids map
Message-ID: <Zv4lwups32GXQsr2@oracle.com>
References: <20240928021525.8987-1-eugene.loh@oracle.com>
 <20240928021525.8987-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240928021525.8987-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4576:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e13c03b-405b-4ca1-6de6-08dce368cda9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bI9qs3AZLdHYn82jp17ygh5OGO6iTUzgkgkuZM6IUmsI59m9Qe2pIvIA7p/V?=
 =?us-ascii?Q?O9Tnq4bIdxTl4AXBZh3LxVIcToJszq8WLaF/Wsh8hzszuDKcMKU0X0UTfbz2?=
 =?us-ascii?Q?M0CnXBZhK8u1VPK9qsgr8qSByZ3AmY1wFN8vz8VuF/tDR791K72wK8ZvVzfZ?=
 =?us-ascii?Q?HlbIWe/DTv7/PMNqzeAEnmVkjkquWexPf8lZ1XLCuaoucWedFahsW/AmVvHn?=
 =?us-ascii?Q?/WglzOm527tc3WoiDLtiFKw3xMjW8sk9WFUODOFE4Q+rwPcGPwrp0mlDjnq0?=
 =?us-ascii?Q?3rHBRe1DShV/RitLr50ZzuauvKpxn29l1Pre9NnCgikSxo7IhdMUYP8uhgFD?=
 =?us-ascii?Q?cY1/Xpt6i8T5Zst8e7xY5BC4Xwqu8XzKc8wBB0cwxuasppNoJL6kbdRypp7I?=
 =?us-ascii?Q?yD4Tk8zuGW36hi9DY5rBun/inD3NArwh8FntivCO4YNqapsw539Tf3xAnZkF?=
 =?us-ascii?Q?lm+xX5nlVECB1/aAO3nqyQPB1ACYcmHKo5oyrohXbMt9cbEhrAK3HU484i1P?=
 =?us-ascii?Q?5+t8Y5lN8pm6BanfCjrSgGdMt9p2gDb32hJk4SZGMQp2ihIK4FlfbQocx0ne?=
 =?us-ascii?Q?lTolhFOepApV8StD6hlOUfmVEoJq+bQR626K/RkUx9Z7h65sTNW+bq91pyMw?=
 =?us-ascii?Q?Jdke4WGME/+s+ZLwmt3pa6crBWg5Fktb45vimzXk/sFzJv6sa97QX4YISHsp?=
 =?us-ascii?Q?fzGPKpzHGL6BeT2d0rtSyP2Vp/+c71wn7pSymZYhkWclIAxMbfOJKKQs07jb?=
 =?us-ascii?Q?I5N3/VKY5ieoxtpsyIu202Zzf2A5WkTxAdaZLXcSKsBnhu1fDEBDSID0mwIv?=
 =?us-ascii?Q?aIsh19HjqgMXxe5hpaIY8BFIN3b694XwdTxRkeqz3ob+UiIOPB6Pvhiamdi/?=
 =?us-ascii?Q?BpTd1xRaflFuL1CzaydZiAvVUJaroJ48f7BcuPD7vWLqq0bElH2ZfHCQRe+u?=
 =?us-ascii?Q?u/s54lcsA2CbC2HQ/ctFebbu5907AB1vwe+BquCcOBC9crFIiBAx2m5Giyym?=
 =?us-ascii?Q?kTlvMHKfUzIdP+CRPPBnzjszivc6+a5kDjpPsGtcWSNAvxN1EgSJtlneK6cf?=
 =?us-ascii?Q?K1bfZ2/OY3fQe88RmyfUAe60oHta0ltk2dzpEapBxccN2zBqpAQGXttIN1FQ?=
 =?us-ascii?Q?KSyFQyxiKW8sQ8wHCL2cXKsV9RPIjVHVDa7MWOtM0xCMlXE0tluDWd3tEgj7?=
 =?us-ascii?Q?7ue5GXS0k8zjhpOieG2B1r7Sex+EGZqQm8iDeg9iu7tPfwSNv0qDkvtPn5Lx?=
 =?us-ascii?Q?Z0H2nBzHMVpJ3Ny5kmDwIVXQNcEaj+bJmWB7fcVNww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QcTXEFK+9Q9yYmTTicAL6R2R174X87N7N3uVUJP+wKGU71Kp96yP1vAJXV7K?=
 =?us-ascii?Q?twcv+0YDuL0ZL1toAHL5L3qpaw+HEuNQucOea+NcBGFAH5ijvfTCcPARjMoT?=
 =?us-ascii?Q?vT7HGYzySIQC5+RrjRy/44O1m7jHYc/e7GwHqlK0jex+A5SVm33Bg/oRtklh?=
 =?us-ascii?Q?MxeVbvpPIGKU6NOh6fQsS+0yq8pvB9qKmfbufVU7c+NPji8dNXTGNKPSIq1f?=
 =?us-ascii?Q?2lefyAZWr2b/w1a+jvJP6QT7Wj5DVGV2M4nwxIL0N2VJ0P4k3/uyFcLAP8E+?=
 =?us-ascii?Q?hRFkAOd7NFsLiU1q02LshnlhmU4O1tZhg1V2MFaGYvPYP88I1Zk0lmynUSjg?=
 =?us-ascii?Q?nGCdeP4x86AICxuCKKgVBxd4ju5T42Y2vrnMakR1hgf/z1wzU/xGU5UZ/02r?=
 =?us-ascii?Q?1osP64h+xUiY4DFP85Ilt2IIvcoBOB3DFnSnS1qAA4Yn19gRLKUEa0E01sFD?=
 =?us-ascii?Q?QL6bELt9KTVTOnA278QbeIPuo2FtOo1IevNVlYV/zwR3CdLrrBI1YVFRAHXn?=
 =?us-ascii?Q?IHzxxPyERnjbJyl+WAFwWCqV2klQFIp1VL9Qg0kd2SRTQKGDlvj0i5j3VzAZ?=
 =?us-ascii?Q?qPyoq7oc98l7+iEQK9VGmVz7+Y9kmgUaHTRYON0IYwERiiX+ok7Giv4HTj+E?=
 =?us-ascii?Q?TSNApmiBMqG2w1DftGXaD/6kPKhrLl6LhQBdhqQxbFKV+3zIoqcmNt++UfO6?=
 =?us-ascii?Q?ZJeeNiYDceT2lrft4beJGPg02c/eWAO/fklWQSlDUPQR2EhryE5AyZeDAX2e?=
 =?us-ascii?Q?qddKz+A4IHYlQRqmYSsxNcLxYNbO3JXTqJAh2pn5270LTor7UwPhsx0YImNV?=
 =?us-ascii?Q?Fb8fx7LJ/VDEVj62PXKoLw5TZ/MV/RzBXcInmO267TLKWQGXcLzLlWAxSHd1?=
 =?us-ascii?Q?+VObkepS4xYfmKZlwz9RfuQw6/4VTyc65Q6LOXZxyb8HX7Fy06oxpbvfacua?=
 =?us-ascii?Q?V0mbcBUWkcXghc4MV8lNquf18/1M+QrXLhGN2B1lrbXW5dq+ZckTqaK8sX7r?=
 =?us-ascii?Q?WbkPOHUBjSsnrKqGKHuP1OZYToF6+xLgNljtztQu4aoj0NeJKYu9p1cMp3cw?=
 =?us-ascii?Q?9h9+U9JE3wSIRf+Ic4hKEcOmwdEAp5KLW1RUeFNSdCEPxx6DsPyJ6ov81Tt8?=
 =?us-ascii?Q?15/ECixEOARahFV7/cHJc7KClo6TV/e2WuuIyCI3WKCGhogdiP7foFQ4J/Nh?=
 =?us-ascii?Q?l1OnL6WCHwQeQ1UjMm3Sr2ATTYLRk7fwwHklbWuWSxzQR8z8jvPFtrrffgkL?=
 =?us-ascii?Q?7T0UMf23Ok1L5kF/FAgfaX0++Jq/RS2U8pC4CLEMu99AaOfFPuWoC8TTyATH?=
 =?us-ascii?Q?QC6zZiCRpjI7hcz6dS0A5hm4ezIRuiWxtGrhMOH9ogqaEMXl8uwIDqyzka6q?=
 =?us-ascii?Q?LFO/LR14Q11oek7SrG0ENhB5O1X1O9VsXOJx57OMH496wdqMhKNuCh9E1Tzx?=
 =?us-ascii?Q?BbZxY7dWTPjFWxYqm9/VSkWnK8Ze87Q5hzaI+wMktKSE35xkQBO4eqsM86KA?=
 =?us-ascii?Q?FplSQ/XTUXqCdgIhuCVWfmDfAns9xZh1RVLdsG5w8iXYaMOHXJr04HsmzD8o?=
 =?us-ascii?Q?CbcEG9t8nPIVeHus6VuWtRjPu6CAG0DZvNH3EJCXQIvGaE4mHGAWjIeAH+fy?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Hl0vVksYSO/zxCWYTj8DfyWyIGppizN7+1Sea5EtIuXaT4W9WftvVaNdwNjG1vfjK3YcPzX5hZQ2AhOCSJ6rlQnjRM65OoweGavsGqH/VnrwI/6bHOYPSWDBUmft2Ppm3m9iGG3RHX2E1f2UJOzsSaIRuxcjW4xGM7vDHTYetoQMm+cKh5lOSTqO5GH3glWlOB1sg9gjgch5he2Zw7CbH46XUBjXZPMfcusMibSbFl2fvWxrUzvCyCsyQwDogxJWJotkfi7MsBx5Wmmx9WaQCkvFLN1DiVUPv28LOdsfg/TEMdWZSOo58gwzutbyyJjVOerbIplh30xz0N8s6aHowPSvRN7pSMDSTAPMrfV6GCq3klDNBY0QAev5nzs9unEhyjNcSOFqmHm6Kb6KYcb8rQeKhQTxbhFzyWoR1OqkCNjL1sha66r4x5sORQjlJOnyHQNejJ4JOnkYvCDQI1nsvP2VtnYf+/5ELZ7Oe7z35cK6Ch+26SskiehdVEhkL8tIpfdXA/J+Zl2f/vX5RwYWyLWBY4OPEe5W3yjP6eVA6whOIfvjNuiF4K+MSvh5mhb2/rdWhtRc6UZ4VD1i3VLB8QIOnoeH71jbvKoVDWnynfE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e13c03b-405b-4ca1-6de6-08dce368cda9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 05:04:04.7506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAVrBEeFHsDTxmp38V2NsdnpwbeaIWHDDpiXPHEBxD1XbPjfqF6QNzznilDKLgOAH/WFeTCloN0f+I50reeKzIZeWXqohmS13K8zOoe14uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4576
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-03_04,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2410030033
X-Proofpoint-ORIG-GUID: nBF8GTv4v49fpEhd5YritZXoGGTYRQTj
X-Proofpoint-GUID: nBF8GTv4v49fpEhd5YritZXoGGTYRQTj

The main problem with the current implementation is the fact that the strtab
BPF map is being updated while it is being used.  That is not a safe operation,
and can have unpredictable behaviour depending on the actual implementation at
the kernel level.  We cannot cuont on it being safe.

I propose introducing a usdtsize option (or whatever we name it) that sets the
number of USDT probes that we can support.  It should be used for the size of
the usdt_prids map.

In order to be able to provide the data for probeprov, probemod, probefunc, and
probename, we need to have a way to store probe name elements dynamically.  That
can be done using a usdt_probes hashmap that stores a string (128 bytes max) and
is indexed by an int.  The bvara code will need to know to consult this new
BPF map to get the data.  I can see two options:

1) increase the probes BPF map by usdtsize extra elements, and set the highest
   order bit to indicate that the value for a probe name element should be
   retrieved from the usdt_probes hashmap.

2) add probe name element key values to the usdt_prids map

Approach 1 uses the existing the mechanism for storing this data, but adds some
(very minor) performance hit to all probeprov, probemod, probefunc, probename
bvar lookups because we need to check for the highest order bit.

Approach 2 means we have an alternative place where we store the probe name
element data, but it remains localized with the other USDT probe data *and*
the performance impact is limited to USDT probes only (if the prid is not
found in the probes map, we need to look in the usdt_prids map).

On Fri, Sep 27, 2024 at 10:15:25PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> As USDT processes come and go, the overlying probes for an underlying
> probe will change.  Hence, we will move to a scheme in which an
> underlying probe will walk all possible clauses it could call,
> deciding at run time (using a bit mask for the overlying USDT probe)
> which of the clauses to call.
> 
> In this patch, we create and update the BPF "usdt_prids" map.  This
> is a hash map, where:
> 
>   *)  the key (size: dtp->dt_usdt_pridsmap_ksz) comprises
>         - the PID of the firing process
>         - the PRID of the underlying probe
> 
>   *)  the value (size: dtp->dt_usdt_pridsmap_vsz) comprises
>         - the PRID over the overlying USDT probe
>         - a bit mask indicating which clauses should be called
> 
> As processes start up, we also add new overlying USDT probes,
> requiring updates of the BPF "probes" and "strtab" maps and of
> the list of enablings.
> 
> The underlying-probes "update" function is called sporadically.
> The focus of this patch is the function.  When it is called can
> be tuned in future patches.
> 
> This patch guesses certain sizes very crudely.  These sizes should
> be handled more robustly in future patches:
> 
>   *)  The allocated size of the string table.  For example,
>       new provider names have to be added as new processes
>       start.
> 
>   *)  The number of entries in the BPF "usdt_prids" map.
>       There is a little relief here in that, as processes
>       terminate, they can be removed from the map.
> 
>   *)  The size of the bit mask -- that is, the greatest
>       number of clauses an underlying probe might call.
>       This is relatively easy to extend;  nevertheless,
>       that work is left for a future patch.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_bpf.c         |  43 +++++-
>  libdtrace/dt_cc.c          |   2 +-
>  libdtrace/dt_dlibs.c       |   1 +
>  libdtrace/dt_impl.h        |   6 +
>  libdtrace/dt_prov_uprobe.c | 278 +++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_work.c        |   3 +
>  6 files changed, 331 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index ad11d178e..4acf6e494 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -841,7 +841,8 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
>  	int		fd, rc, err;
>  
>  	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
> -	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strlen, 8);
> +	dtp->dt_strmax = dtp->dt_strlen + 1000;            // FIXME pad some arbitrary amount to account for new USDT probes as new processes start
> +	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strmax, 8);
>  	dtp->dt_rosize = dt_rodata_size(dtp->dt_rodata);
>  	dtp->dt_zerooffset = P2ROUNDUP(dtp->dt_rooffset + dtp->dt_rosize, 8);
>  	dtp->dt_zerosize = 0;
> @@ -899,6 +900,7 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
>  	if (rc == -1)
>  		return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n",
>  				    strerror(err));
> +	dtp->dt_strtabmap_fd = fd;
>  
>  	return 0;
>  }
> @@ -936,6 +938,44 @@ gmap_create_probes(dtrace_hdl_t *dtp)
>  				dtp, "cannot update BPF map 'probes': %s\n",
>  				strerror(errno));
>  	}
> +	dtp->dt_probesmap_fd = fd;
> +
> +	return 0;
> +}
> +
> +/*
> + * Create the 'usdt_prids' BPF map.
> + *
> + * USDT-PRID information map.  This is a global hash map for use
> + * with USDT probes.  It is indexed by (pid, underlying probe ID).
> + * The value is a probe ID for the overlying USDT probe and a bit
> + * mask indicating which clauses to execute for this pid.
> + *
> + * WIP.  Just make up some sizes for now.
> + *
> + *     How big is a probe ID?  Sometimes, it's a dtrace_id_t.
> + *     And uts/common/sys/dtrace_types.h gives us "typedef uint32_t dtrace_id_t".
> + *     Meanwhile, libdtrace/dt_impl.h has "uint32_t dt_probe_id".
> + *     So either uint32_t or dtrace_id_t is fine.
> + *
> + *     How big should our bit mask be?  Start with 8*sizeof(long long) bits.
> + *
> + *     How many entries should we allow?  Start with 1000.
> + *
> + * Note that for a given (pid, PRID) key, there can be at most one
> + * overlying USDT probe.
> + */
> +static int
> +gmap_create_usdt_prids(dtrace_hdl_t *dtp)
> +{
> +	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
> +			 dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz, 1000);
> +	if (dtp->dt_usdt_pridsmap_fd == -1)
> +		return -1;
> +
> +	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
> +	if (dt_uprobe.update(dtp, NULL) < 0)
> +		return -1;
>  
>  	return 0;
>  }
> @@ -1045,6 +1085,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
>  	CREATE_MAP(scratchmem)
>  	CREATE_MAP(strtab)
>  	CREATE_MAP(probes)
> +	CREATE_MAP(usdt_prids)
>  	CREATE_MAP(gvars)
>  	CREATE_MAP(lvars)
>  	CREATE_MAP(dvars)
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index 4202771a9..12104fc21 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -1045,7 +1045,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  				nrp->dofr_data = 0;	/* FIXME */
>  				continue;
>  			case DT_CONST_STBSZ:
> -				nrp->dofr_data = dtp->dt_strlen;
> +				nrp->dofr_data = dtp->dt_strmax;
>  				continue;
>  			case DT_CONST_STRSZ:
>  				nrp->dofr_data =
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index ba4d4abef..924cf11e4 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -66,6 +66,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>  	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(mem, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(probes, DT_IDENT_PTR),
> +	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(scratchmem, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(specs, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 340dc1960..1d1248766 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -282,6 +282,7 @@ struct dtrace_hdl {
>  	dt_strtab_t *dt_ccstab;	/* global string table (during compilation) */
>  	dt_rodata_t *dt_rodata;	/* global read-only data */
>  	uint_t dt_strlen;	/* global string table (runtime) size */
> +	uint_t dt_strmax;	/* global string table (runtime) size, allocated */
>  	uint_t dt_rooffset;	/* read-only data offset */
>  	uint_t dt_rosize;	/* read-only data size */
>  	uint_t dt_zerooffset;	/* zero region, offset */
> @@ -389,6 +390,11 @@ struct dtrace_hdl {
>  	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
>  	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
>  	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
> +	int dt_strtabmap_fd;	/* file descriptor for the 'strtab' BPF map */
> +	int dt_probesmap_fd;	/* file descriptor for the 'probes' BPF map */
> +	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
> +	int dt_usdt_pridsmap_ksz; /* 'usdt_prids' BPF map key size */
> +	int dt_usdt_pridsmap_vsz; /* 'usdt_prids' BPF map value size */
>  	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
>  	void *dt_errarg;	/* error handler argument */
>  	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index bb172ace2..d99915fa2 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -37,8 +37,10 @@
>  #include "dt_list.h"
>  #include "dt_provider_tp.h"
>  #include "dt_probe.h"
> +#include "dt_program.h"
>  #include "dt_pid.h"
>  #include "dt_string.h"
> +#include "port.h"
>  
>  /* Provider name for the underlying probes. */
>  static const char	prvname[] = "uprobe";
> @@ -63,6 +65,15 @@ typedef struct list_probe {
>  	dt_probe_t	*probe;
>  } list_probe_t;
>  
> +typedef struct usdt_prids_map_key {
> +	pid_t		pid;
> +	dtrace_id_t	uprid;
> +} usdt_prids_map_key_t;
> +typedef struct usdt_prids_map_val {
> +	dtrace_id_t	prid;
> +	long long	mask;
> +} usdt_prids_map_val_t;
> +
>  static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> @@ -77,6 +88,9 @@ dt_provimpl_t	dt_usdt;
>  
>  static int populate(dtrace_hdl_t *dtp)
>  {
> +	dtp->dt_usdt_pridsmap_ksz = sizeof(usdt_prids_map_key_t);
> +	dtp->dt_usdt_pridsmap_vsz = sizeof(usdt_prids_map_val_t);
> +
>  	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
>  			       NULL) == NULL ||
>  	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
> @@ -123,6 +137,269 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
>  	free_probe_list(dtp, datap);
>  }
>  
> +/*
> + * Clean up the BPF "usdt_prids" map.
> + */
> +static int
> +purge_BPFmap(dtrace_hdl_t *dtp)
> +{
> +	int			fd = dtp->dt_usdt_pridsmap_fd;
> +	usdt_prids_map_key_t	key, nxt;
> +	usdt_prids_map_val_t	val;
> +
> +	/* Initialize key to a pid/uprid that cannot be found. */
> +	key.pid = 0;
> +	key.uprid = 0;
> +
> +	/* Loop over all entries. */
> +	while (dt_bpf_map_next_key(fd, &key, &nxt) == 0) {
> +		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
> +
> +		if (dt_bpf_map_lookup(fd, &key, &val) == -1)
> +			return dt_set_errno(dtp, EDT_BPF);
> +
> +		/* Check if the process is still running. */
> +		if (!Pexists(key.pid)) {
> +			dt_bpf_map_delete(fd, &key);          // FIXME:  bpf_map_next_key() iteration restarts each time we delete an elem!!!
> +			continue;
> +		}
> +
> +		/*
> +		 * FIXME.  There might be another case, where the process
> +		 * is still running, but some of its USDT probes are gone?
> +		 * So maybe we have to check for the existence of one of
> +		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
> +		 *     char *prv = ...pdp->prv minus the numerial part;
> +		 *
> +		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
> +		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
> +		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
> +		 */
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Grow the string table map.  It includes the string table (which might
> + * grow due to new USDT probes).  It also includes the read-only data and
> + * the block of zeros, but these remain fixed.
> + *
> + * FIXME Is there a danger of the BPF map update colliding with map reads?
> + */
> +static int
> +grow_strtab(dtrace_hdl_t *dtp)
> +{
> +	size_t		sz = dtp->dt_zerooffset + dtp->dt_zerosize;
> +	char		*strtab;
> +	uint8_t		*buf, *end;
> +	size_t		strsize = dtp->dt_options[DTRACEOPT_STRSIZE];
> +	uint32_t	key = 0;
> +	int		rc, err;
> +
> +	strtab = dt_zalloc(dtp, sz);
> +#if 0
> +	// FIXME do something
> +	if (strtab == NULL)
> +		return dt_set_errno(dtp, EDT_NOMEM);
> +#endif
> +
> +	/* Copy the string table data. */
> +	dt_strtab_write(dtp->dt_ccstab, (dt_strtab_write_f *)dt_strtab_copystr, strtab);
> +
> +	/* Loop over the string table and truncate strings that are too long. */
> +	buf = (uint8_t *)strtab;
> +	end = buf + dtp->dt_strlen;
> +	while (buf < end) {
> +		uint_t	len = strlen((char *)buf);
> +
> +		if (len > strsize)
> +			buf[strsize] = '\0';
> +
> +		buf += len + 1;
> +	}
> +
> +	/* Copy the read-only data. */
> +	dt_rodata_write(dtp->dt_rodata, (dt_rodata_copy_f *)dt_rodata_copy, strtab + dtp->dt_rooffset);
> +
> +	rc = dt_bpf_map_update(dtp->dt_strtabmap_fd, &key, strtab);
> +	err = errno;
> +	dt_free(dtp, strtab);
> +
> +	// FIXME do something
> +	if (rc == -1) {
> +		strerror(err);
> +		return -1;
> +		// return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n", strerror(err));
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Update the uprobe provider.
> + */
> +static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
> +{
> +	dt_probe_t	*prp;
> +	dt_probe_t	*prp_next;
> +	int		i, prid = dtp->dt_probe_id;
> +	uint_t		old_strlen = dtp->dt_strlen;
> +	dt_pcb_t	pcb;
> +
> +	/* Clear stale pids. */
> +	purge_BPFmap(dtp);
> +
> +	/* Update dt_probes[] and dt_enablings. */
> +	/*
> +	 * pcb is only used inside of dt_pid_error() to get:
> +	 *     pcb->pcb_region
> +	 *     pcb->pcb_filetag
> +	 *     pcb->pcb_fileptr
> +	 * While pcb cannot be NULL, these other things apparently can be.
> +	 */
> +	memset(&pcb, 0, sizeof(dt_pcb_t));
> +	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
> +		dtrace_stmtdesc_t *stp;
> +
> +		stp = dtp->dt_stmts[i];
> +		assert(stp != NULL);
> +		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
> +	}
> +
> +	while (prid < dtp->dt_probe_id) {
> +		dt_bpf_probe_t pinfo;
> +		const dtrace_probedesc_t *pdp = dtp->dt_probes[prid]->desc;
> +		int fd = dtp->dt_probesmap_fd;
> +
> +		dt_probe_enable(dtp, dtp->dt_probes[prid]);
> +
> +		pinfo.prv = dt_strtab_index(dtp->dt_ccstab, pdp->prv);
> +		pinfo.mod = dt_strtab_index(dtp->dt_ccstab, pdp->mod);
> +		pinfo.fun = dt_strtab_index(dtp->dt_ccstab, pdp->fun);
> +		pinfo.prb = dt_strtab_index(dtp->dt_ccstab, pdp->prb);
> +
> +		if (dt_bpf_map_update(fd, &pdp->id, &pinfo) == -1)
> +			assert(0);   // FIXME do something here
> +
> +		prid++;
> +	}
> +
> +	/* Grow the strtab if it has gotten bigger. */
> +	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
> +
> +	if (dtp->dt_strlen > dtp->dt_strmax)
> +		assert(0);               // FIXME handle this more gracefully
> +	if (dtp->dt_strlen > old_strlen)
> +		grow_strtab(dtp);
> +
> +	/* Review enablings. */
> +	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
> +		pid_t		pid;
> +		list_probe_t	*pup;
> +
> +		prp_next = dt_list_next(prp);
> +
> +		/* Make sure it is an overlying USDT probe. */
> +		if (prp->prov->impl != &dt_usdt)
> +			continue;
> +
> +		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
> +		/*
> +		 * Nick writes:
> +		 * This is a general problem with running compiler-adjacent things outside
> +		 * compile time. I think we should adjust dt_pid_error() so that it works
> +		 * with NULL pcb and dpr at once, probably by using the code path for
> +		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
> +		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
> +		 * already handle this case.)
> +		 */
> +		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
> +
> +		if (!Pexists(pid)) {
> +			/* Remove from enablings. */
> +			dt_list_delete(&dtp->dt_enablings, prp);
> +
> +			/* Make it evident from the probe that it is not in enablings. */
> +			((dt_list_t *)prp)->dl_prev = NULL;
> +			((dt_list_t *)prp)->dl_next = NULL;
> +
> +			/* Free up its list of underlying probes. */
> +			while ((pup = dt_list_next(prp->prv_data)) != NULL) {
> +				dt_list_delete(prp->prv_data, pup);
> +				dt_free(dtp, pup);
> +			}
> +			dt_free(dtp, prp->prv_data);
> +			prp->prv_data = NULL;
> +
> +			/* Free up BPF "probes" map entry. */
> +			dt_bpf_map_delete(dtp->dt_probesmap_fd, &prp->desc->id);
> +
> +			continue;
> +		}
> +
> +		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
> +			dt_probe_t		*uprp = pup->probe;
> +			long long		mask = 0, bit = 1;
> +			usdt_prids_map_key_t	key;
> +			usdt_prids_map_val_t	val, oval;
> +			dt_uprobe_t		*upp = uprp->prv_data;
> +
> +			/*
> +			 * For is-enabled probes, the bit mask does not matter.
> +			 * It is possible that we have this underlying probe due to
> +			 * an overlying pid-offset probe and that we will not know
> +			 * until later, when some new pid is created, that we also
> +			 * have an overlying USDT is-enabled probe, but missing this
> +			 * optimization opportunity is okay.
> +			 */
> +			if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
> +				int n;
> +
> +				for (n = 0; n < dtp->dt_stmt_nextid; n++) {
> +					dtrace_stmtdesc_t *stp;
> +
> +					stp = dtp->dt_stmts[n];
> +					assert(stp != NULL);
> +
> +					if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
> +					    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
> +					    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
> +					    dt_gmatch(prp->desc->prb, stp->dtsd_ecbdesc->dted_probe.prb))
> +						mask |= bit;
> +
> +					bit <<= 1;
> +				}
> +			}
> +
> +			key.pid = pid;
> +			key.uprid = uprp->desc->id;
> +
> +			val.prid = prp->desc->id;
> +			val.mask = mask;
> +
> +			/* linux/bpf.h says error is -1, but it could be -2 */
> +			if (dt_bpf_map_lookup(dtp->dt_usdt_pridsmap_fd, &key, &oval) < 0) {
> +				/*
> +				 * Set the map entry.
> +				 */
> +				// FIXME Check return value, but how should errors be handled?
> +				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
> +			} else if (val.prid != oval.prid || val.mask != oval.mask) {
> +				/*
> +				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
> +				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
> +				 */
> +			} else {
> +				/*
> +				 * Nothing to do, it already is in the map.
> +				 */
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
>  
>  /*
>   * Look up or create an underlying (real) probe, corresponding directly to a
> @@ -782,6 +1059,7 @@ dt_provimpl_t	dt_uprobe = {
>  	.probe_info	= &probe_info,
>  	.detach		= &detach,
>  	.probe_destroy	= &probe_destroy_underlying,
> +	.update		= &update_uprobe,
>  };
>  
>  /*
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 40913a0f1..0efad3633 100644
> --- a/libdtrace/dt_work.c
> +++ b/libdtrace/dt_work.c
> @@ -368,6 +368,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
>  	dtrace_workstatus_t	rval;
>  	int			gen;
>  
> +	if (dt_uprobe.update(dtp, NULL) < 0)
> +		return DTRACE_WORKSTATUS_ERROR;
> +
>  	switch (dtrace_status(dtp)) {
>  	case DTRACE_STATUS_EXITED:
>  	case DTRACE_STATUS_STOPPED:
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
