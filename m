Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184D117997
	for <dtrace@lists.linux.dev>; Thu,  2 May 2024 05:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714629368; cv=fail; b=iJ7p0LGOaYkkVMK9WEjMuyFRRizp6a4133HdeX3hTtYkrulz3yr106gblOt9efIDs0lzfHtP0Djsdt0d3dqWzBocEg2RgsDc334mFDDg7UMxdmBW7wIgPh16cAbaOJ5a2buaxdInziKpVLJbpfinSC97kRjNP8abFkxdTRal0JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714629368; c=relaxed/simple;
	bh=XtmW1uGGYfWHjrD+h+eMmrrP6QRFo7Gf9G5oVnkpshY=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=KTY27/1MUiUFFpkffJIZep9wYHP51S55tj4ZMI1BcDVa/Li7A6gy84Jl7EyzXal79j36J+ZpRlUu7UN/iqvrdOIt5FUoIlkoT7vj++Br7F1Ui6cAq6prxs3aeuy0k74/IMr2iPJtFl0vQy9jAqN1urHqHRmneh/f8oq4pi4NZC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZkMy8z4+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FBYPL0uN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZkMy8z4+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FBYPL0uN"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4425ltUB020707
	for <dtrace@lists.linux.dev>; Thu, 2 May 2024 05:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2023-11-20;
 bh=pz7jlwOWxbq7isDOM+/3D601UJqiph0TcCsq1WAX8vc=;
 b=ZkMy8z4+4YEdBVUWfkVUDK/O7eD6XeMwHJVa2bdXuoBx3JWw7BBKY6qhq2Gp0MAJdpKt
 R+nxhTv6y3cdS58YHK8Cx+Bh6oNNwalsh/zO7UgtJjmXzi48V/PcUndmjgBwGkl9jqIq
 dxQGBFFLtUog5i72aQFOiH9hnb+Q66ZhCX8JdVvckJWUL41my29wsgqH4Gk7Y30pQZ7F
 WPZ2dZ0jCTreAnN9tasCUIZI2CawWQjsqaYxLyvjGuu/9jXr63HpaK6tEvv4Ej8HemWC
 /g3XBjQkE8QnOKz87SX4opptLzLm99c7j/tFH8WFo8A71KiOa+2oXjUx1QtwfGg4Yehn Rg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrr54mtv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 May 2024 05:56:04 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4424vUt7033226
	for <dtrace@lists.linux.dev>; Thu, 2 May 2024 05:56:03 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqta6qqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 May 2024 05:56:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpFkGNpddZ/jGk95xqRaSKlwcA1cmxtqwOgJ3d2xT7sC3OMX+Hr85WIz/nBwXepTvARboa7vqO12+1Gd6wULjuDNkmVacg3kuw1Wohxc58waoZnNc0Wy4BZ+xLqv5Qqb2NHHYhdTmuZoYJvRJu3OoIQLGRA22WSk1gBjq3JSQ+lE99nD7rouCR0lYWeuH82Ne1dihl9jAw9kXVwfo5LS3WBCH8MOj5JPhq1C25QWxC6pGMN4ulrjU0E0LiIoyFGme2deVqg/BzGYM53A3Ll0i4K2d79DlseYEhCGge0uW/qCO4IKfgiJ8cZW/VrQkRnK5ClYR0h1At9+AEZMBZHF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pz7jlwOWxbq7isDOM+/3D601UJqiph0TcCsq1WAX8vc=;
 b=Zz87Tlm7+3GYitQEvWuOLjx3MKYJB/jXvbelQ8sktu+NtN3S++0mHhASC+fNLdR3gX1wAWR2iJyzgzz6DLKXvC7GH/qBZqLc4o5zDK7+cRj4cZU/CII0cnqbZv9uCQeDlqsiVFwHbFYE79JAJrAgEwEGFWQa+zU6N0dSR0sKgr9nXhfkGXHDCgtJWSTYFeDePzLOzDYJEQbz8gZCijMiq1N81FYi17tVjPsHR01+latMerOMaq4Sz8NbxBaG6xjQ7VH8Fj0O5YJp5OWu4IIztfhvwkxEwLdDB4e5HiBRdGuiqNnm180VTnwpymH5w1XObUAh61q+9QpRJGM4cBkK6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pz7jlwOWxbq7isDOM+/3D601UJqiph0TcCsq1WAX8vc=;
 b=FBYPL0uNSUKzRnZgxwJ9xfZ3wYy9xXJ1WAMP2k0hbWvxZZT8VbwZTCHT4FskLIqRwcuWadPzLz2BjexvIK8xczdb/Tf/yCuhblSzgKyOFdzWKvZCoVfMVCzmv/2G5HUvBSMXTS6cBK7JGQHNLhw1l9FG/+fJImkXf+8JCnuPxcI=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH8PR10MB6478.namprd10.prod.outlook.com (2603:10b6:510:22e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Thu, 2 May
 2024 05:56:01 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 05:56:01 +0000
Date: Thu, 2 May 2024 01:55:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev
Subject: [PATCH] build: install all pregenerated dlibs
Message-ID: <ZjMq7lGJ7h9Ko+5e@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH8PR10MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 216b5cef-6cba-4b8d-0ed3-08dc6a6c8bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IQJ3JJGHUNzJy4PAV0qBEGpDu0BOebCFU6u5YZEIAfvWJSxl7CPC92gH++WT?=
 =?us-ascii?Q?H2/RMiksMxlH9Yo+kBiiMbxQcaS+sCNhGXSyjsA51pyeHVPX+O0a2K01bTtA?=
 =?us-ascii?Q?poBGnuJnqSrxxO8TNMkN08aXI6wbDAUM+ttuIRH9KPemZXnzhhZgC5fFJtJF?=
 =?us-ascii?Q?o7IJLWgX//27vn0+DRF4eCVO8erUUFOPP+Y2O/Cwlme54GGFRpYOVcQZRcK5?=
 =?us-ascii?Q?wH+50u4dYlHuxKr5qt/aNsLtcjce/d9Jver24i+CO2eOUaX3NiE5nmR4YQVm?=
 =?us-ascii?Q?zTZulx95vhMgW+yv3dKALUPn0ye4+vqEABpb87eLueTAO2qPogaCPbUaSoRe?=
 =?us-ascii?Q?YAW55tmgtMpd2sO4rANzKDfOenfHNI8MYQs0rLArrLDSsl+3iMuNvqpRf/fb?=
 =?us-ascii?Q?1RwyoQqEfJFTEO+s3LEYCdkVzDhAMSnUQj4hM87vWhmQShwys0EzMqD+6i2t?=
 =?us-ascii?Q?CTCS+fUcBTWp42cSB1cb9Y9ffVPH+9EoKaVWJbsL+ncIdmLrmqffdAwgWcJ8?=
 =?us-ascii?Q?nPBUBmGrhFjSCr+EEMBIANUSrMG+S0T7XkQZjDgR2OyzkV35sW7bn9O9BK9p?=
 =?us-ascii?Q?1rkLPBghftG0pe/uW59QGiZw+aebrQYDPao6LWPwbxRCINE+H9iQn49Ddm06?=
 =?us-ascii?Q?C3/9CEMEFQOX1AtVdX7bkyjSkUiCZqdhwzxQ0rGwLf9EHZWXMla9Q9EFYYYz?=
 =?us-ascii?Q?s/dsZMRMR67jkLD7aG2eHlG3mONHDiTYppNOcFNmfPB4tbCBk3vgDUy44JTP?=
 =?us-ascii?Q?WkpZRzLfEOrZtNQS8NUXpY7g/ryU7HIpTjugg1WhDUq7zh8ES3E9eADgAo/o?=
 =?us-ascii?Q?ORFqWQtyCEd/ditV+7boOcVSRC4/Crk5U7plwACCeJG278U31hGbHbjlR1Fl?=
 =?us-ascii?Q?FVPWYRYnwJdkCtVWA1r/aU4cTn/7/KV83y8PBHWDZeqKmPDQ78ze63ORfGmY?=
 =?us-ascii?Q?zVMb0pry2emJpNEd7qZ6sOsbeJYbOMj4kezWiEDEO3ZU2Uf2XSr/KiwiRT2X?=
 =?us-ascii?Q?+jATh5gzdOuiV0bE1rWmWU687VEtE4AkA1j6kvhsgZsNW0ex2dm8hbV5RzxY?=
 =?us-ascii?Q?uVLfKFKLKs6O2UMcy3hpjCO/ozL6pc1XhNBexSS0S9xggqnNaJISSoDmLqJp?=
 =?us-ascii?Q?oMz9kJRoMm7xk2Gp0t+P24zb77HZlqay83B/XyiIV33Sb8sgw2rRxvOItYiB?=
 =?us-ascii?Q?aYVVGQbpddJai5CLvZk1b0ZEdEsbp2o20Rliq+VA+8ONDAurTRkt28Er0fAW?=
 =?us-ascii?Q?AnC10b0eKWlzufUKmGPuLR9haU+W2AnW6DDkeejqNg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bhobsJyKnZkoVTgagJQl6Xt98TMNW8SBTjarY6j3YdStKugzzZ7nyUN++rpj?=
 =?us-ascii?Q?P53twtTIaQgZbP92mNby/rd5Q36wb46o64uF9l6waPSTQ+GddoIw7KkqU1eo?=
 =?us-ascii?Q?CN+QqkJohB/AbY3meNO5OEAACT5IFdRmMpfGYUTutjpPMlbn5VwumDD86TBW?=
 =?us-ascii?Q?4uPoGqBosMpkW++SWO/c4pLhVFLd590bx/JOYy/ZCiRfTTApafsv/J+pkPEK?=
 =?us-ascii?Q?K3KzAzT40Z8WTiOEfPTQt0tIDono7/7yQcScMErKTnVXtkMbuKVH7N7WEb7T?=
 =?us-ascii?Q?IkIBLG5+wABpbSWlcljd4+iyzhhdQgqr4A6hB8P1xyHk1xVYyDp49XROFC3g?=
 =?us-ascii?Q?d1oIo+heJ/E9ix1vJDvMQmPS0EtKxd93Fby9+4Sc0S3zuJRFlCOGo5uS69lm?=
 =?us-ascii?Q?eioCdLtYad+Bqz1iyFAu+I8B/dTCUxy4L2LBSlhKe2fhqhb3axu0AXEu7YV4?=
 =?us-ascii?Q?OOpYnX6iiXJ4/iPWDCungxFAe/QFx8N11QeqGmghIHVopvpWV0n7+tYw7eEo?=
 =?us-ascii?Q?eB5zpXjjs/tcUivpYVZTFR29eUEBpCvHlPxoi9b0jNF4xoiDnfukOgMnSe8/?=
 =?us-ascii?Q?a4S1YYdGuVut3wl5NONGmcrxxjakcpGeLRdvaBbLOYHFFrkxqsYe/0pD17KB?=
 =?us-ascii?Q?HakbXRq+jDTCwLyZJfzcFX7LdU8CBVKWvAo+G0EZ5uRAohL7LqnzRMpGqHLT?=
 =?us-ascii?Q?JuHR7W/891fbiHJgDHOgp1v9j5Ryp7r3UW8DElyZ/aaDmsLm5wxMhWwqZ8wS?=
 =?us-ascii?Q?Vp/A+Jw5Ivd2qa7S9Y9z252Ddy3fC9HvJnPXkfJs+jqftu07z7znkfvsQi3A?=
 =?us-ascii?Q?LRJprDknMAXBsWZdabCKk1OIrCHtkuZ27+b8HGuBy3a+rAT6w+nMb6t1y67w?=
 =?us-ascii?Q?RzjbuiCMr6CvD8T+TOyrWhuJhaU2EPi+SF+eWkP5D1XZTjL0uiiiufMOIGc9?=
 =?us-ascii?Q?qhQSmkrimSW+FcKldlyAiZW3cr31Jt0SnGIlQG/SZfmMZt4lLSGi95LRMjnB?=
 =?us-ascii?Q?X8oD95ogAmrLy7thisvey2VEtEJ+oPZ8pulluAhxTdN+eamqjTUHlkUtnWGG?=
 =?us-ascii?Q?P+hDCDNZ5lPnH9/r4b64jOp7HDEu9iBMaSfy8KZ02RB2HgxBVNHvFoC38tOS?=
 =?us-ascii?Q?ZuSwKjkhsnio3OMQuAAF0LW2KhrCVZ1ShmHQBZ1qIo6c6BsT37XdyTbiIhhj?=
 =?us-ascii?Q?oEiFG84AqM/hVQu4lfWzzkeJckf1BxiRe4IXhHGF86yJ1DYRhihxs7+P966+?=
 =?us-ascii?Q?RNuFZ+6BWQEjtn/s/+vOty02Rnzyimc8rf06/zkqir2ZKQWmysPyNwuvwUSx?=
 =?us-ascii?Q?j0G7euSB4m6elKfT099qLY9FPdsbdKa7uwZeRFV7bPIc6xNe9o3Zd1GKobKK?=
 =?us-ascii?Q?hWqQW8A7Zu479VzJQ0D5TgzraPV0c9DV1DEt5V7O4q9NzV/HcGXs4WVuNpuo?=
 =?us-ascii?Q?OtSRIBK1fECkoLvce/58PTDrAK032/DhAjd41/uErimd+3VWZLVbRmwHlLsF?=
 =?us-ascii?Q?LBxlmOvkOBWjAEkn1z11WVu7RpeFnsjCypnVyrn3T1VOsuX32DGFJhDW4LDN?=
 =?us-ascii?Q?fR6d3DR2icKpBtJT4xo7b5uI2LG1Itfhfjx5Ve3rUO3Bz7hHfTJuKbkkL5Q0?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	V6Ak8WxI7ywGxrQPj51tsXzfygY9ab5E5a1JgPHcrmxPTmnudWjdKgz2EFN6IsWtHy7nrZUNGjOBBz7dxjyJnlQ6H5j6X2cMxB83qFSGaOBpDsagDw94jUE2GXi9VbEFQaTuzMWhzkvh8bmu4yVo7ZqUtTbgv5tzBcfvANO37KCNQuYeRB2ffZbKVYL2/l7IJieeIG6Xr/XM2/CoRPLEhE1VUjezJt+nCxeyeJeVY4vwvBoZMxvB1+KyGYQc4us1ueT0eCjErHCmKlFqPlty7U+iYDkfax383cvl99c4DFzhcA2AzDY/h+eOQ6KX4AHn4TmMeDTqDKb6Mo2Ng2vzthXFdwAgZlXKoEwCpHFjFpIkZZlnh3wjCxOq6eWaaspSZOfGvbFuF5rebrWQWe3RAYBLdcB2eIzD2HTJZLZEJHBKqWsG/N0KV5SJ0Pn53p+UPBbBv1yvthBPccKMJVJZls7EHocXJYhnBhImGJTjoCcW3xwV8qDCFEtJRG0SJsj6r3r2MzswVLFQLFrZJoJxFCvkyZcTxHQqhR9yLI41dkTa+Aovd8rNyFLeZP8ONxgWGt6RQQD6+O4YpzAX9KOmgVWq5wLPhaIcS+M3YAJ4jbU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216b5cef-6cba-4b8d-0ed3-08dc6a6c8bd8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 05:56:01.5564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLT7TvYpzl55x7+4FV5g8uZjTyXIAEw3hhqiJ9PbkWKC/0TEMWMIZpJqHbKtEpYyatGnI1TsDB/Fi4xJ3V9mo5da/GLwCpeUe4JaRz4kJJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6478
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405020031
X-Proofpoint-ORIG-GUID: tX6VVDP4Q8zpla8s5LIGf7OW5WZTRblY
X-Proofpoint-GUID: tX6VVDP4Q8zpla8s5LIGf7OW5WZTRblY

From: Nick Alcock <nick.alcock@oracle.com>

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/Build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/Build b/libdtrace/Build
index 473b4d5a58da0..b0e372f9a948a 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -295,7 +295,7 @@ install::
 	$(if $(NATIVE_BITNESS_ONLY),,install -m 644 $(DRTI32_OBJ) $(INSTLIBDIR)/dtrace/drti)
 	$(call describe-install-target,$(INSTLIBDIR)/dtrace/drti,drti-vers)
 	install -m 644 $(objdir)/dlibs/drti/drti-vers $(INSTLIBDIR)/dtrace/drti
-	for kernel in $(SHORTKERNELS); do \
+	for kernel in $$(cd $(objdir)/dlibs; echo [0-9]*); do \
 		$(call describe-expanded-install-target,$(INSTLIBDIR)/dtrace/$$kernel,$(WORKING_DLIBS)) \
 		mkdir -p $(INSTLIBDIR)/dtrace/$$kernel && \
 		cd $(objdir)/dlibs/$$kernel && install -m 644 $(WORKING_DLIBS) $(INSTLIBDIR)/dtrace/$$kernel; \

base-commit: 6c5f67cc8ea1d694da8043c8f5aeb2f97b69997a
-- 
2.44.0.273.ge0bd14271f
