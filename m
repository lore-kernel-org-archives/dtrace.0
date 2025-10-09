Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2CF15E90
	for <dtrace@lists.linux.dev>; Thu,  9 Oct 2025 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760029425; cv=fail; b=jkQimGS1m5/7Ze21wHHi5l9Zmi6NrG6kx4RBhepiO8xEPYb68GruEln9JBx53ejs1HWH++EWXf+3vxVsomGPtBQIQd+dsbEX2v+NW/50O2WvyFjBqMxL3hjs2r80fEGG0C4/rkI+3w/5Qlwn1iToezkLkbsEQ/rg7DIgSi9Y3GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760029425; c=relaxed/simple;
	bh=UAN4jiyUJjhAZ5YAsnOm4tlqEzq0oseXpc5349q8tSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ioBQ8GWkc02rbV8sPlIPByJbMcg+kNzviuUeAov7DkJccuMXKn7ZGVKO5N95Q1Wkosn9LwQmBHBHXi/V28/Z/lhihLEoRtE28ykFeONKB8xYiy7eQPeXHIIGjqDNvZxiIcrX3gdCtCgF+PnbdPN9ctSm74EkAcqayu7jDD7M2GQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NRpVLPbx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jDtbromF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NRpVLPbx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jDtbromF"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599GCH4R005561
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 17:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=frXooAlfqhQexGwBmE
	hvcdC0C90TEtaUozlSOSlAFc4=; b=NRpVLPbxtZFvdYVJOS/vbAo39XxGtyLaZq
	sSYOG3n1OC3dEvhhczGKIEvEi22qp4rZXDj5PRLDc5O1Jef/mVCoiyTMQni22k2t
	W8KNgPFN/EW2rYHf9Dksqf+fv+pw0kp4d5/pGXCIukTJJ5pFnLBmQTX1TZYY/0G6
	rdXSjqj6xnJ/A8I3EBYbPNpC8i4ZNuV3378JxIpUj/LefEKHxl2r9EdH2Y2xrVjR
	LOocaGCnIy8SkwySDcUf/s2HVP0kZv27X2jH4fWtr+73hXc6ds0eruP6yL06yqVO
	ZiDnWtcIBHiLkb39UCSTIVIkYtdmpHkY+U0CtU2PbSgwmBu1rO5g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv6d23jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 17:03:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 599FKTcT029035
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 17:03:41 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010007.outbound.protection.outlook.com [52.101.201.7])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49nv6870yt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 17:03:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioi4TtFE3RQaezSNwa8i10/JtwP11ABlGvieg34sQ1TBIp2sAqkEs8VZktFbgTD24lR1exT6njk9uWwzxYe6me1Rzmh2qtnmk0a252QOuk7YrgIy7iEMy2MxVnTtVYChue5GzKfFLJN4sQVCpn2S7bEUJUaGuXS0CP4BR/8lsTmpxaQzChE2pOCY7aFEmAdjWMgI/nvUtLzevxBfQFChhrGmajwKNmNFs7Uh/yHiSCts+V3y84nlYON37dNbvM76x2hiF+LUUn6G/OjH35vL1Hlkq9jtBTQ86FihlKRtjrnVTkcNx/MEICzktLbx1wctA4sphSrxUd9HbS7KmeaTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frXooAlfqhQexGwBmEhvcdC0C90TEtaUozlSOSlAFc4=;
 b=ghZoJiyc/QpLlmoVRQ3wtmHYgxffX8S+8cU4dz2g7+AF3dr+wA4QtGY7nAhsTYqSW1Sq9R1SiYinPI/1+nay+pddBEBvWg28CdHYJHOf5mLeNWs58XxwzyFVYJPtzytM/I9YzS2ooZ9zySaakZ5+1jDNvxeJqp9MGpeoolWNWbdBkWydcL4u/6vjLo/chhuYi2xuqeP9JCVctqSrXwFanCzFKFa3YjzRj5vPl8KFVLs6RUtHL++HFUftyoPb4gsK4qZv88bYQoDUFcM1Cu+VZtJ27VhaGr7WdDwGq1FzkHWMRhXhuIFMfb6XmIZKGJ5WpNGXn4A3wFlq8DD36h2sJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frXooAlfqhQexGwBmEhvcdC0C90TEtaUozlSOSlAFc4=;
 b=jDtbromFOdHcLLtsjLcOp/1f4ZDTgi6twy09E7G2yg22S28wcMGqtqIuhvdg8RxFSvg5Vm9Y+02Wk78cVmNsoIztsev4Y2vCCwoYggLhsVYCDiSLQQkOcbGQnvk7N26aP8WcJd0fF/KH4fyfkSDhUF+V01WauDurZ1/JBirG3pY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CH0PR10MB5004.namprd10.prod.outlook.com (2603:10b6:610:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 17:03:38 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 17:03:38 +0000
Date: Thu, 9 Oct 2025 13:03:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 17/20] doc: Add IP provider documentation
Message-ID: <aOfq59B41hE5uas/@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
 <20250926190557.8485-17-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926190557.8485-17-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CH0PR10MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5e2119-a7ef-463d-8ee3-08de0755ca11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?50qD7z3inKJPiOecQD6zt8l3QVwKzb2Ht0wdhWJgFUdFMKWVOPBGSree1d6h?=
 =?us-ascii?Q?uyqUBhYE6XbnmbyZ5bHJV4mrKXDMh+GmqG61BexvpDfey12m8raJ3ynb5G8a?=
 =?us-ascii?Q?Mn0fCr3xlPqpidx5cZJdDxw0vw707wnQA+sLSE4dK82KIL7/K8NTTPBukPur?=
 =?us-ascii?Q?llpnE+b2sICV485CBIr8QZSk6D2dQkwSjngA8MFpk6LRsm2Rx24VOE92z06z?=
 =?us-ascii?Q?mg3n/ddlR1mCkc0AHQKfAcgvpKsStsmsCrdImd2gnBDJ7GNYFuJVonA1Z4lZ?=
 =?us-ascii?Q?aH/pNCZOpLYPkJ59Njcx0Q/Ddy0eC8pDcBr5H3T3tGhA6Yq0FHvlEHiKQP2D?=
 =?us-ascii?Q?GFqh90Soljtch42EhoEn5NEUZPkKa7XQyy1n6vi6Nn62Zp5QDZY87AqY2HdP?=
 =?us-ascii?Q?cPUBS0TCzqg3SfE7T4m+t6tgHB+wsTsKt98KKOnNQei8+OZjj3oFrvQucQhi?=
 =?us-ascii?Q?od4wH1K5EKzeYEWEAPLnHbkTMTQhtuJnpW1QCIbTSCHkU0SRuslV/Z0uebRm?=
 =?us-ascii?Q?uYgp4i/JkpcrKUpDlXvPhyHYaC5lisNQdSfjcUlBJIdCxsfCVpaqP2pH5ntd?=
 =?us-ascii?Q?mMq9JygoJNBu6smBK+q6yBXS3Iop1H+DLf0B+NcgX6ac96V4p8/uykv9K5sj?=
 =?us-ascii?Q?7UxixGOGvjaifmMwnu/RPGE/t+/DJMdhf0a4V6ybuJjlA6XPzAgAJ5Wu/wnu?=
 =?us-ascii?Q?3iQTmLUSG9Riy2BTpafDli8B2j3lWTnyuZu86RVCWMX/uiJ1ooG0WBzVNTU2?=
 =?us-ascii?Q?nf2CYmRh3V1EPbonYC579vLK4yqKPYcSQbJDfk20GiVX/oVN1K4mjS3TN3kz?=
 =?us-ascii?Q?x0Q8yq++wxv3+8rNY+jE5ykVwH5sOYZGJbHVLR7PiEgHtumKZ+yoHss4NosB?=
 =?us-ascii?Q?fwolFEOpooV7x45sfdTE/VZKYjEhqOeMwqGKgmdENnWXrS7EB6ZlRyssaE8a?=
 =?us-ascii?Q?Wb3dzAKqTgwuNVlNZLbsY/9ZG5dj+2PEcpVQXLPnwEO07O9bezes8n4Pc/en?=
 =?us-ascii?Q?vxM83JbbB3XVql4Hr5kYgRPiXcT89yFC1zTibcENIjh61WXBfdRcsthtj1vJ?=
 =?us-ascii?Q?t8aNAMqzKd29HJGZLXkx3flSFX6uPMm6qXeT2BE/5vVzgUhQv7k21+q1U2md?=
 =?us-ascii?Q?UuD7B/9tGHS5IXcWTmIzQLbxUy8m2xp2+VZqWaxZ7jn88Xw2iFsP7QpqxLdy?=
 =?us-ascii?Q?cJ5+Koa5IfP40xvYcXVh5nZXbAeeLIDHZ/5D2RVabi+WUM/wlO6f6sBqGjn/?=
 =?us-ascii?Q?E1gXA0UBx4UyTip5CNDY6XUksjbpMm4mDzcWuKjQH20J6CGf2+qm2dzwxAOq?=
 =?us-ascii?Q?Ue1ZNfu9VJeDj8he6bA3+LwYrCXtvpiljg1WtmQ10Fixn+uCteyR2JTPGFLX?=
 =?us-ascii?Q?IG8iwy3H1y+6Ur4yNwtAAhhMPBYOthcX4gA8pBlgXluowc6AKDEWh+nKk718?=
 =?us-ascii?Q?sdw3mh5uW1TF/Qnx9+O0MJpK2c+b1qYh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zckdwgs4Cx491Mx9JUj5JkKhnVmoWjUnXER7MM8hRCJgTNGeNMzIg+ZbYjHT?=
 =?us-ascii?Q?FjYn3RnBRblZgq8RF/l7wl8R+bSC4CgIO7oz1J5Kry5pYft9pVeerUHP19Bp?=
 =?us-ascii?Q?38wYctKkb3Me/ZmrWALodvVJbUNZywYyXPro+ycbFpPXehZbqWYtDXgiD9Ot?=
 =?us-ascii?Q?ATa8oSLmpz72w+Nct23vXbSgHOIoucnR8lCGBJIsHnGXXe/RkPP/IIxH5ikZ?=
 =?us-ascii?Q?Mx9wA21EFs/neTpBlkAkG37WiMZk+N7yPaUMyW0qLHRI0Qq3NrB4lPetV20A?=
 =?us-ascii?Q?OYw2HgkE1mTmRFySgL6/v0uGreYe2Cnxv2cf8hLVepT6xOojRxpKIEQzZqgl?=
 =?us-ascii?Q?t39YtR2Xqi/Z7s5+jZPIXLQ/w49wwfAFbYp6oRsrw7sFoY6nXgqS5+kxRu1D?=
 =?us-ascii?Q?ty8Fw1Lw8tjsBmLEDNrV+YXXoqOuRbLDwkLfxMIdNireUWdUwbDfYM6Qgaww?=
 =?us-ascii?Q?6tGMHfdzz/ooYaFrtCaRJh0vl3IeUR4YF3yLAJpQwf/qil/5/N+0eBnDkj6l?=
 =?us-ascii?Q?tB1583czqGNdL+IDrE+KmVFgfWzbDzy3PX2LBFTbxZ4qjQUJGkXnja4Bo9bg?=
 =?us-ascii?Q?6P1X8Dd14AHnNKmLAwJfF5wrL2H0V10tF2Q1uTnGEB96fZolDzgDnwR0jd4U?=
 =?us-ascii?Q?WkGc7bn9Ew9s5cnwDJC/YOv0o/PYuKM2A03Hj45wlBtVjvoc7hjuulMdL6Zc?=
 =?us-ascii?Q?fmtcpkbsMXUn0aRiJbwbYlD1EiRe137QdOZD17EapcggF9XMO4XywbmThiwn?=
 =?us-ascii?Q?0GPmQppRSgkch8wTWqBQ3JsAAIQ6m+2QBVisIRJzek5tsNWtGGSmaOSta67+?=
 =?us-ascii?Q?MdbLN82Ns9pPJn1eya2+i0RRLSw1uWgtGuJ3hXF7TEPsRratIRQ/QKxLqawz?=
 =?us-ascii?Q?uGEAUCIWmM2F99TTnhjMVMX0tJ3gyXVCA5FJmLGXQI+0LMxjpnJGgF2or99e?=
 =?us-ascii?Q?HmU0VUbN8rp3Y9fvYEp0YvVa4ogS7TJkimf7XfG/6vU/BygUbfRsRoBzG0D5?=
 =?us-ascii?Q?nIqvbs2XHSAy/m+zH5ow0L/xGzrDj6kJMzlXCJSCu3wjYPcqi2A+ECHgkGKj?=
 =?us-ascii?Q?kzrG/BMVmWPxmm7WEMCWwkgGJus1osdRFqG0lEVdVM2VXH0l4d3VseP6W2kA?=
 =?us-ascii?Q?dluIwNr4PWYdXZRPuVmCkE3FRJpT/Te7lLg3F3bIjFispG6L5YtdDrdm0Okz?=
 =?us-ascii?Q?ApWQEeoifzFwNjYDNqXXWSpw15pzJKe2ESC+gCsBs2l/8YU9KpbIM1J1Ytla?=
 =?us-ascii?Q?brn+hYsnf43ZvxCQ2pY2mKQB2FS47kFVg/53uDKuR/qgLx2yqVezLfhDS3rY?=
 =?us-ascii?Q?uAlvxxkkhKSHWRJmIgAxAYOLS/RezkpJJuHIL4IrdFKPuGWZgQyj3mGGLimq?=
 =?us-ascii?Q?yMJ6MI2Nk3UcLaYeVJSo1nMEqxofs1xy9351wCx+0aYMiXbvHxnwWZ2qeWtY?=
 =?us-ascii?Q?AcSD6wpPt5vCW4e9rP+E8evBAcYhMf2fAOycaxnFLoxSpio+dZwBSgozQvIf?=
 =?us-ascii?Q?cFs94qkNppTW7uWcHpLOoDTu3Q6DYm0CVOT6MAKWgo7M0PtRkDKI7hF4ctmq?=
 =?us-ascii?Q?JVr71+ShbmGI3PqNVm5k0zO43S0C/Ike992pBshZWSiy0JI0hoCbIsLuf3UH?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jD4tkXc9cdo+XySZkWKYPlKTcB+OfZ2ufqiIZYeYF7tjDJmD2xl/AG95qGv3X33DnlpkzRjT1gNuXu47i0r6XknMalu6twnjPVicS8YX9KXrcjDj51DYZboZWN51nRGyRGqp2hl+YgXjSmFPq2KfVLGcn05VFLfXthNzfOixU1aw1r1TLo7tm38PiANSlDsBKszHCUBXgdFeYdTp8qWlpSgijY39i6yQfY9WgWbtWDqMixWW9An9YJ8hDC8sgDbS9vlXpB6AQLt+y4MTm3q30Ce135oD6J7ydcgujBIODjTa1Q4n4uUhcX9AmXmApxBLPQ89WABMx4QGl6Ok0Wx52YlQ00niuAuLA7O+VyNk4E389aBSs7UEOo4B9QRWOzxt6CDI2bw6gP73vyRpasi+nKIJ93qiPnzP3oa7RzJa71kn7vDEIVYKbZvmQiY7LRhC2nuao5cqP0AkgG+KrklNNLImeH7HCrmZqn5nRyL0lnTOgtzoG/mbMKOISKWr923PIWFUfJIUuRyFbuldfGmty5bQKZRvByU2rdnl5jZrHZ0HvJ67SnS0VsdCfv5L/h0vWtvnbCQshJrF/gdWxUkuLSlH0uQN+HdRr4rEI+Zh3Zo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5e2119-a7ef-463d-8ee3-08de0755ca11
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 17:03:38.0156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfZVxHFfr6DhWNeKtfEjRR63rldm3cod8ty/DquSLOYHSHQh8dKgnh3DKY2jTH+gqm6JCn4KnwsJ3bhO3kjFVdvzYXM4shI5EcdNM2gYAug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5004
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510090103
X-Proofpoint-ORIG-GUID: eBRUN1y_oVIXu48olPkwJtVO_-fz5gPY
X-Authority-Analysis: v=2.4 cv=bK4b4f+Z c=1 sm=1 tr=0 ts=68e7eaee b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=e7wD9Ww59sfCT1GHn5QA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12092
X-Proofpoint-GUID: eBRUN1y_oVIXu48olPkwJtVO_-fz5gPY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwUbpWanfJoi2
 m0oiPvt9t7+CXe5yqq9izx7rJyhDLCuBtBVKpakk94BEb6rgxA2PHhXjX3XodJ4/RmtctlF+3jQ
 HCQogjBLp+81utTFxKj6vlMgxHpCgKTeJkQYPP7b+OTq1plKvaD98tI1OMNOgxGJ0FdXyewAMz/
 AVCRuXFv9BMe4i4c3/MMuXiakHfpktk8DQFOgeRcn8I4eRn4uJFg76USWYGR+scFBdlVAis4w9d
 P9dLZYIcKX9wDv4tOQV3ki2OpM67Q0ARZ4ZKTTaf2JhRz5WqtDC4vEkTrW9aMWRdvUSvP1wh8ER
 fgxC591zarmbaGz7/OvE6bExLH6mj4Mc5FQ3jmhehguFqIegun1L6e0pJfO0Dpn8KrZjrnnHuX5
 jnSgvfcJTvydq3YtrdXa7+EWoYWRdwPgrqrlQ2gMh4nGkAom34E=

This patch does not apply cleanly to dev-queue.  Can you look into that and
post a v3 (keeping the R-b)?

On Fri, Sep 26, 2025 at 03:05:54PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  doc/userguide/index.md                        |  10 +
>  doc/userguide/reference/dtrace_providers.md   |   2 +
>  .../reference/dtrace_providers_ip.md          | 174 ++++++++++++++++++
>  3 files changed, 186 insertions(+)
>  create mode 100644 doc/userguide/reference/dtrace_providers_ip.md
> 
> diff --git a/doc/userguide/index.md b/doc/userguide/index.md
> index f3d96a4d6..18b9bcd68 100644
> --- a/doc/userguide/index.md
> +++ b/doc/userguide/index.md
> @@ -208,6 +208,16 @@
>              -   [fileinfo\_t](reference/dtrace_providers_io.md#fileinfo_t)
>          -   [io Examples](reference/dtrace_providers_io.md#io-examples)
>          -   [io Stability](reference/dtrace_providers_io.md#io-stability)
> +    -   [IP Provider](reference/dtrace_providers_ip.md)
> +        -   [ip Probes](reference/dtrace_providers_ip.md#ip-probes)
> +        -   [ip Probe Arguments](reference/dtrace_providers_ip.md#ip-probe-arguments)
> +            -   [pktinfo\_t](reference/dtrace_providers_ip.md#pktinfo_t)
> +            -   [csinfo\_t](reference/dtrace_providers_ip.md#csinfo_t)
> +            -   [ipinfo\_t](reference/dtrace_providers_ip.md#ipinfo_t)
> +            -   [ifinfo\_t](reference/dtrace_providers_ip.md#ifinfo_t)
> +            -   [ipv4info\_t](reference/dtrace_providers_ip.md#ipv4info_t)
> +            -   [ipv6info\_t](reference/dtrace_providers_ip.md#ipv6info_t)
> +        -   [ip Stability](reference/dtrace_providers_ip.md#ip-stability)
>      -   [Lockstat Provider](reference/dtrace_providers_lockstat.md)
>          -   [lockstat Probes](reference/dtrace_providers_lockstat.md#lockstat-probes)
>          -   [lockstat Probe Arguments](reference/dtrace_providers_lockstat.md#lockstat-probe-arguments)
> diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
> index 9f64935c6..54a018d5c 100644
> --- a/doc/userguide/reference/dtrace_providers.md
> +++ b/doc/userguide/reference/dtrace_providers.md
> @@ -11,6 +11,8 @@ The `dtrace` provider includes several probes that are specific to DTrace itself
>  The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
>  -   **[IO Provider](../reference/dtrace_providers_io.md)**
>  The `io` provider makes available probes that relate to data input and output.
> +-   **[IP Provider](../reference/dtrace_providers_ip.md)**
> +The `ip` provider provides probes that can be used to study IP traffic.
>  -   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md)**
>  The `lockstat` provider provides probes that can be used to study lock usage and contention.
>  -   **[Pid Provider](../reference/dtrace_providers_pid.md)**
> diff --git a/doc/userguide/reference/dtrace_providers_ip.md b/doc/userguide/reference/dtrace_providers_ip.md
> new file mode 100644
> index 000000000..4e6c47fb2
> --- /dev/null
> +++ b/doc/userguide/reference/dtrace_providers_ip.md
> @@ -0,0 +1,174 @@
> +
> +# IP Provider
> +
> +The `ip` provider makes available a probe at IP send operations in the system and a probe at receive.
> +
> +**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
> +
> +## ip Probes
> +
> +The `ip` provider provides one probe for IP sends and another for IP receives.
> +The module name is always `vmlinux` and the function name is empty.
> +
> +## ip Probe Arguments
> +
> +The following table lists the argument types for both the `send` and `receive` probes.
> +
> +| arg       | type            |
> +| :---      | :---            |
> +| `args[0]` | `pktinfo_t *`   |
> +| `args[1]` | `csinfo_t *`    |
> +| `args[2]` | `ipinfo_t *`    |
> +| `args[3]` | `ifinfo_t *`    |
> +| `args[4]` | `ipv4info_t *`  |
> +| `args[5]` | `ipv6sinfo_t *` |
> +
> +### pktinfo\_t
> +
> +The `pktinfo_t` structure is an abstraction that describes a packet.
> +Detailed information about this data structure can be found in
> +`/usr/lib64/dtrace/*version*/ip.d` or
> +`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
> +The definition of `pktinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct pktinfo {
> +        uintptr_t pkt_addr;
> +} pktinfo_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `pktinfo_t` from the `struct sk_buff *`.
> +
> +### csinfo\_t
> +
> +The `csinfo_t` structure is an abstraction that describes connection state.
> +Detailed information about this data structure can be found in
> +`/usr/lib64/dtrace/*version*/ip.d` or
> +`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
> +The definition of `csinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct csinfo {
> +	uintptr_t	cs_addr;
> +	uint64_t	cs_cid;
> +} csinfo_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `csinfo_t` from the `struct sock *`.
> +
> +### ipinfo\_t
> +
> +The `ipinfo_t` structure contains common IP info for both IPv4 and IPv6.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
> +The definition of `ipinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct ipinfo {
> +        uint8_t ip_ver;         /* IP version (4, 6) */
> +        uint32_t ip_plength;    /* payload length */
> +        string ip_saddr;        /* source address */
> +        string ip_daddr;        /* destination address */
> +} ipinfo_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `ipinfo_t` from, variously,
> +`struct iphdr *`, `struct ipv6hdr *`, or `void_ip_t *`.
> +
> +### ifinfo\_t
> +
> +The `ifinfo_t` structure contains network interface info.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
> +The definition of `ifinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct ifinfo {
> +        string if_name;            /* interface name */
> +        int8_t if_local;           /* is delivered locally */
> +        netstackid_t if_ipstack;   /* netns pointer on Linux */
> +        uintptr_t if_addr;         /* pointer to raw struct net_device */
> +} ifinfo_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `ifinfo_t` from a `struct net_device *`.
> +
> +### ipv4info\_t
> +
> +The `ipv4info_t` structure is translated version of the IPv4 header
> +(with raw pointer).
> +These values are NULL if the packet is not IPv4.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
> +The definition of `ipv4info_t` is as follows:
> +
> +```nocopybutton
> +typedef struct ipv4info {
> +        uint8_t ipv4_ver;               /* IP version (4) */
> +        uint8_t ipv4_ihl;               /* header length, bytes */
> +        uint8_t ipv4_tos;               /* type of service field */
> +        uint16_t ipv4_length;           /* length (header + payload) */
> +        uint16_t ipv4_ident;            /* identification */
> +        uint8_t ipv4_flags;             /* IP flags */
> +        uint16_t ipv4_offset;           /* fragment offset */
> +        uint8_t ipv4_ttl;               /* time to live */
> +        uint8_t ipv4_protocol;          /* next level protocol */
> +        string ipv4_protostr;           /* next level protocol, as string */
> +        uint16_t ipv4_checksum;         /* header checksum */
> +        ipaddr_t ipv4_src;              /* source address */
> +        ipaddr_t ipv4_dst;              /* destination address */
> +        string ipv4_saddr;              /* source address, string */
> +        string ipv4_daddr;              /* destination address, string */
> +        struct iphdr *ipv4_hdr;         /* pointer to raw header */
> +} ipv4info_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `ipv4info_t` from a `struct iphdr *`.
> +
> +### ipv6info\_t
> +
> +The `ipv6info_t` structure is translated version of the IPv6 header
> +(with raw pointer).
> +These values are NULL if the packet is not IPv6.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
> +The definition of `ipv6info_t` is as follows:
> +
> +```nocopybutton
> +typedef struct ipv6info {
> +        uint8_t ipv6_ver;               /* IP version (6) */
> +        uint8_t ipv6_tclass;            /* traffic class */
> +        uint32_t ipv6_flow;             /* flow label */
> +        uint16_t ipv6_plen;             /* payload length */
> +        uint8_t ipv6_nexthdr;           /* next header protocol */
> +        string ipv6_nextstr;            /* next header protocol, as string */
> +        uint8_t ipv6_hlim;              /* hop limit */
> +        in6_addr_t *ipv6_src;           /* source address */
> +        in6_addr_t *ipv6_dst;           /* destination address */
> +        string ipv6_saddr;              /* source address, string */
> +        string ipv6_daddr;              /* destination address, string */
> +        struct ipv6hdr *ipv6_hdr;       /* pointer to raw header */
> +} ipv6info_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `ipv6info_t` from a `struct ipv6hdr *`.
> +
> +## ip Stability
> +
> +The `ip` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
> +
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | ISA              |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Evolving       | Evolving       | ISA              |
> +| Arguments | Evolving       | Evolving       | ISA              |
> -- 
> 2.47.3
> 
