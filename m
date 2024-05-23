Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D684DE2
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716490607; cv=fail; b=YhjxifhSJOS/4H/yGs4tJZ9wtIA2+ks43jbXgjzsKkrOR8bCCinbwnkOj1OoCG5pAqGXMnrDI9/iYWKqiiihkZHcAoB9AfHR8PpoHjOsXL3FccuDZKSH18i/qA8iWDb7+MvOc2dM4UqOZWvy4IWWuETdkFIMKcVPHhJWlLygW+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716490607; c=relaxed/simple;
	bh=xcwi1hl8swFH/U35W7iLsOSDxSeKvbSCQtUqZqN1mF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rpSDuWQ2Q2e2znwmorGk12Znud2e93rp7SDTUQGuHUK60ShanAeCg2faC2LcgHPbGKu+jwi+aQSkzovwFflZelIW716QVO4XW4A+Ysq+Cgo0bj8SPGcqoNcOfzCsA72YqqQdowcdpVtsUBmewtl0RJvgUIMmg0fk9cVEfrrEJsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KMnDU+Ms; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=swTnuYDo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KMnDU+Ms";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="swTnuYDo"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NIkxtS010828
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-11-20;
 bh=jTcThSId/kf4aNlUKXg7WIxyx5xkBcOfUriy9dzu/R0=;
 b=KMnDU+Ms+XeXS/Pk50BeMTYC3FiVYX8h66Sxddc+ytOjFhI/ydifi1j4QftHqJTMXaNH
 79I6drkVK936Dj0pVrp++kPm5n0BUI7BekB/W5cP5XgAmp41Tpywvi/5u8nHZfzBs6eL
 V+hmovCPzCNFgzGloftcoszstmXYbyfc8WxgHgqvfQh9qRV9rw8uMy2bspC2loFcuNA7
 YAsLZJdDKjdPSceCtdQK1NKkOTIurtS5zpn4yXRMoPrxQrdF0u5MxfFO+8INNu+cGzZ8
 VK5sHoY+qhscCa7c8SSK5MYpJ7DOjD0Ny6MoRR8HnxTN96xs4/N23o8wJp4v3GvnJ3Qe ig== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6k46b0ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:56:44 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44NISglN013845
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:56:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsadus4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:56:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDXyxpKxIRU6+iG/NXK1UHm5vgzV4I/qUKemIrDIiqYHdTOGkHQHKVsABaG0jQcFze0Yz1jf5rPB2K1fnm+3nFlnRGUtMB9+GktJFvYaZhwC/6nJVCvoHovLnRFj8XXW1KN9JuDGhWgrnH0LOw8vZ2Vni23lE518najEyOBHoUAn5scF12eZEvOoJLCBHVpyMC2EsTZiFXtiUuFMVCaWzpWjB+BtLMm51i8o5EHyQbKNWBZU9zdWsXhnMagtsrCb/900BAF/Dka7IOyk4tmfdh5tUuxKJ/cd3AaZyig3sS46Tzb5PWL+/tboyfqRgTcf/gJe3flCiNze0Vt/xnDVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTcThSId/kf4aNlUKXg7WIxyx5xkBcOfUriy9dzu/R0=;
 b=ZnmEzp/2/sTBU2IIxg58A+s8zeRjJTU8i7GCEvB/QN8iQkRKsdlCDUMoYGLys0rRzQQoBWte1gfZFr3PH13hCjOvnXsBt/8AwVkUk5Tp6xu8Tx6ljg29Q9aQFvD9YeYzICXFuzo1lmiAme651+ZyH55TLKgn9Tq3YreUOcXt7oAy4wBEWA+kar6mVRNfY16z+tOB2vYUGSYHxQCBE5JHSRtkCog591TtlKn/BFZP+ystFnmkvFt1znHMRtkwC3MytDnGJJ8wMmXOhe9QH9aMxtkQSgYBH0GaAWRz26HIaMgzsg7MM9tDFiv3FGnZgvnuI7YeWgO6coEXgIisbEXt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTcThSId/kf4aNlUKXg7WIxyx5xkBcOfUriy9dzu/R0=;
 b=swTnuYDo+RUTCCdtCPWehbubTv5Wzwc1a/iPjgqEd81UU98moq4cWcZdlZnI6AAtGWB3mfnN2HmUFxa4XmjAC+jT0qDIdE41/1z5kCb6BkFroIdTC/EBVXRJI8gdfngn9vn1y0hN6fpjvI8MvS7ZfJX4sQ91cZmg0OsIgf2VwoM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB5878.namprd10.prod.outlook.com (2603:10b6:510:127::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 18:56:38 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 18:56:38 +0000
Date: Thu, 23 May 2024 14:56:36 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] build: install sdt*.h in /usr/lib64/dtrace/include/sys
Message-ID: <Zk+RZEAcL32ziSrF@oracle.com>
References: <20240523175654.462908-1-nick.alcock@oracle.com>
 <Zk+N3P7NnwzL1ZSz@oracle.com>
 <87cypcs6rt.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cypcs6rt.fsf@esperi.org.uk>
X-ClientProxiedBy: BL1PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::23) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a4729d-9e69-4308-848f-08dc7b5a13a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yHNzgHrsk+TFnNl+dQBWEDdkWZJuDx3/UlvwGiZoAmhiYeLF8WpvwZNM/PHM?=
 =?us-ascii?Q?c5CFkma2QQJ1eXTQ2I2pLxj6FNh3aE9rrZvBL8qz/9TBtFjrPUDXgGy+gqW4?=
 =?us-ascii?Q?sLjwXcrG63OnGijeo6vG3mRCUwlT8vjU66hP+//cG0hENt+hP133hjmySsUe?=
 =?us-ascii?Q?F0gyn1QsLe4Zi/BlRvfe3n9TSNrOqEsU8e4W7W2FsoSVopHs19SRMpHsFhMp?=
 =?us-ascii?Q?Jw0QDdvmcjD7xCWsQWVX4efEtSIlq0uLnNIxkSEuiau2K5rIMPWN4Z/uiUeE?=
 =?us-ascii?Q?mq+siuH2jvpASoiDBsO9jjkjqW3GFtFRw3Jn5T7YB+TteU/yiLPZIiqAXqVs?=
 =?us-ascii?Q?iYqGAAyP8BjM2hDb0u2Zist97WjOnyZ2c21FGH5GpZ7L/5Jp2m+3LG/1lMM5?=
 =?us-ascii?Q?lXFLdjVPz5y+LNhSK6SdAEjcAuPqoEpA8Ld6BbRBFuKmzpnQ1r3i03T/j23/?=
 =?us-ascii?Q?zi2g7kz4BPIUFF+VjYeJLOc2q5lljDbqkOACIjVTQPtgVpiq5/HSZKFTgEIN?=
 =?us-ascii?Q?oYcU8+PS2gVTp0dvI0RGG/7Kp674gduFw6vmGrUx6E02AyCLUP5ebggYVo7q?=
 =?us-ascii?Q?/4/bEtiLtOvn9w5/mxaCqAzvWrR0Ecy3uBmOROuulm44ASv6xL6ft+CJ1lrB?=
 =?us-ascii?Q?jVPcvCd3/De9HJVSKgvw2Nsk9PbgT5a151bB9mUt4MPmTGGw+DzWwqHB4BI0?=
 =?us-ascii?Q?YkkLmo4Ek72ogUFIDaODkhujURQRQrrOfGiNMLtk/yGlOLemrR2gAUBcrecS?=
 =?us-ascii?Q?wyoWFMIppiVfe6KgbbBaepSGGxUm6HluzgoozBvuNaNkekVmKZLX7gPIhqqj?=
 =?us-ascii?Q?Qd8xBLyRbZTIArAMSNHJPh1EVXiy4EaxnUMwstpOdif/+wljsvKjs1gpe2M7?=
 =?us-ascii?Q?26lAfQSOpJnTeZRSd7vJoJGNHW4Sg0+cIQV3GdxFQHvSEBwBn2MS2BOqYL9g?=
 =?us-ascii?Q?mrWVGkwZnBlRlMXy/rRrK0Dx+pCUzI6e82N8hG0BH2WQwLBKn7Sw3q7yJYMi?=
 =?us-ascii?Q?+yOpP/3qG+Q8MEHSihl3WMnGp/zJnU9/bA0TA+f2OkSgTQuCPwliZlUfFS24?=
 =?us-ascii?Q?qeRQ69Zcb9MasheXzPSAupeay40rTzuSvlx8GbfdmUpWMxFdYUAApDZOlWff?=
 =?us-ascii?Q?D7bjlqCexwHGx4QbiLMUQY/vgTWIPTdpKoclmAUVHuXwhNq/8QXm9ZIVVvii?=
 =?us-ascii?Q?mkD9cOXTQ8eDz5qcGonaD7KIK4ZiCeEDIOTEJziRVrexHNEvCCsAelDnSgcb?=
 =?us-ascii?Q?m053e0nzHQKo9D9TVqkyEJa0Y79O4e4aVHcncsYsBA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bAgN3n4CeBPS/W9GGYZUPAXSXKaQQkmlFn6iGsc/XfsfpKZNT5pQsoPviWt8?=
 =?us-ascii?Q?et1Z9K9RCehHzxmMZeZrC7PboFvPXJ6Jr5aDoW4D82UbRRM7WgY9Z7nzXPAr?=
 =?us-ascii?Q?mnIPH6DiDMCn7gpoo2QB4+vCCUjzE+76P5Huw1lA4aJzNFGFAI6cDxdo8fLd?=
 =?us-ascii?Q?alEStKfiAen28W2doj1ifFyN68CCn4rBteAC3aOzbIC+nEcOx6LcGEgmwKCB?=
 =?us-ascii?Q?wkS7A6wDRaer2MPw23cj60ds67kiunmtNU7QOVCc3UZ1mpPc38Ilek31yiru?=
 =?us-ascii?Q?iBT0ZJsGpPFjXYVVIJflr2cfpDGOv0+zfRgJQmJx+Ir4IxBzBaUSsNk3qNWt?=
 =?us-ascii?Q?c+AulcyvqeAg9/xlrPNsABYiW+w5zwM6ij63ld2CSyi9YIesliOU8gNIyFbr?=
 =?us-ascii?Q?w1at3pK2h64oQsZzv/JVbaeJfycQcukLeqc8tFmGvTF6PINehoLM9PvT79pH?=
 =?us-ascii?Q?NHMCu8ilfiOmbBGPAYdwnrNnNc+gSIb/rsQRH4OPxhHkxs9N9hab1B6uVir0?=
 =?us-ascii?Q?q/xQ31AcOlu1RCF7FkQ3SJI1YgxVOGPg+xvD5F8sJALKzkkxctgCzgeTw6Cy?=
 =?us-ascii?Q?0RrgHZ0B5cZgHtZzN3s3LTWOHQ5Q4rL12UmZiKRqAHwXAZH5+CZ3Ytwu4nwy?=
 =?us-ascii?Q?/d1BwFOmz/ALqoVYU4B+kKc6TSqR5lgxIZ7Nq2sg3FWJLAPrGK3TccKe64D9?=
 =?us-ascii?Q?rtpO83rQO6XYTLNyUgMTNREadh5rm7f2KF9r8ZjBUPRFNguGNiMubFYdQIub?=
 =?us-ascii?Q?CtgOhKrUbh27TPmLx6Y7nZgJ/hiQarJVZ9QNPZkdZcCdNQmQi42uNASL4aTF?=
 =?us-ascii?Q?hM/oqZuS7ZUuRDBPY1nrxSX7Jq4Nud3YNFg5AmrDQ3P4C7DphQHX9VUtuUGK?=
 =?us-ascii?Q?yGK/NJk4159i3sBlnklX9sgjsI2zGhfW/b4TLypNw2Dj6hnyQK9ZG4JVUmTj?=
 =?us-ascii?Q?q5SAfE13aS005STasDLqJC6VMDaHLRKdFhtTyS9bHzlWN+oUP5Oy8okGMqdN?=
 =?us-ascii?Q?3DC4CLqfa+FM27+7LlKq7PKAU3fal+6Z/dWpnmthM4yfWaSmDYfh3lubJbdF?=
 =?us-ascii?Q?BBn5sytSxedFryT0uPwSUE8DReumK/rwib+h/vpz/++VqITl232bwDrl7CHk?=
 =?us-ascii?Q?rq1jq18YKlcIRFvAbnWKcnGJE+eGmPXM0UxB8AalLmt+b0K0Kv79S1p5JdA3?=
 =?us-ascii?Q?IA9auyzW+aA6P1Z536Tf9bh62myODbqRGPZHkLwFNgdmcl2JEJXS9WwgpvX/?=
 =?us-ascii?Q?IurWwHKIy9gSVxgjA7pkrdfCtwD3H/qxmzcGhWHytiwv0bIy8F8UfFZ8JY+L?=
 =?us-ascii?Q?AgWirndA8YhuWn8Lf+SokiPFxmqA8qBm1dPLWRZvx/eor7U8mDfo3pDeMzaZ?=
 =?us-ascii?Q?ssZkWNGySERmQrRhdGe65IjQgr8LV5v2MSc/H4b5RKbwiRJvVbLWts1PQlSs?=
 =?us-ascii?Q?CK5DqHmHEN2bnCzgapzFw3zPeNz/W7Se1/GuBbnAS2HRVMEiRBybD29AiZpH?=
 =?us-ascii?Q?Lp+1lsiS3kJ+1fQX1czdn3dpNu/b/Vm2NT51dg0CoXYebFxtrT/hn8JcF0Ah?=
 =?us-ascii?Q?pTbmVmY7TydK+6AJJ8Ahx64wINEATUy72OjNYQ24i4X8hy04rEWsQblCzg1M?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	c5lzfiretJnQS1bqh9oSf0GvOOmt1H4CKkJnIrQq1aIlgd9+BIzwbF4iu9QEBTiT4Jc97FnHji4Ydr8Re094IvqyRZH22HlZildsrk8HAq4TgsainBfjxhe1JzWN5qrPI9J6jGFbHwnsSl6tLPmhNBQcsJJMs9yE0fS8PTcDMURCjQ9UGOvGI2/CJ76ooVGtTdc59EToe7feDzhlBI1tWscgxQzoEf1KxDo1GRnVmn+LFYaIxj/VE5P9nTq7h9NTfpqnwc+uLdUMAM/nLGLXVwQ/Wyn4yknFu2WMseZTGkfF6vz9PXDtDPXu/rpjGz3sLLEhekpneouilkqroP3IKDwjzLcsOhWNT2IZ77G5OZVh2W1LL3Em1JIIoHxunkzEenVkLEnZYGEeH8NQFwxDnZyO7BTTIAspcnEL8dQyqUtQ9/njaCuiYbui81EAZyeMCrCJ6EV8pEuFedFcpLUWYBHODtlWu2YsCqCdbWBJAvJTzuvl5ja1oDbBXEh9BJDgJNrIrCTymHWVpobBMHeMFpRX3Ak9TZ/TybVdMQYk+myeCtcXBEc2O3a8f3QDgQlqMIsIU1987RIiwwkd5Qmyv5RJbgbfCqKuAYSRPkTjKOM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a4729d-9e69-4308-848f-08dc7b5a13a8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 18:56:38.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBxdi1Umr2kf7QW8PkttBcbWLxbqZLaDSHbp+dqF1movRMeZKIyFu7u3W8WXMsY8dTm4VgYDWH5QIaHN1bQ0G8jqmDLaTjpdUPW3OiC0fqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5878
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_11,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405230130
X-Proofpoint-ORIG-GUID: bzAiagqT2Y2pI1hOMYmjXqDpK1MYz-H9
X-Proofpoint-GUID: bzAiagqT2Y2pI1hOMYmjXqDpK1MYz-H9

On Thu, May 23, 2024 at 07:49:26PM +0100, Nick Alcock wrote:
> On 23 May 2024, Kris Van Hees verbalised:
> 
> > Can you split the move of sdt.h and sdt_internal.h into its own patch
> > please?  And I guess the pkg-config stuff in a follw-up patch?  Still
> > need to look into that a bit more because I have reservations.  But
> > the moving of the header files is definitely something that should be
> > in its own patch.
> 
> I put them in the same commit for a reason: doing otherwise would break
> the installed testsuite in the intermediate commit, and I don't want to
> implement *two distinct* mechanisms for locating the headers when we
> already have one that works perfectly well (pkg-config).

Do the first patch with the moving of the sdt header files, adding an
explicit -I/usr/lib64/dtrace/include to the CFLAGS, and the testsuite
should work perfectly fine with the file move.  That is hardly another
mechanism.

> (Also, splitting them up runs the risk of your integrating one without
> the other, and they really do go together.)

They are two different things - I mentioned that from the very beginning
of the discussions to deal with the sys/sdt.h conflict,  Please split it
into two patches.  The pkg-config support is bigger than just this sdt
header file move.

> > Introducing pkg-config as a mechanism that people can use is a separate
> > thing (and as far as I can see, could use some extra work anyway because
> > e.g. runtest.sh still has other absolute paths in it that cause failures
> > when the DTrace build is configured to install things in non-standard
> > locations).
> 
> Well, yes, I didn't try to make the *entire build* relocatable in this
> patch. That really *would* have been too much for one commit.

Yet the purpose of introducing pkg-config is to deal with installs in
non-standard locations.  If we are not caring about that right now, then
there is no need to introduce pkg-config just yet either, and definitely
not as part of the patch of moving the sdt header files.
