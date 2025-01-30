Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F5E84D34
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 16:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738253253; cv=fail; b=iD9pjPV8R7lxTg2fayznQvLoxHhDm9GyMqlL/Tg89NRtXJsCGtvwYHm3sUKRLOAGILzAMWo/C8jAnhSPHFUWq0tO4GoNbvDs48EriwZFZSJAzXlJ9KJQ5u3Zz+X5OGJ2+n3ukGMn8sa4xykftr7MD2k46RiMFpuMMo6ATeetOrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738253253; c=relaxed/simple;
	bh=XOx2X0bfLwiZXe1QPuQkc7rDibmqt1fgKPksMr/Q/2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Cxms8c0sk7hZY9RNAT7pQL7xIPlb9EnZH8wT1wgEHBvoDWMPDy077NYsRYFVr05XfQBxTrGLl+ZhlG4xklzaoNqGnm+0rqiA519Y5+tHNvNviSeRsOSNV6RxG6Jt8JJ8uHHuqXZ5QZEXuDsHnEVdFy5QIgknNH624uImvnPm8aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RRKKHdMb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZD45vpiA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RRKKHdMb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZD45vpiA"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UG0hCJ021606
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 16:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=i1Zz0RSnu4ccUDBVxe
	Xz4VDgb5cCtYEl6QJxgyCC/fw=; b=RRKKHdMbeMlm0Msdrh+KnH6lD9eaNtVRQB
	Ug+p2l6cr1h59CR0EcmgvnvslHNyPM7nFni6YroN21FA97R6/bFoaTmhJw6OQCBU
	f8skf7RU5Gd4ipVXQKRHrw/94jJpYG5lsxiNDTP+odvjeFVQMANI6mz4qVA4qM1m
	XYlRnxbkAY6gAG9TOY24MVVVJX1pdZ3aUEwfmZ1hbwG8AE1qjsTVeKtiIxw6xcDW
	n3tXB88Dt2gKle0iM0bljSIuvE97FDbosFY/5uhOfWYYQtlzJI6qDaxjNzpeiXLX
	zo8Ba0eMRnbIJMG/P8yuhmBpcgULjI31xDVg5uR/SGcG0I2WYTvQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gbbd07kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 16:07:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UFxE42038698
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 16:07:29 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdb92xf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 16:07:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSZX4ab09bG1/IiDdAhxnn19BZshdrDRTH+XT1wgD8HkBxeb3M/jo1FDLlnt6cyanyuiEvfK3nmT1ZFwC1/cCMQJT9tanxa815x2E6xxqnkwJcX8lMdxhGSWX72MbSFTKMv/UijfxspU3E8bJRagpxeVTnS+PecW/iFz7yC77UBggEygzzShLCN5tWYGuZJbl+QUMR2SjBZZymKAlQ7om51YXSJyZeP41A236zlDQTdcvW9XNbQ+cJ/qITEB9OQ3Lix782gvnUA7GvmkhrvBO+iyuDJ+4SN/EHVKAUbRRJmLLdHkq6u1RjCviAVuOIpRsnKTdp+OdCYKiiBmcwc/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1Zz0RSnu4ccUDBVxeXz4VDgb5cCtYEl6QJxgyCC/fw=;
 b=cVV1pa8YGlTJHybhyQwt8ULRCILkOlWIZFLlWrlmu0cQdVzTtJOdSVjtO9/OajeqFjIgMa9/60KpEWqT5qjPC9Il5mXWcWv89aPRWvbhRVqLx5XNs/I3tObvyFJWCFoKhRpCZAz5PegvuQDBC9mv3RpHprmeOYM84F1geBYjO77JrLqQhorfaLobKmGcVLvh3eRhGoBcjX2UrbElbhtvXlC/ZSUD7bPHzafNacHYPsDzZ5rxcv9pIfIe7RUy6iQTxk7w46lTqRBW+QTTmlY1tFe7lDZsfKfO3f4lJnb2jWL/1lHlkZ7943JzVQxyyfWMgG9ST6jcPlwoCNMaD4r/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1Zz0RSnu4ccUDBVxeXz4VDgb5cCtYEl6QJxgyCC/fw=;
 b=ZD45vpiAt9alhxtEwH9p6I24yqlq5w6ammtUhDML4nQ26Yk8tMp0I4ViQ4TXrdzCFcVck8nBA6gAGVF0EB8tRtLQn/I6RTtbKLy6OIUbUFNnElAuEffHzTd1Rx2+zAjkGZb5L8XpBJQ0J6BICLmVzxSf/fVY9zhnMl2MBMyA7UY=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by PH0PR10MB5545.namprd10.prod.outlook.com (2603:10b6:510:4b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 16:07:26 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 16:07:26 +0000
Date: Thu, 30 Jan 2025 11:07:23 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 4/6] procfs: implement d_execargs() for pr_psargs
 translator support
Message-ID: <Z5ujuwgbJ6j7QEjJ@oracle.com>
References: <PH8PR10MB6337029F91AD9127B9013409C2EE2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <2187872c-744b-4b1b-bee9-f504ef6376b6@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2187872c-744b-4b1b-bee9-f504ef6376b6@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|PH0PR10MB5545:EE_
X-MS-Office365-Filtering-Correlation-Id: 492220fe-5d38-4c66-2c14-08dd4148302f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UWRjyLqzV0oNtmrsayQhsbBQ/sed9mlmnHkMqqXCX4fexadVllQqwF84gELZ?=
 =?us-ascii?Q?VgO1oCDDcmdQwNRckkwCrVM2IOu8yGiOiEugJHOZ1qPCdWUJV+1K62PD6xSW?=
 =?us-ascii?Q?l4RWdzBDw0rtNzXiTNnzmmwRw+NWrzus7yd6aiB2vWW0GtSDhh7KwKo172Kk?=
 =?us-ascii?Q?ZjWljiYZdA4XElZFgnyzkC8wFYthSo/BEzmPqJ1dCbwul8KjlCmJF+wz0laQ?=
 =?us-ascii?Q?9SF9F0gf7wQQAMfJHHSXzPJYukd5vqx7NxzAoH7HhPDp9fyes/EWcvhkqHhC?=
 =?us-ascii?Q?KR/6JGnWAApIcblqr9p8LNsAzi1cOvKVgvc7T5mojnpOkYU/JQqFsD4SP3Q3?=
 =?us-ascii?Q?B7OcstVTqhWdxgueCQyhchE/7BWYndPHksE55wt1dauxvQ3rks+gOEZJ2ZQQ?=
 =?us-ascii?Q?wmnYEYRlm5cLUbKIuNAqB1tgjagLRLnsPhNYz+b+IBjClkr2OgKMrrkfeQ1u?=
 =?us-ascii?Q?Bu9HB8L1SP2v2WP/zKaEYq2Cb+ZEtIiIE2jCSdE6uuBUAhp2UBYBlcsdPMJZ?=
 =?us-ascii?Q?NxYUpLRrJ8uXThgvZBCrRmO7RQRU4ucMwwAUIWbJ1VSZV1GgdpivC3fdqtgq?=
 =?us-ascii?Q?AO6YL2h/MwG6aM5mS3A+vQhWcWrQKtUbPQDGbP59fHckyLuDmDzRYfLah8y5?=
 =?us-ascii?Q?B8L6+SPkBzJYifPIHHkpEPCWIjsHMUulGaEnKKnPasf4y5mlXJp67mEESJ5e?=
 =?us-ascii?Q?uNX+9IyJLFfLzp694JN6zPKuk+ZLdo1upl9U8cLPfFxb7Ckq7qG0URpzKVuZ?=
 =?us-ascii?Q?YwaU5CDHyQ/nJAi0oLu7HoD9hCtEx2hQQzMe/mdoCZ4Fb0eRlzSyj4QSjdtN?=
 =?us-ascii?Q?OEnXnQDZb7Lt1eZIfmjRaeF+hTICR7m7yia5T1NVf2mACWTxLadfMVU9h8je?=
 =?us-ascii?Q?gbyICGdcsWgksDLXpYHnxGDAUiPtwP91mHdydepxQZ33Huht80giiIui6YMV?=
 =?us-ascii?Q?YOOAOe7/ixFXyeOhLNonms2LfZGziHQTJNSzpyZxfPgHZXm7elmID/iJnrg2?=
 =?us-ascii?Q?SUAt4KTERPLT+7J/EriWTDVZBx5LpFF8ayv6mx/hQDmtDg/PAIYgTX/vJcD8?=
 =?us-ascii?Q?rNTprmLXGo/tucfj1Kb8VjShkQHz8Zh14fN3T7+lxc1EymkykVNv3MXXFX/r?=
 =?us-ascii?Q?COK3TpeUWxKvVPcBYJI/0cWEpQQOiwK8pVyxiKbkV+yYBY64MaaA79fOQNg5?=
 =?us-ascii?Q?exCPzQikeFucBxoMeSm2Emj1kByRsUr5g0B1rTwinuD5OIFKiTZc0Fa63xBJ?=
 =?us-ascii?Q?KDemAqx9ta5Usbg/GIPlP9WiWykUPKDymkGBZ5zDnzmG22Jv4Xui7p6uNDmx?=
 =?us-ascii?Q?UbI3TgQOwo/MQQEj82e4blEIeWmxY9wEqIRSZQzhpWdNVg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?crGvMXE4RCuXT/ItQY8T830AGfdF02IfeR256MlQZaNLcg3TklPcEfVSNtyY?=
 =?us-ascii?Q?orNfaGpDlRP+Omu9mILuNcsMYBPpQfVaJ7L5WNSX8rcK8D/XQ+XFHjeFiXW/?=
 =?us-ascii?Q?396wYD7AuuhkBNeSosYHrbKg4F6a/MjxWjqeZ9Wc+JSJXfMjX7fHVjDawjxR?=
 =?us-ascii?Q?PrnDfnX28McQ0cTj9a4847QDa8s+1Wo1n89H7p9sJQEAdpov0izlHfN/8xCd?=
 =?us-ascii?Q?Wns0p3J6xaGvrFCidnrqDXJbVbOGAwFgdE1/YdFPDxKFT0RZvbuyO/v5v2ch?=
 =?us-ascii?Q?2vBuL1zhxLIvPyte2CCNOsVbH+5PNdNI+h1BknnPSODe9Q5f7e/8xdLdy4SG?=
 =?us-ascii?Q?wbR6zKMPUEguYZKEN/2+BrCLgvYNS+3lAJ84U9eaU3oMTfi9qfCeiy3vzGpu?=
 =?us-ascii?Q?69NUrIBVTapSFtpXCqRYrY8PvGrGk5+Q+eMEYXk+c8aZQyS5vcfWfhIJDSX/?=
 =?us-ascii?Q?IH654jJXI0wHmJm2I2yuVS6BugAIQREmjEfcaZf2Mn57KRof1Fy+HNTLK6fF?=
 =?us-ascii?Q?zS+q2UjPPRcC9YzHIKd5qpiK/8w/ZPvibzzPnHVMCP6kWH9dwiQGywkHnOlp?=
 =?us-ascii?Q?1G5XfBa83nlRLopFJWZBU91ZDZMvuAtJVjyqvIh2GsCABUDNyfzdq0b8nlqP?=
 =?us-ascii?Q?P9VwcLqXLYjD5SvuxBv75cyFCRptDdNwpEQPkmUoXJbmur0t1g5wvjCG4rE5?=
 =?us-ascii?Q?+eCYlbIYPUq0cxjCNreQm+1YX4712iiOJgYKXdHkwFPyJdIn/KHpn7gUsrrn?=
 =?us-ascii?Q?+1f+qs/36lmhHspLoDBDB09vesm5KPwEN7ytLhK740vhVz/WXVegY6kYHlk1?=
 =?us-ascii?Q?6ArHnpwtSrBht2iaQ6gJfJwY63HZrL5pGXPtLEFX/kHlD/vqFDJXNCNACezK?=
 =?us-ascii?Q?vJEk3n2xQ+MjXqCvMoE/d7uzhR4DTfb3HQX3sm+B9eVnWGzI1kneFkfQxtkg?=
 =?us-ascii?Q?IBSIDG6VsTigaIcm/p1lpUfoqX2VtheLRg4W/L8JTNbfGtgJA+A3fNWz44Ni?=
 =?us-ascii?Q?lac029oQL9gVYbFILe+amqiXxHslBYU93e4YPQ1jRuMAHD0BCaDguqs55Lda?=
 =?us-ascii?Q?4uApEStwFWCKAUurBgY/nOI+E8whZJA6H07osQW0lOzMSj45x6xBu0dlWPVn?=
 =?us-ascii?Q?7JVWZZXIX69VvgmeFnVeUDcm/Lq9STlYAbkFJSRn0SLlE8+GnQ7QP+udCFYo?=
 =?us-ascii?Q?iLqu9EbO998C4/pcTGdQ6yLf4zUVv/gB7MaFGkHM/kKbJu57ngXy69F/FoVP?=
 =?us-ascii?Q?h/zhl15T5u5yRwAH8rIBdVNCv7Wt41YStbFzc4Up0RvHfGk4YYTZViJLPG0B?=
 =?us-ascii?Q?NUdNQO28l1xHOsLR4x3MiWDNxRnnEkaK85KsJWVqK6kPFzeJf7EXTYTWMVOg?=
 =?us-ascii?Q?L5hmiHqSaqMv3Wteaty7dNvU/KfHjWJQnZfGJ7nALlNQNlEEDGmyLtQH/jvu?=
 =?us-ascii?Q?cb3ftIP36kLYIje5lha3h/4IaJzK+apd8sOWqOpCzu2A4IjDP5LgmjuT9oRA?=
 =?us-ascii?Q?NftB11ZaI3iwatINub0fDUlW4Jl8pB9DyUUyIJPtf0XmFPivN556I3ZQuE1b?=
 =?us-ascii?Q?fMky9uJ9s7Ec3r2tLtPkoa7+nBF8J3EfkzNrse2sIILYPHXnrxaw+7A+WYmS?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ep7yUZ6Sk+ooHg+2pDCi8EHY06x3lu4lpXy7fWtLm79VK62KH9dv3LAVGY2b45yP2I+I3QYbf3ZaQZ1iizZ3kVDtExldLtLn12uunH5u/QJpQGCMwu5visUyO652GMavV0Pt7HKdZEjUNv702hgtDdDV27gxET5XFWSPNnvPUJnLOqOCLzOQPwvw0chsdoeyGm8GtLoiHLQOMtKLWrmiNjTUEM2FQhO/bv9PB+YiLb27/WmwONE/GjtzG61PfNG7Vu8wbuJIvkVLPLAYaizRsEzWnxXTRN67FFrrp1r60exkHdXG39MF7M4Q2V5VW7ouWiqbYBmkk8EkNmmXgjNYpFIG5bSOq/Z7FEJ9VEtt5TwjGakMml5hbKXUNXHqHFQA2ZUQkWVBSNndGFXE8/xI0g/LGiIpZ5sx7WFrCXduCTYKeHLtNyyplp/saSITXGpZd9qGcuaeDeqU4quSP+W928LXUYD0SVwBd6bobfhZ69VV+YdxR3HlLhT2R/4S4l1TIaO1BDeHVnYRZATkKdNs77xjnG051MvnHDVja3MbJLZ8DgTNuQx+KZo+L5bYQaVO1lkDsB4GXbBI/ragHyHsvA7yu+lv35iFYl6pvh6RXLs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492220fe-5d38-4c66-2c14-08dd4148302f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:07:26.0943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7m61ziRDSgBEKhHuZxLkeHV2yzPKcENpsa8gu7uhpuX5dgKgAD4BqEYT6THy5RIsW2eUAMKaMKlMXdHYHX1o9YotFeYTbg6/UceTqxA10M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5545
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_07,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300121
X-Proofpoint-ORIG-GUID: 1tUJ2w6Zb5JbIR0P0UmJ5HK5NsHQDOjh
X-Proofpoint-GUID: 1tUJ2w6Zb5JbIR0P0UmJ5HK5NsHQDOjh

On Thu, Jan 30, 2025 at 11:03:29AM +0000, Alan Maguire wrote:
> On 29/01/2025 07:00, Kris Van Hees wrote:
> > Implement d_execargs() to provide task argument string (pr_psargs)
> > for the psinfo translator.  It takes a task (struct task_struct) as
> > argument and returns a string.
> > 
> > psinfo->pr_psargs now simply calls d_execargs(T).
> > 
> 
> thanks for doing this! I was wondering; would there be a case for
> generalizing the d_execargs() to also capture environment variables
> (which can be retrieved from the task struct mm struct in a similar
> null-separated var=value list)?
> 
> In other words, we pass in the start/end pointers (arg_start, arg_end
> for task args, env_start, env_end for env var=value strings). Then the
> function would be a more generic, taking a set of strings between these
> two start/end addresses and putting them into a single, space-seperated
> string (d_coalesce_strings() or something might make sense as a name).

Since there are only two cases for this, a generic function would be less
useful I think.  And honestly, there isn't even a real use case for doing the
same for environment variables because those key value pairs, and thus getting
them in a single string is less useful.

Ideally, we will be able to support pr_argv and pr_envp arrays in the future,
but that is still a little uncertain because such pointer arrays do not exist
in the Linux task structure.  Therefore, to support that part of the psinfo
translator we'd need to create it on demand, and that bring up memory mgmt
issues (data life time tracking etc).  Not fun.

> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >  bpf/Build                                     |  1 +
> >  bpf/d_execargs.S                              | 91 +++++++++++++++++++
> >  dlibs/aarch64/5.11/procfs.d                   |  4 +-
> >  dlibs/aarch64/5.12/procfs.d                   |  4 +-
> >  dlibs/aarch64/5.14/procfs.d                   |  4 +-
> >  dlibs/aarch64/5.16/procfs.d                   |  4 +-
> >  dlibs/aarch64/5.2/procfs.d                    |  4 +-
> >  dlibs/aarch64/5.6/procfs.d                    |  4 +-
> >  dlibs/aarch64/6.1/procfs.d                    |  4 +-
> >  dlibs/aarch64/6.10/procfs.d                   |  4 +-
> >  dlibs/x86_64/5.11/procfs.d                    |  4 +-
> >  dlibs/x86_64/5.12/procfs.d                    |  4 +-
> >  dlibs/x86_64/5.14/procfs.d                    |  4 +-
> >  dlibs/x86_64/5.16/procfs.d                    |  4 +-
> >  dlibs/x86_64/5.2/procfs.d                     |  4 +-
> >  dlibs/x86_64/5.6/procfs.d                     |  4 +-
> >  dlibs/x86_64/6.1/procfs.d                     |  4 +-
> >  dlibs/x86_64/6.10/procfs.d                    |  4 +-
> >  include/dtrace/dif_defines.h                  |  7 +-
> >  libdtrace/dt_bpf.h                            | 21 +++--
> >  libdtrace/dt_cc.c                             | 33 ++++++-
> >  libdtrace/dt_cg.c                             |  9 +-
> >  libdtrace/dt_dlibs.c                          |  3 +
> >  libdtrace/dt_open.c                           |  2 +
> >  libdtrace/procfs.d.in                         |  4 +-
> >  .../d_execargs/err.D_PROTO_ARG.scalar_arg.d   | 16 ++++
> >  .../d_execargs/err.D_PROTO_ARG.scalar_arg.r   |  4 +
> >  .../d_execargs/err.D_PROTO_ARG.string_arg.d   | 16 ++++
> >  .../d_execargs/err.D_PROTO_ARG.string_arg.r   |  4 +
> >  .../d_execargs/err.D_PROTO_ARG.wrong_ptr.d    | 16 ++++
> >  .../d_execargs/err.D_PROTO_ARG.wrong_ptr.r    |  4 +
> >  .../d_execargs/err.D_PROTO_LEN.missing_arg.d  | 16 ++++
> >  .../d_execargs/err.D_PROTO_LEN.missing_arg.r  |  2 +
> >  .../err.D_PROTO_LEN.too_many_args.d           | 16 ++++
> >  .../err.D_PROTO_LEN.too_many_args.r           |  2 +
> >  .../funcs/d_execargs/tst.d_execargs.d         | 31 +++++++
> >  .../funcs/d_execargs/tst.d_execargs.r         |  2 +
> >  test/unittest/proc/tst.pr_psargs.d            | 31 +++++++
> >  test/unittest/proc/tst.pr_psargs.r            |  9 ++
> >  39 files changed, 339 insertions(+), 65 deletions(-)
> >  create mode 100644 bpf/d_execargs.S
> >  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
> >  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
> >  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
> >  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
> >  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
> >  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
> >  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
> >  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
> >  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
> >  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
> >  create mode 100644 test/unittest/funcs/d_execargs/tst.d_execargs.d
> >  create mode 100644 test/unittest/funcs/d_execargs/tst.d_execargs.r
> >  create mode 100644 test/unittest/proc/tst.pr_psargs.d
> >  create mode 100644 test/unittest/proc/tst.pr_psargs.r
> > 
> > diff --git a/bpf/Build b/bpf/Build
> > index 3e43f4b6..9355326c 100644
> > --- a/bpf/Build
> > +++ b/bpf/Build
> > @@ -24,6 +24,7 @@ bpf_dlib_SOURCES = \
> >  	agg_lqbin.c agg_qbin.c \
> >  	basename.S \
> >  	cleanpath.S \
> > +	d_execargs.S \
> >  	dirname.S \
> >  	get_agg.c \
> >  	get_bvar.c \
> > diff --git a/bpf/d_execargs.S b/bpf/d_execargs.S
> > new file mode 100644
> > index 00000000..3a5b1270
> > --- /dev/null
> > +++ b/bpf/d_execargs.S
> > @@ -0,0 +1,91 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2025, Oracle and/or its affiliates.
> > + */
> > +
> > +#include <bpf_asm_helpers.h>
> > +#include <dtrace/faults_defines.h>
> > +
> > +	.text
> > +	.align	4
> > +	.global	dt_d_execargs
> > +dt_d_execargs:
> > +	stxdw	[%fp+-8], %r1			/* save dctx to stack */
> > +	mov	%r9, %r3			/* %r9 = args */
> > +
> > +	mov	%r6, %r2			/* set %r6 in case of error */
> > +	jeq	%r6, 0, .Lerror
> > +
> > +	add	%r6, TASK_MM			/* ptr = &(T->mm) */
> > +
> > +	mov	%r1, %r9
> > +	mov	%r2, 8
> > +	mov	%r3, %r6
> > +	call	BPF_FUNC_probe_read
> > +	jne	%r0, 0, .Lerror
> > +
> > +	ldxdw	%r8, [%r9+0]			/* %r8 = T->mm */
> > +	jeq	%r8, 0, .Lempty
> > +	mov	%r6, %r8
> > +	add	%r6, TASK_MM_ARG_START		/* ptr = &(T->mm->arg_start) */
> > +
> > +	mov	%r1, %r9
> > +	mov	%r2, 8
> > +	mov	%r3, %r6
> > +	call	BPF_FUNC_probe_read
> > +	jne	%r0, 0, .Lerror
> > +
> > +	ldxdw	%r7, [%r9+0]			/* %r7 = T->mm->arg_start */
> > +	mov	%r6, %r8
> > +	add	%r6, TASK_MM_ARG_END		/* ptr = &(T->mm->arg_end) */
> > +
> > +	mov	%r1, %r9
> > +	mov	%r2, 8
> > +	mov	%r3, %r6
> > +	call	BPF_FUNC_probe_read
> > +	jne	%r0, 0, .Lerror
> > +
> > +	ldxdw	%r6, [%r9+0]			/* %r6 = T->mm->arg_end */
> > +
> > +	mov	%r8, %r6
> > +	sub	%r8, %r7			/* %r8 = len = arg_end - arg_start */
> > +	jslt	%r8, 2, .Lempty
> > +	mov	%r0, STRSZ
> > +	jslt	%r8, %r0, .Llen_ok
> > +	mov	%r8, %r0
> > +.Llen_ok:
> > +
> > +	/* read data from arg_start to arg_end */
> > +	mov	%r1, %r9
> > +	mov	%r2, %r8
> > +	mov	%r3, %r7
> > +	call	BPF_FUNC_probe_read		/* bpf_probe_read(&args, len + 1, arg_start) */
> > +	jne	%r0, 0, .Lerror
> > +
> > +	/* loop over args and replace '\0' with ' ' */
> > +	mov	%r1, %r8
> > +	sub	%r1, 2
> > +.Lloop:
> > +	mov	%r2, %r9
> > +	add	%r2, %r1
> > +	ldxb	%r0, [%r2+0]
> > +	jne	%r0, 0, .Lnot_nil
> > +	stb	[%r2+0], 32
> > +.Lnot_nil:
> > +	sub	%r1, 1
> > +	jsge	%r1, 0, .Lloop
> > +
> > +.Ldone:
> > +	mov	%r0, %r9
> > +	exit					/* return args */
> > +.Lerror:
> > +	ldxdw	%r1, [%fp+-8]
> > +	mov	%r2, PC
> > +	mov	%r3, DTRACEFLT_BADADDR
> > +	mov	%r4, %r6
> > +	call	dt_probe_error
> > +.Lempty:
> > +	mov	%r0, %r9
> > +	stb	[%r9+0], 0			/* args[0] = 0 */
> > +	exit					/* return args */
> > +	.size	dt_d_execargs, .-dt_d_execargs
> > diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
> > index 44ec4280..70a43ddf 100644
> > --- a/dlibs/aarch64/5.11/procfs.d
> > +++ b/dlibs/aarch64/5.11/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
> > index 44ec4280..70a43ddf 100644
> > --- a/dlibs/aarch64/5.12/procfs.d
> > +++ b/dlibs/aarch64/5.12/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
> > index 584ac325..ef27bb70 100644
> > --- a/dlibs/aarch64/5.14/procfs.d
> > +++ b/dlibs/aarch64/5.14/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
> > index 5aabc6f1..cad2d2c5 100644
> > --- a/dlibs/aarch64/5.16/procfs.d
> > +++ b/dlibs/aarch64/5.16/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
> > index 683ff5a8..6b1b1b9c 100644
> > --- a/dlibs/aarch64/5.2/procfs.d
> > +++ b/dlibs/aarch64/5.2/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
> > index 44ec4280..70a43ddf 100644
> > --- a/dlibs/aarch64/5.6/procfs.d
> > +++ b/dlibs/aarch64/5.6/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
> > index 5d7873b5..4cb7b77c 100644
> > --- a/dlibs/aarch64/6.1/procfs.d
> > +++ b/dlibs/aarch64/6.1/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
> > index 5d7873b5..4cb7b77c 100644
> > --- a/dlibs/aarch64/6.10/procfs.d
> > +++ b/dlibs/aarch64/6.10/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
> > index 7274554e..c2be76d8 100644
> > --- a/dlibs/x86_64/5.11/procfs.d
> > +++ b/dlibs/x86_64/5.11/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
> > index 7274554e..c2be76d8 100644
> > --- a/dlibs/x86_64/5.12/procfs.d
> > +++ b/dlibs/x86_64/5.12/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
> > index d1cf90d3..28fada6d 100644
> > --- a/dlibs/x86_64/5.14/procfs.d
> > +++ b/dlibs/x86_64/5.14/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
> > index 5aabc6f1..cad2d2c5 100644
> > --- a/dlibs/x86_64/5.16/procfs.d
> > +++ b/dlibs/x86_64/5.16/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
> > index 35538862..08696cf7 100644
> > --- a/dlibs/x86_64/5.2/procfs.d
> > +++ b/dlibs/x86_64/5.2/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
> > index 7274554e..c2be76d8 100644
> > --- a/dlibs/x86_64/5.6/procfs.d
> > +++ b/dlibs/x86_64/5.6/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
> > index 5d7873b5..4cb7b77c 100644
> > --- a/dlibs/x86_64/6.1/procfs.d
> > +++ b/dlibs/x86_64/6.1/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
> > index 5d7873b5..4cb7b77c 100644
> > --- a/dlibs/x86_64/6.10/procfs.d
> > +++ b/dlibs/x86_64/6.10/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> > index c8c1d961..cd785723 100644
> > --- a/include/dtrace/dif_defines.h
> > +++ b/include/dtrace/dif_defines.h
> > @@ -207,10 +207,11 @@
> >  #define DIF_SUBR_INET_NTOP		41
> >  #define DIF_SUBR_INET_NTOA		42
> >  #define DIF_SUBR_INET_NTOA6		43
> > -#define DIF_SUBR_D_PATH			44
> > -#define DIF_SUBR_LINK_NTOP		45
> > +#define DIF_SUBR_LINK_NTOP		44
> > +#define DIF_SUBR_D_PATH			45
> > +#define DIF_SUBR_D_EXECARGS		46
> >  
> > -#define DIF_SUBR_MAX			45
> > +#define DIF_SUBR_MAX			46
> >  
> >  typedef uint32_t	dif_instr_t;
> >  
> > diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
> > index 6518de66..85934d2d 100644
> > --- a/libdtrace/dt_bpf.h
> > +++ b/libdtrace/dt_bpf.h
> > @@ -47,15 +47,18 @@ extern "C" {
> >  #define DT_CONST_TASK_TGID		12
> >  #define DT_CONST_TASK_REAL_PARENT	13
> >  #define DT_CONST_TASK_COMM		14
> > -#define DT_CONST_MUTEX_OWNER		15
> > -#define DT_CONST_RWLOCK_CNTS		16
> > -#define DT_CONST_DCTX_RODATA		17
> > -#define DT_CONST_RODATA_OFF		18
> > -#define DT_CONST_RODATA_SIZE		19
> > -#define DT_CONST_ZERO_OFF		20
> > -#define DT_CONST_STACK_OFF		21
> > -#define DT_CONST_STACK_SKIP		22
> > -#define DT_CONST_NPROBES		23
> > +#define DT_CONST_TASK_MM		15
> > +#define DT_CONST_TASK_MM_ARG_START	16
> > +#define DT_CONST_TASK_MM_ARG_END	17
> > +#define DT_CONST_MUTEX_OWNER		18
> > +#define DT_CONST_RWLOCK_CNTS		19
> > +#define DT_CONST_DCTX_RODATA		20
> > +#define DT_CONST_RODATA_OFF		21
> > +#define DT_CONST_RODATA_SIZE		22
> > +#define DT_CONST_ZERO_OFF		23
> > +#define DT_CONST_STACK_OFF		24
> > +#define DT_CONST_STACK_SKIP		25
> > +#define DT_CONST_NPROBES		26
> >  
> >  #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
> >  #define DT_BPF_LOG_SIZE_SMALL	4096
> > diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> > index 29cfbd84..1dc119ea 100644
> > --- a/libdtrace/dt_cc.c
> > +++ b/libdtrace/dt_cc.c
> > @@ -1082,7 +1082,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
> >  			case DT_CONST_TASK_PID:
> >  			case DT_CONST_TASK_TGID:
> >  			case DT_CONST_TASK_REAL_PARENT:
> > -			case DT_CONST_TASK_COMM: {
> > +			case DT_CONST_TASK_COMM:
> > +			case DT_CONST_TASK_MM: {
> >  				ctf_file_t *cfp = dtp->dt_shared_ctf;
> >  				ctf_id_t type;
> >  				ctf_membinfo_t ctm;
> > @@ -1108,6 +1109,36 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
> >  				case DT_CONST_TASK_COMM:
> >  					rc = ctf_member_info(cfp, type, "comm", &ctm);
> >  					break;
> > +				case DT_CONST_TASK_MM:
> > +					rc = ctf_member_info(cfp, type, "mm", &ctm);
> > +					break;
> > +				}
> > +				if (rc == CTF_ERR)
> > +					goto err_ctf;
> > +				nrp->dofr_data = ctm.ctm_offset / NBBY;
> > +				continue;
> > +			}
> > +			case DT_CONST_TASK_MM_ARG_START:
> > +			case DT_CONST_TASK_MM_ARG_END: {
> > +				ctf_file_t *cfp = dtp->dt_shared_ctf;
> > +				ctf_id_t type;
> > +				ctf_membinfo_t ctm;
> > +				int rc = 0;
> > +
> > +				if (!cfp)
> > +					return dt_set_errno(dtp, EDT_NOCTF);
> > +
> > +				type = ctf_lookup_by_name(cfp, "struct mm_struct");
> > +				if (type == CTF_ERR)
> > +					goto err_ctf;
> > +
> > +				switch (idp->di_id) {
> > +				case DT_CONST_TASK_MM_ARG_START:
> > +					rc = ctf_member_info(cfp, type, "arg_start", &ctm);
> > +					break;
> > +				case DT_CONST_TASK_MM_ARG_END:
> > +					rc = ctf_member_info(cfp, type, "arg_end", &ctm);
> > +					break;
> >  				}
> >  				if (rc == CTF_ERR)
> >  					goto err_ctf;
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index 6e74b4b0..a1a39f3f 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -3300,7 +3300,6 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >  	}
> >  
> >  	/* built-in variables (note: args[] is handled in dt_cg_array_op) */
> > -	/* Special case for arg0 through arg9; encode as args[n] */
> >  	if (idp->di_id >= DIF_VAR_ARG0 && idp->di_id <= DIF_VAR_ARG9) {
> >  		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
> >  		idx = idp->di_id - DIF_VAR_ARG0;
> > @@ -6661,6 +6660,13 @@ dt_cg_subr_inet_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >  	tnp->dn_tstring = NULL;
> >  }
> >  
> > +static void
> > +dt_cg_subr_d_execargs(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> > +{
> > +	dt_cg_subr_arg_to_tstring(dnp, dlp, drp, "dt_d_execargs", 0,
> > +				  DT_IGNOR, 0, DT_IGNOR, 0);
> > +}
> > +
> >  static void
> >  dt_cg_subr_d_path(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >  {
> > @@ -6758,6 +6764,7 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
> >  	[DIF_SUBR_INET_NTOP]		= &dt_cg_subr_inet_ntop,
> >  	[DIF_SUBR_INET_NTOA]		= &dt_cg_subr_inet_ntoa,
> >  	[DIF_SUBR_INET_NTOA6]		= &dt_cg_subr_inet_ntoa6,
> > +	[DIF_SUBR_D_EXECARGS]		= &dt_cg_subr_d_execargs,
> >  	[DIF_SUBR_D_PATH]		= &dt_cg_subr_d_path,
> >  	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
> >  };
> > diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> > index 07d22afd..9ad4f5e7 100644
> > --- a/libdtrace/dt_dlibs.c
> > +++ b/libdtrace/dt_dlibs.c
> > @@ -89,6 +89,9 @@ static const dt_ident_t		dt_bpf_symbols[] = {
> >  	DT_BPF_SYMBOL_ID(TASK_TGID, DT_IDENT_SCALAR, DT_CONST_TASK_TGID),
> >  	DT_BPF_SYMBOL_ID(TASK_REAL_PARENT, DT_IDENT_SCALAR, DT_CONST_TASK_REAL_PARENT),
> >  	DT_BPF_SYMBOL_ID(TASK_COMM, DT_IDENT_SCALAR, DT_CONST_TASK_COMM),
> > +	DT_BPF_SYMBOL_ID(TASK_MM, DT_IDENT_SCALAR, DT_CONST_TASK_MM),
> > +	DT_BPF_SYMBOL_ID(TASK_MM_ARG_START, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_START),
> > +	DT_BPF_SYMBOL_ID(TASK_MM_ARG_END, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_END),
> >  	DT_BPF_SYMBOL_ID(MUTEX_OWNER, DT_IDENT_SCALAR, DT_CONST_MUTEX_OWNER),
> >  	DT_BPF_SYMBOL_ID(RWLOCK_CNTS, DT_IDENT_SCALAR, DT_CONST_RWLOCK_CNTS),
> >  	DT_BPF_SYMBOL_ID(DCTX_RODATA, DT_IDENT_SCALAR, DT_CONST_DCTX_RODATA),
> > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > index a0205887..c8208de6 100644
> > --- a/libdtrace/dt_open.c
> > +++ b/libdtrace/dt_open.c
> > @@ -138,6 +138,8 @@ static const dt_ident_t _dtrace_globals[] = {
> >  	{ DTRACE_STABILITY_STABLE, DTRACE_STABILITY_PRIVATE,
> >  	DTRACE_CLASS_COMMON }, DT_VERS_1_0,
> >  	&dt_idops_type, "vmlinux`struct task_struct *" },
> > +{ "d_execargs", DT_IDENT_FUNC, 0, DIF_SUBR_D_EXECARGS, DT_ATTR_EVOLCMN,
> > +	DT_VERS_2_0, &dt_idops_func, "string(vmlinux`struct task_struct *)" },
> >  { "d_path", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_D_PATH, DT_ATTR_EVOLCMN,
> >  	DT_VERS_1_0, &dt_idops_func, "string(struct path *)" },
> >  { "ddi_pathname", DT_IDENT_FUNC, 0, DIF_SUBR_DDI_PATHNAME,
> > diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> > index 038cf69b..e9d50349 100644
> > --- a/libdtrace/procfs.d.in
> > +++ b/libdtrace/procfs.d.in
> > @@ -179,9 +179,7 @@ translator psinfo_t < struct task_struct *T > {
> >  				   : (struct tty_struct *)-1;
> >  
> >  	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >  	pr_wstat = 0;
> >  /*
> >  	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
> > new file mode 100644
> > index 00000000..c707184d
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The argument to d_execargs() should be a (struct task_struct *).
> > + */
> > +
> > +BEGIN
> > +{
> > +	trace(d_execargs(1));
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
> > new file mode 100644
> > index 00000000..0e9cda07
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
> > @@ -0,0 +1,4 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
> > +	prototype: struct task_struct *
> > +	 argument: int
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
> > new file mode 100644
> > index 00000000..ba419689
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The argument to d_execargs() should be (struct task_struct *).
> > + */
> > +
> > +BEGIN
> > +{
> > +	trace(d_execargs("a"));
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
> > new file mode 100644
> > index 00000000..ac1c1401
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
> > @@ -0,0 +1,4 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
> > +	prototype: struct task_struct *
> > +	 argument: string
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
> > new file mode 100644
> > index 00000000..473e35e4
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The argument to d_execargs() should be (struct task_struct *).
> > + */
> > +
> > +BEGIN
> > +{
> > +	trace(d_execargs(curthread->mm));
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
> > new file mode 100644
> > index 00000000..842371a3
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
> > @@ -0,0 +1,4 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
> > +	prototype: struct task_struct *
> > +	 argument: struct mm_struct *
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
> > new file mode 100644
> > index 00000000..86b1b237
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: d_execargs() requires an argument
> > + */
> > +
> > +BEGIN
> > +{
> > +	trace(d_execargs());
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
> > new file mode 100644
> > index 00000000..a4fcd162
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
> > @@ -0,0 +1,2 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d: [D_PROTO_LEN] line 14: d_execargs( ) prototype mismatch: 0 args passed, 1 expected
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
> > new file mode 100644
> > index 00000000..3add63f6
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The d_execargs() subroutine accepts no more than one argument.
> > + */
> > +
> > +BEGIN
> > +{
> > +	trace(d_execargs(curthread, 1));
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
> > new file mode 100644
> > index 00000000..f5a982ff
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
> > @@ -0,0 +1,2 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d: [D_PROTO_LEN] line 14: d_execargs( ) prototype mismatch: 2 args passed, 1 expected
> > diff --git a/test/unittest/funcs/d_execargs/tst.d_execargs.d b/test/unittest/funcs/d_execargs/tst.d_execargs.d
> > new file mode 100644
> > index 00000000..b8b141aa
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/tst.d_execargs.d
> > @@ -0,0 +1,31 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: d_execargs() provides correct results.
> > + */
> > +
> > +#pragma D option destructive
> > +#pragma D option quiet
> > +
> > +BEGIN
> > +{
> > +	mypid = pid;
> > +	system("/bin/echo TEST");
> > +}
> > +
> > +proc:::exec-success
> > +/progenyof(mypid) && d_execargs(curthread) == "/bin/echo TEST"/
> > +{
> > +	trace(d_execargs(curthread));
> > +	exit(0);
> > +}
> > +
> > +tick-1s
> > +{
> > +	exit(1);
> > +}
> > diff --git a/test/unittest/funcs/d_execargs/tst.d_execargs.r b/test/unittest/funcs/d_execargs/tst.d_execargs.r
> > new file mode 100644
> > index 00000000..d8ff6689
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/tst.d_execargs.r
> > @@ -0,0 +1,2 @@
> > +TEST
> > +/bin/echo TEST
> > diff --git a/test/unittest/proc/tst.pr_psargs.d b/test/unittest/proc/tst.pr_psargs.d
> > new file mode 100644
> > index 00000000..902ac1a3
> > --- /dev/null
> > +++ b/test/unittest/proc/tst.pr_psargs.d
> > @@ -0,0 +1,31 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: psinfo->pr_psargs provides correct results.
> > + */
> > +
> > +#pragma D option destructive
> > +#pragma D option quiet
> > +
> > +BEGIN
> > +{
> > +	mypid = pid;
> > +	system("/bin/echo TEST");
> > +}
> > +
> > +proc:::exec-success
> > +/progenyof(mypid) && curpsinfo->pr_psargs == "/bin/echo TEST"/
> > +{
> > +	trace(curpsinfo->pr_psargs);
> > +	exit(0);
> > +}
> > +
> > +tick-1s
> > +{
> > +	exit(1);
> > +}
> > diff --git a/test/unittest/proc/tst.pr_psargs.r b/test/unittest/proc/tst.pr_psargs.r
> > new file mode 100644
> > index 00000000..397c8717
> > --- /dev/null
> > +++ b/test/unittest/proc/tst.pr_psargs.r
> > @@ -0,0 +1,9 @@
> > +TEST
> > +
> > +             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
> > +         0: 2f 62 69 6e 2f 65 63 68 6f 20 54 45 53 54 00 00  /bin/echo TEST..
> > +        10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > +        20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > +        30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > +        40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > +
