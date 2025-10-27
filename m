Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D886FBF
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761590082; cv=fail; b=ZW/bkrZKtRoDKjUH2VNAaPGPWoiZVZE5xmlWPUUo3e2STumqZtXFRH6BHM6QnNKsobf6IWEJsVpa1c5ReWBRwqWmh+jS6WwsUYlVRSJnNIwzFQXo2RzJbjmhMDOp/XrKeSvWrJGlLh2MGnuBloynPwrdi0OzEaNON3kYahjXNrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761590082; c=relaxed/simple;
	bh=wDQLfq1xYp+Dd3Tu/fA51JRyPUZsHZ9Ekws/M0rkkeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K1Z2M99pu0ZZ0YgHrRiN7kcjyJcfd2dtDxr7Q+yKQ8vE9Af3AXoC4G7wQU52uR/hM1cOFrdlcrQYoCJKsJquBXEwyWkxdhrZZ1UWp0Y8LdnaNioinIUosqQpzb3PdBS3m3CoaHnlEMGKbmioE2whj+ggd1jnqOg75BPhXiaDiac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JvQya5t4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tjqqk9OF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JvQya5t4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tjqqk9OF"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RDYCXe028569
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Osfi0fyGTbeHoDjfTo
	cGhbPV76Cl0a/CaC1Fbli0R54=; b=JvQya5t4l31aixj/mLSpYorZJmsoknzIGZ
	sHyV0tQGNbFNANw7hWHDNUJ3jMjAG9h1JKnlfqAkyhXCwVdXq/qJC/Hr47lFsvY6
	DVsorstmkdhBUF2QUq8VFh6LeJwIKXQ929ISkyBsBveuWYeBs/kckT26vspYlGWe
	epEhHQcwa9DFId6XvC+KpO7yY4SIv67xmAKE7dRcQqCMi6DIuFLk41lGbLfdhUVb
	7wNBMk7MAA/4HtZ0xuIKSPW4kN4nuyXhqHjrRD1ztlKkDg2hy12xjj/V1vjiG0dL
	yv9N3uZDAKx5pcYEl8aWTSb/EhvGybuC+hjVbYAsb5xreo4klFTQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a22uu9p9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:34:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59RI563v034922
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:34:38 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011059.outbound.protection.outlook.com [40.93.194.59])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a19pejhey-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:34:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqdgO/LU4hp5Ei/hxGWCAzeVwx+F2s1LNvD9xiAmQOURG0ONbcKVG1o9vDYzC34jHELlPSANzuAopRspKRg39ITIirvTyKqJ7ScROdHA/H+UIbeIo9nPn71cR1dxRsT+By/jwFzyKywDrs+/hiyShrBgJgw7znRuuqSK34/5Fjrh+CUb+PbfwKguYY4CZKFWvbAd7HuQdjWbbh7pPB0awh1mwRqJHIT1PSLpeYdsuY7IrLrcOTAOQI98AsIV4pnaCpFG9hZxfSlTpb+NqXeqEhgo+8abko8K7llpyTOY49dVGo0HxoxaEZbVNn0mj4Zyc/5xaefnyRgmwMcPceVwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Osfi0fyGTbeHoDjfTocGhbPV76Cl0a/CaC1Fbli0R54=;
 b=iEl2pXWee12dCZfniZS2dMGdbpCMzrwAKzTcrkx1wcEjvFQC1qhf8lnRiUxEgE1BwoNPCfk1g8a8OZYQ9CcJ5HtNxjVQ8NY90i3wtvHYiiRjnBaEDlJVHiXkIM744+zx2YjxLDBhRIhs+MGI+gzT1WesNdUzQplbB5pKqdmNuf8jC+69QdnjbojUj2FNuaZRJp9NosfpROPZnDEbBXuMXLv8Gzz55h0I8uy5Y3RqhXbX1VjEAPDaRd+NlX3d+9LPwFcn5D+IBMOAoXT3blrCScP9NGSjpzsAtfmg32J531IjkPm0Ix33QzkaCm2Kmvb7dG+EbgJTFikDRGu9KJ48xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Osfi0fyGTbeHoDjfTocGhbPV76Cl0a/CaC1Fbli0R54=;
 b=tjqqk9OFfnJkUGGtqiFTqsWOP61ZLXLOBV6r4KlqtBiMHOXf1A3jlw93VYSWrbDxj3L8NwdYK91/wogBlqvuzjpjVFsocuyzRQSkaoNMLmbrzD9swYPlL2/oBOv1Z2XMraOvyM31H+QXAsk9BeE8uEY/N4ybXogAHBLVXkjqjgk=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by CY8PR10MB6657.namprd10.prod.outlook.com (2603:10b6:930:55::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 18:34:36 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 18:34:36 +0000
Date: Mon, 27 Oct 2025 14:34:33 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] Add more Orabugs to dtrace.spec
Message-ID: <aP+7OYKTKx83wY6U@oracle.com>
References: <20251027182538.20466-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027182538.20466-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|CY8PR10MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 63be0f1c-88d7-489d-2b75-08de15877afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+dF+umNpc331ZGweFpxuPQjdi6Xls8DFMA9oypun+/CbJ4gIZBNcMTb/Dj7p?=
 =?us-ascii?Q?hZv4ZcaqEe51zF/M6zRgw3VqRBnQa7hNTFRm5PH0HGKRoDy46kd9UE/FYEe6?=
 =?us-ascii?Q?6Hh6Uh6rS8Z2/0tWIk7sTtQ/Zuc2M6q1wpmg/Umx/jr1tuhEE92PJPcN1arT?=
 =?us-ascii?Q?9CMpUeTQOsUo79B4Psrc5yDfTpzNmz+Y1msEAMl054bzjis5wiL+X1knzKIn?=
 =?us-ascii?Q?+YxA4Xk/ZV4DWf7FI42KPTYAH4abD9zk1IIc5l05L1Zgt8Dj4kbJOWHKUese?=
 =?us-ascii?Q?yaoSPNFukKINxttBrYHPu/5x2iYHJtiCe+nAiNlkAWMLQF6ESJO87QpEKXrL?=
 =?us-ascii?Q?HCb4SGMdGKehroDoI4C2gBWi8E04VIFmYnPpPXus82G3Y4cPOWg1DkjLVMfr?=
 =?us-ascii?Q?aGzNsKoGj/+QXL1pyOWvu8+ZUdWotMwK7c/AG/jqW1JRgSTaQpj3AMQqmpWR?=
 =?us-ascii?Q?Oa2Np4UaALPmghD99TMgtoOWS/ONtcL3pmnXrvTOSyD6MwkvvYstsPwKx4wY?=
 =?us-ascii?Q?v83gAT1utEpuKHlAtoJ661YWlbKq+GOalDHIE4t3w/DmsegvqnWr1IlqiJsl?=
 =?us-ascii?Q?/XVOZs9TPwW+doThcN2jxGtobvADNqSHIQtmzH4kEJ73ROrJfz/81Q6vMPOj?=
 =?us-ascii?Q?784cygwmnuq1u+DJnG9wtcp++JR9u1vI4jQXSIwjiEeuP8bRhKW3FEGe+//1?=
 =?us-ascii?Q?DsqebA20HsFG5IgzPSHoaCGLQXnIVgZ51B6WdgQqhNdRYoWLOmBk4PbnxjI+?=
 =?us-ascii?Q?Hrq3EoA8uMoEjWp5z61Ro7lmPINsnB7YeVQloReDVJmbSP7su4wUe9bJgQdr?=
 =?us-ascii?Q?PFlQrz+RXi1lVs3p/HVgSS0iI0yFMCxVFijfeflwwwOJXPgIUdePQSfc/RIw?=
 =?us-ascii?Q?KKzAwdKLWCZTb0WxjbYelAo/Zd/VkM0vdCSSCWHPoYqrvlKxkKC8yXGNG/iS?=
 =?us-ascii?Q?0ovmQhGAFUMQKGgnZLHeM1J9NZF3V2fvjknw1cMuEKLSq469iioNFS6FHgkE?=
 =?us-ascii?Q?IxK3gvucgZzqaAwq9wMx0aTYWtSZcCCV0Z7iNIpKPGbLEpn7FrnEsHN1GMVP?=
 =?us-ascii?Q?NYwRXpjOZuBjkMjkVXAU38AHRTkz+mUZhqUN2B/cAqtBKdk5b4pnbivRJSZK?=
 =?us-ascii?Q?ziOlWF5+NGPvEq736xHtNH/gHryGrNVTc46HRjzGRuD39PHge74TcvrkLxkt?=
 =?us-ascii?Q?Yl9K8dKEcBUlarDZICFu3farKaKzLtYbJz65HVA4aWXup7MQeBV+VC48JsBJ?=
 =?us-ascii?Q?ELIYisMCYWdhpzPI5a1A0bQ1bmqDFioFZBmyam0koF8m0mdyqL4s+cjk2Dm8?=
 =?us-ascii?Q?tVa7HOJwUKTZXlFkT3VzmwRu2DbPU26nzSVlcUu7T/d+tEpGoS3tXnrsUz8W?=
 =?us-ascii?Q?wIt3/x41bvMiUMi3D0udbXCJmeMxq6iny5zAFdpMX18KrN/QoUStycgWZq5S?=
 =?us-ascii?Q?xs5gnGgs04HICJaBhZRKhuKBI1M+0Op3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2a8K8N8EJCsFdlWF6Zvvn/9Sa6pw96X4EbFpnYggNSl3Yr36T3h3/VTiUE6G?=
 =?us-ascii?Q?xbZ/FyPYtHGdXLDO+K43mRSOii9IaRkFnVtnhlHDvVUkmzSIL2I8P7T50s0w?=
 =?us-ascii?Q?NrE4yLXqdfCjCA2kW+86sDIEtIbLuBp5lvgsajWZ+80sfbBpabROqLEp4eMK?=
 =?us-ascii?Q?NiqM5v3+QBlvdtNOQwKvP+wN3FMbUR6gyGO8iKPTwgod9cqlcDfxrPuerK+y?=
 =?us-ascii?Q?KCJpdiDLHPzf1V7xEYhR5gj/Du7uhZAy/fTvxxSpnOp6d4apMLOs7om1KhJD?=
 =?us-ascii?Q?RZzWHPNg7p7gh2sYLu2Q2V8fcDQCQjY01CMiIH3SdxJGTVvwmEAE0DQOy5s4?=
 =?us-ascii?Q?9vofS/p567NHYYzMYfZOAN+o5qQ2nrdbbMrxfojzTbFOBRXttm4Nnqu7nwNM?=
 =?us-ascii?Q?56gPKhmn1yRIR4rVI1NjqhJz7di7ZL846G+FJi37HNrpMV5qnphvF8L8oNX3?=
 =?us-ascii?Q?/NQaPV54ySFrOM3mAJKfSdoaGisWR59CVD5z2tWqzWZ1KbY8CZABmTlRvxZi?=
 =?us-ascii?Q?4i5O+/QPm2iDN+JnsLw3QhWVdoiACyS2izZ4muNClvtA8Bv9uHkT+/YSdSE3?=
 =?us-ascii?Q?6FtOKj03rY5DRdeTAcGyteUtlgO89FsjueH7FfD6faxcO0+Py1e7V4dXkcRH?=
 =?us-ascii?Q?rQpuKVtcOV5gxEgjgtiM3Z06HpQyPcGsPeHhPUqCddosCpT+pRmOzYBCHw9R?=
 =?us-ascii?Q?qOlt9dhd26nk8DJYw2qGELUu5dUAwRRM2ngr9Kqb68+8EYojV0b0XEpYpBQ+?=
 =?us-ascii?Q?y3h2HoO0YaeueMyRRFvUWXWXy7+22Bsg5GlyRp8sOuLGahdo931slhq3BRBn?=
 =?us-ascii?Q?AXOMzgwrpxaEELeMIIBIW+/1se6YLhylFBXF+a0tVgeThuazeqFNROjU8UhS?=
 =?us-ascii?Q?uePo/Q4yylh9PzYCloFTjJMw/7UEBeRR7vL3ePq8WoA66D2+lTfaJe0bczoR?=
 =?us-ascii?Q?NWqVB7EKl+c4IoPCd9XwJt+cKLgG+EJdPmVfvUxQr3nQiJdDm/2OAOlEep16?=
 =?us-ascii?Q?MU3MTZdSLfY9MSB306zihszXCHMzg9kWq3NpbZIx3BfpGFMZ2Oma0olFFRPs?=
 =?us-ascii?Q?DuL4lMtpHEj6WUpqou9pyBBEsYpJxMV0hqnzAnTPsQDrCnE/mZnt6Wa51rI8?=
 =?us-ascii?Q?Uxz9JynU8wSrIVrP5O0gfQAewjqN6YD0Jcn3SrGFxhTFwgYDm++CYf4Qq5Q0?=
 =?us-ascii?Q?bie8G5x8bL4yCvK731tah3uqDYdE2f62UwNp05Pp+N3dUHbnqQE6H4H7DRae?=
 =?us-ascii?Q?VU9K4XQRSecy9F7oDQB6z/b+J4nnQkX4tEEFIbueOpJTF7dMi3MF4IG0fXSM?=
 =?us-ascii?Q?vq5d8lJZaNdMPYaah+hnwTVnAMfVx0GHzhIckgbxfWgjUZErcvnfxMBTONQ6?=
 =?us-ascii?Q?AhhpCyY9RQDJsqtpR7S2mwQWb6sTYHwfswhvAkw0yUbAa+Wq6jFtWNVLa4UZ?=
 =?us-ascii?Q?LPi/9t/NnR+EvoTQrlWjPBLZmO0EJTYl/uCId0gL8XMpN1CK3z8yytDGHTtX?=
 =?us-ascii?Q?ZBlAtAqjFHfJ2ruQ7LoJgnYuxKfm14eho05F5z6BHiLrchrluqda66N1uyJe?=
 =?us-ascii?Q?/5LCetaRUPn6A6lz9nD/twgHeIE4oI8xKK6LH8pCqlX6pbSWlX/Op+Jpsocg?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6zhg9y/utvmDWxS18WR/BWS+a+Q/+xNcKOH+wnhzWJmNpy2jZ+IMuL5jZrNQSFsVmetIojWDIqw5g1UHr7Sl/UvuM97sBdmufkbEIFZtOAnLNHdfYMCGFccwU1CmXz1NaUkdviSsoeRvjXNu14r1IrvGKF4ftJq9PORu18ckA8/6hOf1P9UDWRrvazombtEmHEu+6rCISDV/OfTnYIZ+k/Dxn/bKFheiy+AOS3gW92OCTlCxiOaMT4HfLPLemb9eh0cryiI3PyvmP7lBv1zIjIig4jj8gbpj5LJUSX+NR7DbB6TcPl8G7G3U8b79V5HSlxBh8p7VIkfut1xNgtO8/95xykxlVUH+h9WS2+YSL18dKMmCdSL8ZvR1mZpsVbWVBVq1f3o+SBUNbg1WJ1Nln9gLemlGszEQk4vU8bziyd2RiE8ZFwUWWnD/PYQPkWJImUXxuomluh00mBIHSaiWHYbklvecFxAs4g00c1gP2j/XU5fXt+AQx3TgMsbSfPbENtnmpNgRMZC09s+Tl+qy+Q7HpcDG8zNdHBtL79TbpNjYaVLotFqlTmdJ9FL798jI5AFp0+JrPPCt4l1Xk7p50W+JbXmtYtqH8Z61nIolaoE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63be0f1c-88d7-489d-2b75-08de15877afb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:34:36.2942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4iOFH/O34AbYMBknn4KNuQrEWop9v9Wsvr0NufExa4gvJiOYThjIwQNn+Ozf0X79BfCFA3lZtd/v9jRWVwGbJVswkUImRV5USnT3FOto9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6657
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510270171
X-Proofpoint-GUID: GrafzeStTmEhQ63mkf55noP9lzX4EDWP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA1MSBTYWx0ZWRfXyEhdyc2SqKWZ
 bGSpD/CVRc1dALNdMgtUfPHlqUurivYg7Wzf8o/gVumeDwYjdNV85CXTqXFDtj69CAdFUXoM9V0
 rRmLVlCUuMWV721k1CoXe3UsismZFKFsKft6KNB4Cl57Vpp351R9sFU5GX8b0zuOUOimXt2esUq
 /q0vbTeZ0UpWotZPEtF0ppWhqo0BhdxLJxDP5F09cfjJNffe5VYtxv0WobNQbB5S+BR56vNhDym
 XTNZMRE3rErUBqaY/P/k2jtwHfNQWmdH2hU43kguHV0Jeo+TGK7t5e81eVlex+C/7l3szG3WCS0
 oWciPdfe5qx78RhADdP1nsT9Yuw0mmUxCiO4OTdoLfn+h0s0svSefLaD+hTZRsYcRxyhMwrur7m
 DJOfWEUmOH1qsTaEmq1RA60eR9ZZBDr4T2F30ktlp4bJjnLg/mg=
X-Authority-Analysis: v=2.4 cv=Xe+EDY55 c=1 sm=1 tr=0 ts=68ffbb3f b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=Om7m1Up5985In2Y_69QA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12092
X-Proofpoint-ORIG-GUID: GrafzeStTmEhQ63mkf55noP9lzX4EDWP

On Mon, Oct 27, 2025 at 02:25:37PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtrace.spec | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/dtrace.spec b/dtrace.spec
> index 21a370f5e..0905763fd 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -241,8 +241,12 @@ systemctl start dtprobed || :
>  - Error injection via return() action.  (Kris Van Hees)
>  - Improved string handling.  (Kris Van Hees)
>  - Various bug fixes.  (Eugene Loh, Kris Van Hees)
> +- Fix dyn vars overwriting one another.  [Orabug: 37994729]
> +- Fix regression:  list fbt probes by default.  [Orabug: 38249511]
>  - Various testsuite fixes and improvements.
>    (Nick Alcock, Eugene Loh, Alan Maguire, Kris Van Hees)
> +- Add test for preprocessor definitions.  [Orabug: 28763074]
> +- Fix some stack tests.  [Orabug: 37459289]
>  
>  * Tue Jun 10 2025 Kris Van Hees <kris.van.hees@oracle.com> - 2.0.3-1
>  - This is only released on OL10.
> @@ -333,7 +337,7 @@ systemctl start dtprobed || :
>  - Fix dtprobed to support DOF that exceeds 64KiB. (Nick Alcock)
>    [Orabug: 35411920]
>  - Do not modify input files with dtrace -G if unchanged. (Steven Sistare)
> -  [Orbug: 35417184]
> +  [Orabug: 35417184]
>  - Various testsuite fixes and improvements.
>    (Nick Alcock, Eugene Loh, Kris Van Hees) [Orabug: 35435195]
>  - Various code improvements.  (Nick Alcock, Eugene Loh, Kris Van Hees)
> -- 
> 2.47.3
> 
