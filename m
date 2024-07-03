Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C721EB48
	for <dtrace@lists.linux.dev>; Wed,  3 Jul 2024 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720018572; cv=fail; b=ZBd4YobVUXm4+yvi7bBv7TQ4whgRQsw6k4ifhAKXPdrZLD242uLN+dMuDJSFzOvadd+bXLl9yZhkosH3wdcij7d9wdyJ4WQIuXpbO9HvGyyrizzW/VDlJIO+CDcusI0cEtjluiJKFBziaNPs0ZM+5uZWDHjhRmqTSqfkKzN7yN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720018572; c=relaxed/simple;
	bh=dCe82OMx3+mvK84xzIYBsLxRYNGW+DZLILeDTvvNTq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bwm2AZuAo1zKUlhkpKfzTnFnYjiBodVxJpnj9mmn8+5XZLmIWGny+uQTbDiwBW6OmvS6ShVcaaMu0PQ2Og6jsFh2iFtBKknWz7KujZVyh+PP5/G9TYz4g81j1m3e2NFmjr/7Wr0m2vkp3XRKNnKASS2Y/ZEavIA/LutZeiMG4V4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QuNBDrtu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=X8Q7oK+H; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QuNBDrtu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="X8Q7oK+H"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463EtXtQ028429
	for <dtrace@lists.linux.dev>; Wed, 3 Jul 2024 14:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=0v/fho7oCqEdr05
	qEKYEudAPtnEHieOUf+osKPUOBto=; b=QuNBDrtuHNKWv48Vk6BAly0AlaYozZl
	zXotHjhd3iMFXYxDAEtDuUROs0RgopcxqFFk/Ge4xHeRufkQzyhvZg3IWLethsl8
	TCllCWoWspKm66yhj8RQjLP/NhIcpCGU/uP2LZgTyrgONIoEoAxcXLtdcKYnTqMg
	McIkFoe45pvHMI3XP7EBCdrvmQ6pIgBRLcZRaN+mdTJxKwnOFBbNc7VfLpWJ1n7P
	qSL8uogVvmzLVq/0ZiYGYnAYRom211EEXZ5pF7D1vKRl1yYVD8JoD+aP/n0E9OC6
	oqpMfFi1yJcvh7xY/vocRY7mY54bwPsC+/zF8Ab2w9grc+0uj4TNCAQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40296b0dvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 03 Jul 2024 14:56:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 463DFWdf021479
	for <dtrace@lists.linux.dev>; Wed, 3 Jul 2024 14:56:07 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4028qfbp28-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 03 Jul 2024 14:56:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfSKr2o1exr4P1AWNwTJ3TCS/7KWtZI5W6z+OQDK8mEU6ZFr+g1pzd5c/YLgAUcpIFymKBoJc0sxnRrDK7yabPTTYmwyJr0Gpk3Y9q7hjcV0skUiRYwwT88ZE14NwacX7MxNl+fEcWByRUlD7aZo99mktWsi9ZQkQPNarGx6Hanidf1bTm4kDT9+NTc3siDcpqyCsHwoqilWd4ofKtQHpsr7VESsKrwV2i3E/v4xulflxi8K+fsMlLttPbv8CedNiB3+5C92PZ7zU7SfegESAuMdESdn/nGKDEbfXQ5KchULsfrOAspD/nP1zm0NmuNjAmNn4lm+DdhdAg715MuyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0v/fho7oCqEdr05qEKYEudAPtnEHieOUf+osKPUOBto=;
 b=ikBUEMbX5NUZ/xKpGtuF7I5JGleJfuqyi0S/4cYA0qv0WIRF0l92W/qXJ+TO6dlf0c+MrT3bBd9b4z/w+jZB69rY28OraWybK1OCBEhHj6aENlsuqPlRNHkkZ04rqBo9a2Im3C2xHxuB48XzEXh3SKEltk0yqvC9o3Qd6RK40scmVw2uhVpPhdZRXqxXAiQBSZuIJUAAbcSyv9/yZEF+it+l6JpOAOyGOH2h9ObDnVZLxrEXR5U06gDjjsnDWrq6k8mnoQpL/KHvtoYHn1RRRQbs3ffKe9BY1NNIQjXL6barYo6g+yfEjP1WbglXz2Gxk+GyOOB1ElXanv7oppR7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0v/fho7oCqEdr05qEKYEudAPtnEHieOUf+osKPUOBto=;
 b=X8Q7oK+Hflv1tmLMxh8Jt6YU0QifiwmyxTXuBF4F89CLH9ZAvmHq4Qcn9CTi/KQAHUP/5OaNgnKBGuW6Xjgch6QM4PhRMEfWgndk98B2VYWYA5fs/eIMuF1Ou6XLNJu4q2tvIkRkeG6S+OgKIzL/WlxQEeJgzIB+YEWpnSJ4pgw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB8078.namprd10.prod.outlook.com (2603:10b6:8:1fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Wed, 3 Jul
 2024 14:56:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7719.022; Wed, 3 Jul 2024
 14:56:04 +0000
Date: Wed, 3 Jul 2024 10:56:01 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 1/2] print() action: identify ctf object used for print
Message-ID: <ZoVmgdBYyJTqmnhE@oracle.com>
References: <20240426133327.578092-1-alan.maguire@oracle.com>
 <Zn8xVd+r8SzmLGH9@oracle.com>
 <9fd33071-54a9-497e-ae90-4daa63eafad0@oracle.com>
 <ZoLeWRMOnCoecHmx@oracle.com>
 <2b83e5e2-adf1-4a5b-abf8-a83fbaf65abe@oracle.com>
 <ZoLrt+Q/DWf6K9q4@oracle.com>
 <2630cd6e-0f7d-4a05-a711-85d251045b13@oracle.com>
 <ZoROKlfr5tnaBRVO@oracle.com>
 <50a94872-118d-416d-ad47-3e5c5f437870@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50a94872-118d-416d-ad47-3e5c5f437870@oracle.com>
X-ClientProxiedBy: MN2PR22CA0024.namprd22.prod.outlook.com
 (2603:10b6:208:238::29) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 201b967b-4feb-42b2-4323-08dc9b7042d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qJ8itFrYIZY0Y4CPe2Xgu6tktf97EF/Ig+/wuI5O4LhnuQ7/PCXtJCBkgW9W?=
 =?us-ascii?Q?AsTxvI78OTX59goeVwW3cQBSbeQVm/UkAy6V47Bl31iHA/qiPd+0tZC7jU/b?=
 =?us-ascii?Q?nyDDMsW8BvMTkmiaWY0XNTWt2t8vV2GtnksramH5UgqSlnMs3WJscyC3rgHW?=
 =?us-ascii?Q?F9WQRdDBhTGtR0ncIo+MfXEwqVCx6Y337axOuFVhroQexclv0saODgupzKgY?=
 =?us-ascii?Q?YRFkf3P7E7wyxFXjvqxm/H2GYmCnN7w9LGxqsfjCc5FoP9isGkVKRIkd+R3G?=
 =?us-ascii?Q?3CjDtjGC/XelXquwOCk20GKvw3jzuEBiz8XlvloCEf0XpflDxRDIlT3KDF+y?=
 =?us-ascii?Q?daMrqlqDS1qMHrVRM0gkjqGyk3EgG6J5c7a0tOzDLMDytZA+YZUlJm+wc1wi?=
 =?us-ascii?Q?nz3Q6yigZLcNZtXVN2/+w6vZTJlJjtr+dEm3qiWcxM78rmsx8o1q2Fd++K4X?=
 =?us-ascii?Q?5CkGPSgywzasKUoXF/N6KtBAh2ZLMfwd2WIrOV1DFczWysjHwB1igRFw7vDR?=
 =?us-ascii?Q?EM0rs1+PbAm7BNgtbYXrPZxCvTwOLwDulkgLX3k8zLaS7Ab5h7WfH80cs0wb?=
 =?us-ascii?Q?rlVz2LEDgzWWnrarl6kVzzMCwGj6XWq4PhVQa+qO5XCZTiYX1V9zMYTznz3i?=
 =?us-ascii?Q?VJPDp1cyEuUaw7OOczwfg6o1iI2Sj4AIupmbQZBgdXQW3X8RI57mgnqkZRaA?=
 =?us-ascii?Q?WEY4FzTwFG8FMpvS1JlDCmYU1rTcbauZ9UP816Z4aAgmxF02F4lSTWL0i0MH?=
 =?us-ascii?Q?pIrE0jUEoUYK7Z6rLQlh/LfMtALkme/Dbqr2JVO/UbwtI17T5Rwj4yTftZgp?=
 =?us-ascii?Q?mjY23A0Zloddhz2Z5lLJ9i3O9GjGCzBXED4sQcnIF8L2YGgupOTsYExOzHi6?=
 =?us-ascii?Q?wE8WpYH4ONc0gAF2CeX6yOHsiJv9nJYSrn08uup4XQSsv6xPv38jyQkUyNyb?=
 =?us-ascii?Q?voC+eXSXYrP7FI6G6NUo/P0lsUZBJHaM598rbA3YGyk1EaWKuBxlQnDW4Y4d?=
 =?us-ascii?Q?Gy2NHnFidRzPbFGXFyGfT1QWSsz48wiqC1K9wBCTQ+x8FeR0gyQqyA4S5KFo?=
 =?us-ascii?Q?EHm3+kbpcOxKvkaI2MxiGOwgC0HFgXkdXkT0pEgfMAEyDcJ8coXoCX7ekZC+?=
 =?us-ascii?Q?DoebFptYS5y91th3Wx4PbS5z8F88MOgHNptMKTvkAGQWXyQ9Io7YxNVJViah?=
 =?us-ascii?Q?JZnc8gOvgC7jmxhSjvUiiyNfVX41N96/d3jObGnuAmYYGjD7WX4WXGzjzICF?=
 =?us-ascii?Q?BNPURjgjggPYl4+Ax2K78QvEb4e2z8cUDySj+stcO6icO4Ctmw1tItFbdefW?=
 =?us-ascii?Q?SJlhAekOQZQTF2SCEI3GGPmJQP1hN+LyrI9H1Rzaq4SQwg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x2lLEbjT1ol83k+sMMcwsh6sN51SWxmeQKIfzYWnMr+/bleLGVK5uEzBsd8B?=
 =?us-ascii?Q?5b+KeTtzZfUzORXVyrFBcT8hEDOPnqpWmSDzLR/4GBCBIbdlGDVJBlZOy65F?=
 =?us-ascii?Q?aJZ8K7gp1joA2B96AhpS9X5VSeDdsRR79+mNMZtrtSL19wUAg+8UMehptajg?=
 =?us-ascii?Q?sRCjUd0rqbAerd8gefr2cPaY7opmQWtE8JtVzOF5J6uIvjdJ3QSxJi3TMCF5?=
 =?us-ascii?Q?O5nFqpFmVUOfJlzve9VtD0+ebsYw8HqtCVCbK8L12CnfD2cDPvinf72SplbD?=
 =?us-ascii?Q?YM2envDuKdXX6kdmyq7MuMmnr/JBohc9PC+rqM22trJPDWqz+CIdWHvvAZnB?=
 =?us-ascii?Q?EQHV3aQ2aZqSGDq24pY88xmbFrq0NLkE1T0waXHs3OG3//H/7WoP7dlBuw8g?=
 =?us-ascii?Q?KhSjsTeqstEzdRtQyOGZV/nMK93Z05ByL12ueppGpJMzUsaK0grxKGB/MgzI?=
 =?us-ascii?Q?4UT3c66I7bzASfq4wO/wiyF96f3+QNfu6V07OV6WuTZguzoGQQWJWWIfgUAe?=
 =?us-ascii?Q?g38DtwgbRpGSsxmikChl43trQwVlnL9VsA7Ztk7BfsBtexMC61UB7XJUIngv?=
 =?us-ascii?Q?xA4wodE9Kc+8n0Qi6nHwlZgX2Sf5QdyESAi70h0wwQrG4VyrFfRT2rd1bAqC?=
 =?us-ascii?Q?UdAArhtMIVsc8EU8yCnQRNpy6QE/6I92QuKR+Kumad5sDlRaSU99nnzwfNhL?=
 =?us-ascii?Q?5Ai0mD48lvZ66eD8aAYyT3yoB0kRdwep73E9ibKvhQLn+ZOli+mTMlw04DFi?=
 =?us-ascii?Q?qocVxg0VwIIHijmb7dR+eBt7FkxiXXupM7DoYYOuVGUq0cEPm7XGRdXoapFq?=
 =?us-ascii?Q?jbDfdWmd14QOty0BiHm4V2YlMi4LG8yZjDOl9iYZXBXw0YlhNDcLO4swCy0e?=
 =?us-ascii?Q?Rq0gOTymcGemCzldhlRuHBeSyteUYIej7BXKGREz1C4hSVgrQcTlSoQ/Dnhx?=
 =?us-ascii?Q?4CODjFlG3fQJlkxnVOK7xe6VgBqc8uuy6V/ELHZBVv+FiGZ8OTuNOWsWkg54?=
 =?us-ascii?Q?kWdJXv8ThsRxM7wBI+34ULiBoYENVugPYAgyr1dph4rIu2ClaNCqA9gEu1+Y?=
 =?us-ascii?Q?MckN/UoXD7d747lYd0pKUw5aaRYNJKZv4qwG4SE6phcuW0DdxN9LBNrQmPpJ?=
 =?us-ascii?Q?C5qr9wlY8NN9yfCcXRhjJp3xYh34fTcLSk3JBQ38tqNFLSa+vkn7LU/rstRA?=
 =?us-ascii?Q?aKIjRejgi6GZlk3KTj7Z5UZ2wP6m4paFrwd6XD6VoQFG4x/6wVUtmExWoNK8?=
 =?us-ascii?Q?mEjAQPtVan2FgfYDc9LdwX859HCronPAhUMZ7r0BQofpOC2PDx3/A71K7Nf7?=
 =?us-ascii?Q?ScopbZneTJFIzyxKPyL39fABX3BQzPKTJTGCyisUGXU812eq07jKkQSn8g3B?=
 =?us-ascii?Q?e1St1VCLEuhZqFOuSnoRbpr7c+s35EVccuN8pniOuhFpPbtTxM4YfYrSeKdW?=
 =?us-ascii?Q?9cJ6RmKoJ7efk1/WCdIetv/cssaEtrL5k2xyJihmXmLnFFz3iStT7anYQAJj?=
 =?us-ascii?Q?u8QetbjZnrIrESuxp38PaicLODMqDrp0yVU+UA8m65t5OgJF8j6ZCspVTUNi?=
 =?us-ascii?Q?60Kh8634F9fntfKsDzjs4oeQ1B4e90IjXrnOp2WDk/7a+bUWSR5naNJxWRgH?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	e6xiK1JH6OFouj9C68eYyxfQ7IxBwy+aa8menUw2M6cuC1x3xA2kaEcDb+TZKEH0NcNsEKt8vZjXw9H4vfiXrF5NRulhr/zcxJqeCpZKGwc7CclYG72xYY8/f354BT8qgWSRKTv0rwaAY/27Fv1vBXlobKD8iaq7o4yKhmSctMX2LJCvTkdO0AQlUJwNv7aPJTnMLRaaUB5jzvmzq0kstSvT1flAegSLxbjLqZrw0lmiTUKqsMhjOcBxcbzkwZch96JVXjbgrLnl7v41sS3m7iIoDW/t3Ba2dtH00F9L4JjXcHlBFXWD0fJGBD6MNbDflhDlWfIWPh46lUPyNDMAl1cP+tO/tk1vdPxymdHbkLd3yUu9lmw6pDeWXjM0mgIDkZvUNaQaFJGf4V+I0IWCMb8ElSmKqfS2VaGm8fkQIZ1CwgU5dHw4+mGoo4AejWSAgQF8SVm736O1EwKkx9zhv7jNqhXyt7osU94/Mp2AW65uK2qltFM7CKtcg3EsThB5lvXKOw8E1xLjfsvf2kQOluGOpRMdWz3aq7VyhW2kYhdJ7PmO2aHnQCkYQn2Xm4mXko39VDMj7Xm3vHOa0jliWUPlTglTZZ2a+MfnJqYrWbE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201b967b-4feb-42b2-4323-08dc9b7042d9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 14:56:04.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBE5N8EGqM58TWx5f0vpg/I0bx4D7tVEP1l5pvxyUVH+ViYntwsMg/utBddnUZylGg1WzI6NvHQgK4lsxEAWHhyWvVhKXA4sDvlqfYwtGis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_10,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407030110
X-Proofpoint-GUID: 2MFpgEtFpoheaNHhwYRok3RDBOF1tw1S
X-Proofpoint-ORIG-GUID: 2MFpgEtFpoheaNHhwYRok3RDBOF1tw1S

On Wed, Jul 03, 2024 at 02:00:55PM +0100, Alan Maguire wrote:
> On 02/07/2024 19:59, Kris Van Hees wrote:
> > On Tue, Jul 02, 2024 at 01:30:11PM +0100, Alan Maguire wrote:
> >> On 01/07/2024 18:47, Kris Van Hees wrote:
> >>> On Mon, Jul 01, 2024 at 06:21:19PM +0100, Alan Maguire wrote:
> >>>> On 01/07/2024 17:50, Kris Van Hees wrote:
> >>>>> On Mon, Jul 01, 2024 at 09:06:32AM +0100, Alan Maguire wrote:
> >>>>>> On 28/06/2024 22:55, Kris Van Hees wrote:
> >>>>>>> Looking at this again, I am wondering why we don't just add type info to the
> >>>>>>> data record?  Since we know the type of the data items being added to trace
> >>>>>>> records (and type is expressed as ctfp and type id), we might as well store
> >>>>>>> that in the record.  And that would make this entire situation pretty much a
> >>>>>>> non-issue because the record would already comtain all that we need to know
> >>>>>>> to consume it and print it.  No need to pass a module id.
> >>>>>>>  in 
> >>>>>>> If the issue is that modules could get unloaded and thereby some pointers
> >>>>>>> might become invalid, then perhaps the solution would be to always copy the
> >>>>>>
> >>>>>> Yeah, I think (as well as modules going away) the other worry is record
> >>>>>> corruption, so dealing in direct pointers is too risky I think.
> >>>>>>
> >>>>>>> type to the D dict (I think that is the right one - I always mix C and D).
> >>>>>>> And since that one is always around, there would be no need to associate an
> >>>>>>> id with the module and pass that.
> >>>>>>>
> >>>>>>> Perhaps doing such a copy is the best action here?  And we may need to look
> >>>>>>> at other cases where typed data from modules might be stored, and if there are
> >>>>>>> any others, they may also be subject to possible issues when modules are
> >>>>>>> unloaded and in that case would require a similar type copying action?
> >>>>>>>
> >>>>>>
> >>>>>> I looked to see if there any CTF APIs to simplify recursive type
> >>>>>> copying, and  I couldn't find any and that's my worry - this sort of
> >>>>>> copying could get complicated fast. The other issue is size - a lot of
> >>>>>> the kernel types will pull in a massive number of dependenent types
> >>>>>> (print()ing a skb will pull in sockets, task_structs etc). Duplicating
> >>>>>> all of that in the D dict would be expensive I suspect. The other danger
> >>>>>> is introducing multiple types of the same name into the D dict might
> >>>>>> complicate things for other consumers of it.
> >>>>>
> >>>>> I mistakenly thought that we already included code in DTrace that performs
> >>>>> type copying, but I cannot find it so perhaps I was mistaken (or it is more
> >>>>> obscure).
> >>>>>
> >>>>> But then something else occured to me...
> >>>>>
> >>>>> This is all compile-type-known data.  In other words, none of this is passed
> >>>>> in the actual trace buffer.  That means that we have a lot less worries about
> >>>>> how to store this information.  So, look below at your patch and some comments
> >>>>> that I think make it even easier.
> >>>>>
> >>>>
> >>>> Thanks; more below..
> >>>>
> >>>>>> The worst case scenario in the current patch series - that the module
> >>>>>> goes away - means we can't print the type info, but that's not the end
> >>>>>> of the world really. Certainly in the kernel case most modules tend to
> >>>>>> stay loaded.
> >>>>>>
> >>>>>>> On Fri, Apr 26, 2024 at 02:33:26PM +0100, Alan Maguire wrote:
> >>>>>>>> when generating code for print() action we need to identify source
> >>>>>>>> of CTF; is it shared CTF, cdefs or ddefs or another module?
> >>>>>>>> Introduce a module id scheme where the module id can be stored
> >>>>>>>> at cg time for later retrieval at print time; this allows us
> >>>>>>>> to later look up the module and its associated CTF without relying
> >>>>>>>> on possibly freed pointers.
> >>>>>>>>
> >>>>>>>> Under the hood, the id scheme uses a monotonic counter coupled
> >>>>>>>> with the hash of the modules name; the latter allows us to quickly
> >>>>>>>> look up the right bucket via dt_htab_find_hval().
> >>>>>>>>
> >>>>>>>> This fixes an issue encountered when using a shared kernel type
> >>>>>>>> with alloca()ed memory; DTrace assumed the type was in ddefs
> >>>>>>>> and it wasn't so it wasn't displayed.  This change fixes that and
> >>>>>>>> all tests continue to pass.  Also tested that it works with
> >>>>>>>> kernel module-defined types now:
> >>>>>>>>
> >>>>>>>> dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
> >>>>>>>> CPU     ID                    FUNCTION:NAME
> >>>>>>>>   7 123161          ieee80211_rx_napi:entry 0xffff9f8980fa08e0 = *
> >>>>>>>>                                             (struct ieee80211_hw) {
> >>>>>>>>                                              .conf = (struct ieee80211_conf) {
> >>>>>>>>                                               .listen_interval = (u16)10,
> >>>>>>>>                                               .long_frame_max_tx_count = (u8)4,
> >>>>>>>>                                               .short_frame_max_tx_count = (u8)7,
> >>>>>>>>                                              },
> >>>>>>>>
> >>>>>>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> >>>>>>>> ---
> >>>>>>>>  libdtrace/dt_cg.c      |  7 ++++++-
> >>>>>>>>  libdtrace/dt_consume.c |  7 +++++--
> >>>>>>>>  libdtrace/dt_htab.c    | 17 +++++++++++++++++
> >>>>>>>>  libdtrace/dt_htab.h    |  2 ++
> >>>>>>>>  libdtrace/dt_impl.h    |  1 +
> >>>>>>>>  libdtrace/dt_module.c  | 30 ++++++++++++++++++++++++++++++
> >>>>>>>>  libdtrace/dt_module.h  |  1 +
> >>>>>>>>  libdtrace/dt_printf.c  | 12 +++++++++---
> >>>>>>>>  libdtrace/dt_printf.h  |  2 +-
> >>>>>>>>  9 files changed, 72 insertions(+), 7 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> >>>>>>>> index 27246a40..30cccdaf 100644
> >>>>>>>> --- a/libdtrace/dt_cg.c
> >>>>>>>> +++ b/libdtrace/dt_cg.c
> >>>>>>>> @@ -20,6 +20,7 @@
> >>>>>>>>  #include <dt_dctx.h>
> >>>>>>>>  #include <dt_cg.h>
> >>>>>>>>  #include <dt_grammar.h>
> >>>>>>>> +#include <dt_module.h>
> >>>>>>>>  #include <dt_parser.h>
> >>>>>>>>  #include <dt_printf.h>
> >>>>>>>>  #include <dt_provider.h>
> >>>>>>>> @@ -2832,7 +2833,9 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
> >>>>>>>>  	ctf_id_t	type = addr->dn_type;
> >>>>>>>>  	char		n[DT_TYPE_NAMELEN];
> >>>>>>>>  	size_t		size;
> >>>>>>>> +	dt_module_t	*dmp;
> >>>>>>>>  
> >>>>>>>> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
> >>>>>>>>  	type = ctf_type_reference(fp, type);
> >>>>>>>>  	if (type == CTF_ERR)
> >>>>>>>>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
> >>>>>>>> @@ -2842,9 +2845,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
> >>>>>>>>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
> >>>>>>>>  			ctf_type_name(fp, type, n, sizeof(n)));
> >>>>>>>>  
> >>>>>>>> -	/* reserve space for addr/type, data/size */
> >>>>>>>> +	/* reserve space for addr/type, module identification, data/size */
> >>>>>>>>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>>>>>>>  			      sizeof(uint64_t), 8, NULL, type);
> >>>>>>>> +	dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>>>>>>> +		   sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_id);
> >>>>>>>>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>>>>>>>  			      size, 8, NULL, size);
> >>>>>
> >>>>> Here you add a data item in the trace buffer that will actually not store
> >>>>> anything at all.  That got me thinking...  And then you store the data size
> >>>>> both as the specified size of the data item *and* as extra argument.  That use
> >>>>> of the extra argument is unnecessary since the size is already being added
> >>>>> to the record as dtrd_size (which gets its value from the 4th arg to
> >>>>> dt_rec_add().  That means we can use the dtrd_arg for something else.
> >>>>>
> >>>>> So...  how about you do the following:
> >>>>>
> >>>>> 	/* reserve space for addr and data (modname and type as extra arg) */
> >>>>> 	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>>>> 			      sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_name);
> >>>>
> >>>> Maybe I'm misunderstanding here but isn't there a concern if dmp goes
> >>>> away before we collect trace data this string will no longer be valid? I
> >>>> _think_ if we were to store the module name we'd need to store the
> >>>> string itself in the trace record. The module id approach was an attempt
> >>>> to remove the need to store and retrieve full strings while not exposing
> >>>> us to the potential risk of invalid pointer dereference. Sounds like the
> >>>> trace record storage implementation was inefficient but that was the
> >>>> intent at least.
> >>>
> >>> Easy... replace
> >>> 	(uint64_t)dmp->dm_name
> >>> above with
> >>> 	(uint64_t)strdup(dmp->dm_name)
> >>>
> >>
> >> Right but then I've got to
> >>
> >> - allocate a string per print() action
> >> - free them later (presumably on DTrace cleanup?)
> > 
> > These do not really pose an issue.  Unless there are going to be a very large
> > amount of print actions, but then again, we have similar situations elsewhere.
> > 
> >> - when consuming the record, I've got to compute the hash on the name
> >> string to do the module lookup by name, rather than by id where it is
> >> pre-computed at cg time. This adds overhead to each consume action.
> > 
> > I did a comparitive test between your v3 patch and a modified one that stores
> > a copy of the module name as dtrd_arg to the data record.  I honestly did not
> > notice a difference between the two approaches in terms of performance.  While
> > the use of a string causes a hash value to be calculated, using an id also
> > incurs additional cost in its processing.  From the looks of it, it is a bit
> > of a trade-off where we incur a higher cost.
> > 
> > My preference would be for using the name primarily because it does seem to
> > provide the same level of performance, but without adding additional support
> > in htab to make dm_id work, and also without adding the dm_id management code.
> > 
> 
> Okay, sounds good. One thing I'm unclear about still is where to free
> the module name string. I _think_ the right answer is to associate it
> with the pcb, strdup()ing to a pcb->pcb_modname string which can then be
> passed via the arg and later freed via dt_pcb_pop(). Is that the right
> approach or should it be freed in a different way? Thanks!

Ah no, if you do that then it will be freed after compilation of the clause,
which means that the record in the datadesc will have an invalid pointer in it.

Records and associated data are freed in dt_datadesc_release.  There is a loop
already to handle records that hold a printf format.

Which actually got me thinking...  it is a bit of a stretch perhaps, but the
easiest way to do this would actually be to make use of the printf format data
(dt_pfargv_t) which isn't entirely unreasonable because this is a formatted
print and its output is handled by a function in dt_printf.c anyway.  So, in
that case you do something like this in dt_cg_act_print():

	dt_pfargv_t	*pfp = dt_printf_create(dtp, dmp->dm_name);
...
	
	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
			      sizeof(uint64_t), 8, pfp, type);

and then you could even implement dt_print_type) as a regular printf-style
function without needing dt_print_print() to interpose.  Or alternatively,
use dt_print_print() to get the module name from dtrd_format->pfv_format,
and keep dt_print_type() as is.

Either way, the dt_printf_create() performs the strdup() and dt_printf_destroy()
(called from dt_datadesc_release)) will take care of it getting freed.

This is abusing the format string a little but on the other hand, one could
argue that the module name together with dtrd_arg specifying the ctf type does
in fact specify an output formatting.

	Kris
